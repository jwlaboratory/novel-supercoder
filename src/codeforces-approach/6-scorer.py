from __future__ import annotations

import argparse
import ast
import json
import math
import os
import statistics
import subprocess
import tempfile
import time
from pathlib import Path

DEFAULT_COMPILER = "g++"
DEFAULT_CPP_STD = "gnu++17"
DEFAULT_BENCHMARK_TRIALS = 30
DEFAULT_TIMEOUT_SECONDS = 2.0
DEFAULT_BENCHMARK_TEST_LIMIT = 5
DEFAULT_COMPILE_FAILURE_REWARD = -1500.0
DEFAULT_CORRECTNESS_FAILURE_REWARD = -1000.0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Score a candidate assembly program from stdin JSON. The script prints "
            "one JSON object to stdout containing correctness, benchmark, and reward data."
        )
    )
    parser.add_argument(
        "--benchmark-trials",
        type=int,
        default=DEFAULT_BENCHMARK_TRIALS,
        help="Number of benchmark trials per binary once correctness passes.",
    )
    parser.add_argument(
        "--execution-timeout-seconds",
        type=float,
        default=DEFAULT_TIMEOUT_SECONDS,
        help="Timeout for one program execution during correctness testing.",
    )
    parser.add_argument(
        "--benchmark-timeout-seconds",
        type=float,
        default=DEFAULT_TIMEOUT_SECONDS,
        help="Timeout for one program execution during benchmarking.",
    )
    parser.add_argument(
        "--benchmark-test-limit",
        type=int,
        default=DEFAULT_BENCHMARK_TEST_LIMIT,
        help="Maximum number of official tests to use for runtime benchmarking.",
    )
    parser.add_argument(
        "--compiler",
        default=DEFAULT_COMPILER,
        help="Compiler/linker command used to build source or assembly programs.",
    )
    parser.add_argument(
        "--cpp-std",
        default=DEFAULT_CPP_STD,
        help="C++ standard to use when compiling source fallbacks.",
    )
    return parser.parse_args()


def normalize_output(text: str) -> str:
    return text.replace("\r\n", "\n").strip()


def parse_official_tests(raw_value: object) -> list[dict[str, str]]:
    if isinstance(raw_value, list):
        items = raw_value
    else:
        text = str(raw_value).strip()
        if not text:
            return []

        parse_attempts = [text, text.replace("}\n {", "},\n {").replace("} {", "}, {")]
        items = None
        for attempt in parse_attempts:
            try:
                items = json.loads(attempt)
                break
            except json.JSONDecodeError:
                try:
                    items = ast.literal_eval(attempt)
                    break
                except (ValueError, SyntaxError):
                    continue

        if items is None:
            raise ValueError("Unable to parse official_tests payload.")

    if isinstance(items, dict):
        items = [items]

    tests: list[dict[str, str]] = []
    for item in items:
        if not isinstance(item, dict):
            continue
        tests.append(
            {
                "input": str(item.get("input", "")),
                "output": str(item.get("output", "")),
            }
        )
    return tests


def run_command(command: list[str], timeout: float | None = None) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        command,
        text=True,
        capture_output=True,
        timeout=timeout,
        check=False,
    )


def compile_assembly_text(assembly_text: str, output_path: Path, compiler: str) -> tuple[bool, str]:
    assembly_path = output_path.with_suffix(".s")
    assembly_path.write_text(assembly_text)
    result = run_command([compiler, str(assembly_path), "-o", str(output_path)])
    error_text = result.stderr.strip() or result.stdout.strip()
    return result.returncode == 0, error_text


def compile_source_text(source_text: str, output_path: Path, compiler: str, cpp_std: str, opt_level: str) -> tuple[bool, str]:
    source_path = output_path.with_suffix(".cpp")
    source_path.write_text(source_text)
    result = run_command(
        [compiler, f"-std={cpp_std}", opt_level, str(source_path), "-o", str(output_path)]
    )
    error_text = result.stderr.strip() or result.stdout.strip()
    return result.returncode == 0, error_text


def execute_binary(binary_path: Path, test_input: str, timeout_seconds: float) -> tuple[bool, str, str, int, float]:
    started = time.perf_counter()
    try:
        result = subprocess.run(
            [str(binary_path)],
            input=test_input,
            text=True,
            capture_output=True,
            timeout=timeout_seconds,
            check=False,
        )
        elapsed = time.perf_counter() - started
        return True, result.stdout, result.stderr, result.returncode, elapsed
    except subprocess.TimeoutExpired:
        elapsed = time.perf_counter() - started
        return False, "", "Execution timed out", 124, elapsed


def evaluate_correctness(binary_path: Path, tests: list[dict[str, str]], timeout_seconds: float) -> dict[str, object]:
    mismatches: list[dict[str, object]] = []
    passed = 0

    for index, test in enumerate(tests):
        ok, stdout, stderr, returncode, elapsed = execute_binary(
            binary_path=binary_path,
            test_input=test["input"],
            timeout_seconds=timeout_seconds,
        )
        expected_output = normalize_output(test["output"])
        actual_output = normalize_output(stdout)
        passed_this_test = ok and returncode == 0 and actual_output == expected_output
        if passed_this_test:
            passed += 1
            continue

        mismatches.append(
            {
                "test_index": index,
                "expected_output": expected_output[:500],
                "actual_output": actual_output[:500],
                "stderr": stderr[:500],
                "return_code": returncode,
                "elapsed_seconds": elapsed,
                "timed_out": not ok,
            }
        )

    total = len(tests)
    return {
        "passed_tests": passed,
        "total_tests": total,
        "all_passed": passed == total,
        "correctness_fraction": (passed / total) if total else 0.0,
        "mismatches": mismatches[:3],
    }


def benchmark_binary(
    binary_path: Path,
    tests: list[dict[str, str]],
    trials: int,
    timeout_seconds: float,
) -> dict[str, object]:
    trial_totals: list[float] = []
    for _ in range(trials):
        total_elapsed = 0.0
        for test in tests:
            ok, _, _, returncode, elapsed = execute_binary(
                binary_path=binary_path,
                test_input=test["input"],
                timeout_seconds=timeout_seconds,
            )
            if not ok or returncode != 0:
                return {
                    "ok": False,
                    "median_seconds": None,
                    "details": "Benchmark execution failed or timed out.",
                }
            total_elapsed += elapsed
        trial_totals.append(total_elapsed)

    return {
        "ok": True,
        "median_seconds": statistics.median(trial_totals),
        "min_seconds": min(trial_totals),
        "max_seconds": max(trial_totals),
    }


def log_speedup(baseline: float | None, candidate: float | None) -> float:
    if baseline is None or candidate is None or baseline <= 0 or candidate <= 0:
        return 0.0
    return math.log(baseline / candidate)


def compute_reward(
    correctness_fraction: float,
    candidate_runtime: float | None,
    o0_runtime: float | None,
    o3_runtime: float | None,
    candidate_size: int | None,
    o3_size: int | None,
) -> float:
    if correctness_fraction < 1.0:
        return DEFAULT_CORRECTNESS_FAILURE_REWARD + (250.0 * correctness_fraction)

    reward = 100.0
    reward += 50.0 * log_speedup(o3_runtime, candidate_runtime)
    reward += 15.0 * log_speedup(o0_runtime, candidate_runtime)
    if candidate_size and o3_size and candidate_size > 0 and o3_size > 0:
        reward += 5.0 * math.log(o3_size / candidate_size)
    return reward


def build_or_fallback_binary(
    *,
    preferred_assembly: str,
    output_path: Path,
    compiler: str,
    source_text: str,
    cpp_std: str,
    fallback_opt_level: str,
) -> tuple[bool, str]:
    if preferred_assembly.strip():
        return compile_assembly_text(preferred_assembly, output_path, compiler)
    return compile_source_text(source_text, output_path, compiler, cpp_std, fallback_opt_level)


def score_payload(payload: dict[str, object], args: argparse.Namespace) -> dict[str, object]:
    tests = parse_official_tests(payload.get("official_tests", ""))
    if not tests:
        return {
            "reward": DEFAULT_CORRECTNESS_FAILURE_REWARD,
            "status": "no_tests",
            "message": "No official tests were available for scoring.",
        }

    candidate_assembly = str(payload.get("candidate_assembly", ""))
    source_text = str(payload.get("accepted_cpp_solution", ""))
    assembly_o0 = str(payload.get("assembly_o0", ""))
    assembly_o3 = str(payload.get("assembly_o3", ""))

    with tempfile.TemporaryDirectory() as temp_dir_str:
        temp_dir = Path(temp_dir_str)
        candidate_binary = temp_dir / "candidate.out"
        o0_binary = temp_dir / "o0.out"
        o3_binary = temp_dir / "o3.out"

        candidate_ok, candidate_error = compile_assembly_text(
            candidate_assembly,
            candidate_binary,
            args.compiler,
        )
        if not candidate_ok:
            return {
                "reward": DEFAULT_COMPILE_FAILURE_REWARD,
                "status": "candidate_compile_failed",
                "candidate_compile_ok": False,
                "candidate_compile_error": candidate_error,
            }

        o0_ok, o0_error = build_or_fallback_binary(
            preferred_assembly=assembly_o0,
            output_path=o0_binary,
            compiler=args.compiler,
            source_text=source_text,
            cpp_std=args.cpp_std,
            fallback_opt_level="-O0",
        )
        o3_ok, o3_error = build_or_fallback_binary(
            preferred_assembly=assembly_o3,
            output_path=o3_binary,
            compiler=args.compiler,
            source_text=source_text,
            cpp_std=args.cpp_std,
            fallback_opt_level="-O3",
        )

        correctness = evaluate_correctness(
            candidate_binary,
            tests,
            args.execution_timeout_seconds,
        )

        benchmark_tests = tests[: args.benchmark_test_limit] if args.benchmark_test_limit > 0 else tests

        candidate_benchmark = None
        o0_benchmark = None
        o3_benchmark = None
        if correctness["all_passed"]:
            candidate_benchmark = benchmark_binary(
                candidate_binary,
                benchmark_tests,
                args.benchmark_trials,
                args.benchmark_timeout_seconds,
            )
            if o0_ok:
                o0_benchmark = benchmark_binary(
                    o0_binary,
                    benchmark_tests,
                    args.benchmark_trials,
                    args.benchmark_timeout_seconds,
                )
            if o3_ok:
                o3_benchmark = benchmark_binary(
                    o3_binary,
                    benchmark_tests,
                    args.benchmark_trials,
                    args.benchmark_timeout_seconds,
                )

        candidate_size = os.path.getsize(candidate_binary) if candidate_binary.exists() else None
        o0_size = os.path.getsize(o0_binary) if o0_binary.exists() else None
        o3_size = os.path.getsize(o3_binary) if o3_binary.exists() else None

        candidate_runtime = (
            candidate_benchmark["median_seconds"]
            if candidate_benchmark and candidate_benchmark.get("ok")
            else None
        )
        o0_runtime = o0_benchmark["median_seconds"] if o0_benchmark and o0_benchmark.get("ok") else None
        o3_runtime = o3_benchmark["median_seconds"] if o3_benchmark and o3_benchmark.get("ok") else None

        reward = compute_reward(
            correctness_fraction=float(correctness["correctness_fraction"]),
            candidate_runtime=candidate_runtime,
            o0_runtime=o0_runtime,
            o3_runtime=o3_runtime,
            candidate_size=candidate_size,
            o3_size=o3_size,
        )

        return {
            "reward": reward,
            "status": "ok" if correctness["all_passed"] else "correctness_failed",
            "candidate_compile_ok": True,
            "candidate_compile_error": candidate_error,
            "o0_compile_ok": o0_ok,
            "o0_compile_error": o0_error,
            "o3_compile_ok": o3_ok,
            "o3_compile_error": o3_error,
            "correctness": correctness,
            "benchmark": {
                "benchmark_trials": args.benchmark_trials,
                "benchmark_test_count": len(benchmark_tests),
                "candidate": candidate_benchmark,
                "o0": o0_benchmark,
                "o3": o3_benchmark,
            },
            "sizes": {
                "candidate_bytes": candidate_size,
                "o0_bytes": o0_size,
                "o3_bytes": o3_size,
            },
        }


def main() -> None:
    args = parse_args()
    payload = json.loads(input())
    result = score_payload(payload, args)
    print(json.dumps(result))


if __name__ == "__main__":
    main()
