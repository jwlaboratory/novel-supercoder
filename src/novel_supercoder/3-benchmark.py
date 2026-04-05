from __future__ import annotations

import argparse
import shlex
import sys
import tempfile
from pathlib import Path
from typing import Any

import pandas as pd

PROJECT_ROOT = Path(__file__).resolve().parents[2]
WORKSPACE_ROOT = Path(__file__).resolve().parents[3]
HYPERFINE_ROOT = WORKSPACE_ROOT / "infra" / "hyperfine"

DEFAULT_INPUT_CSV = PROJECT_ROOT / "data" / "codeforces_cpp_generated.csv"

DEFAULT_TARGET_COLUMN_CANDIDATES: dict[str, list[str]] = {
    "o0": ["assembly_o0"],
    "o1": ["assembly_o1"],
    "o2": ["assembly_o2"],
    "o3": ["assembly_o3"],
    "gemma": [
        "generated_google_gemma_3_4b_it_assembly",
        "generated_gemma4_assembly",
        "generated_gemma_assembly",
    ],
    "qwen2.5": [
        "generated_qwen_qwen2_5_coder_7b_instruct_assembly",
        "generated_qwen2_5_coder_7b_instruct_assembly",
        "generated_qwen2_5_assembly",
        "generated_qwen_assembly",
    ],
}

OFFICIAL_TESTS_COLUMN = "official_tests"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Benchmark assembly columns per CSV row using infra/hyperfine, "
            "including correctness checks on official tests."
        )
    )
    parser.add_argument(
        "--input-csv",
        type=Path,
        default=DEFAULT_INPUT_CSV,
        help="CSV file containing official_tests and assembly columns.",
    )
    parser.add_argument(
        "--output-csv",
        type=Path,
        default=None,
        help="Output CSV path. Defaults to --input-csv (in-place updates).",
    )
    parser.add_argument(
        "--tests-column",
        default=OFFICIAL_TESTS_COLUMN,
        help="Column containing official tests payload.",
    )
    parser.add_argument(
        "--targets",
        nargs="+",
        default=["o0", "o1", "o2", "o3", "gemma", "qwen2.5"],
        help="Benchmark targets to evaluate.",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Optional max number of rows to process.",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Re-run benchmarks even if result columns already have values.",
    )
    parser.add_argument(
        "--runs",
        type=int,
        default=20,
        help="Hyperfine timed runs per candidate.",
    )
    parser.add_argument(
        "--hyperfine-warmup",
        type=int,
        default=3,
        help="Hyperfine warmup runs per candidate.",
    )
    parser.add_argument(
        "--hyperfine-prepare",
        default=None,
        help="Optional command passed to hyperfine --prepare.",
    )
    parser.add_argument(
        "--exec-timeout",
        type=float,
        default=10.0,
        help="Per execution timeout for tests and benchmark iterations.",
    )
    parser.add_argument(
        "--docker-timeout",
        type=float,
        default=1200.0,
        help="Wall-clock timeout for a full benchmark subprocess.",
    )
    parser.add_argument(
        "--use-docker",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="Run benchmark script in Docker.",
    )
    parser.add_argument(
        "--docker-image",
        default="gcc:13",
        help="Docker image used when --use-docker.",
    )
    parser.add_argument(
        "--docker-platform",
        default="linux/arm64",
        help="Docker platform used when --use-docker.",
    )
    parser.add_argument(
        "--strict-output",
        action="store_true",
        help="Use strict stdout matching for tests.",
    )
    parser.add_argument(
        "--extra-asm-flags",
        default=None,
        help="Extra assembler/compiler flags for assembly compile command.",
    )
    parser.add_argument(
        "--extra-ldflags",
        default="-lstdc++",
        help="Extra linker flags for assembly compile command.",
    )
    return parser.parse_args()


def _ensure_hyperfine_imports() -> tuple[Any, Any, Any, Any]:
    if str(HYPERFINE_ROOT) not in sys.path:
        sys.path.insert(0, str(HYPERFINE_ROOT))
    try:
        from hyperfine_bench.bench import BenchConfig, finish, run_benchmark
        from hyperfine_bench.parse_tests import parse_tests_payload
    except ImportError as exc:
        raise RuntimeError(
            "Unable to import hyperfine_bench from infra/hyperfine. "
            "Install it first with: pip install -e infra/hyperfine"
        ) from exc
    return BenchConfig, run_benchmark, finish, parse_tests_payload


def _split_flags(raw: str | None) -> tuple[str, ...]:
    if raw is None or not raw.strip():
        return ()
    return tuple(shlex.split(raw))


def _resolve_target_columns(dataframe: pd.DataFrame, targets: list[str]) -> dict[str, str]:
    resolved: dict[str, str] = {}
    for target in targets:
        normalized = target.strip().lower()
        if normalized not in DEFAULT_TARGET_COLUMN_CANDIDATES:
            raise ValueError(
                f"Unknown target: {target!r}. Supported: {sorted(DEFAULT_TARGET_COLUMN_CANDIDATES)}"
            )
        candidates = DEFAULT_TARGET_COLUMN_CANDIDATES[normalized]
        chosen = next((column for column in candidates if column in dataframe.columns), None)
        if chosen is not None:
            resolved[normalized] = chosen
    return resolved


def _ensure_output_columns(dataframe: pd.DataFrame, targets: list[str]) -> None:
    for target in targets:
        for suffix in (
            "source_column",
            "ok",
            "correctness_passed",
            "script_exit_code",
            "timing_count",
            "mean_s",
            "median_s",
            "stddev_s",
            "min_s",
            "max_s",
            "reason",
            "error",
        ):
            column = f"benchmark_{target}_{suffix}"
            if column not in dataframe.columns:
                dataframe[column] = ""


def _checkpoint_write(dataframe: pd.DataFrame, output_csv: Path) -> None:
    temp_path = output_csv.with_name(f"{output_csv.name}.tmp")
    dataframe.to_csv(temp_path, index=False)
    temp_path.replace(output_csv)


def _has_existing_result(row: pd.Series, target: str) -> bool:
    marker = row.get(f"benchmark_{target}_mean_s", "")
    return bool(str(marker).strip())


def _run_single_benchmark(
    *,
    asm_code: str,
    tests_payload: str,
    args: argparse.Namespace,
    BenchConfig: Any,
    run_benchmark: Any,
    finish: Any,
    parse_tests_payload: Any,
) -> dict[str, Any]:
    tests = tuple(parse_tests_payload(tests_payload))
    with tempfile.TemporaryDirectory(prefix="novel-supercoder-bench-") as temp_dir_str:
        temp_dir = Path(temp_dir_str)
        asm_path = temp_dir / "candidate.s"
        asm_path.write_text(asm_code, encoding="utf-8")

        outcome = run_benchmark(
            BenchConfig(
                assembly_path=asm_path,
                reference_path=None,
                language="cpp",
                tests=tests,
                runs=max(1, int(args.runs)),
                only_compile=False,
                skip_compile=False,
                use_docker=bool(args.use_docker),
                docker_image=args.docker_image,
                docker_platform=args.docker_platform,
                docker_timeout_s=max(float(args.docker_timeout), 1.0),
                exec_timeout_s=max(float(args.exec_timeout), 0.001),
                extra_asm=_split_flags(args.extra_asm_flags),
                extra_c=(),
                extra_ld=_split_flags(args.extra_ldflags),
                strict_output_compare=bool(args.strict_output),
                timing_input_path=None,
                keep_workspace=None,
                hyperfine_warmup=max(0, int(args.hyperfine_warmup)),
                hyperfine_prepare=args.hyperfine_prepare,
            )
        )
        try:
            return outcome.report
        finally:
            finish(outcome)


def main() -> None:
    args = parse_args()
    input_csv = args.input_csv
    output_csv = args.output_csv or args.input_csv

    if not input_csv.exists():
        raise FileNotFoundError(f"Input CSV not found: {input_csv}")
    if not HYPERFINE_ROOT.exists():
        raise FileNotFoundError(f"Hyperfine module path not found: {HYPERFINE_ROOT}")

    dataframe = pd.read_csv(input_csv, keep_default_na=False).copy()
    if args.tests_column not in dataframe.columns:
        raise ValueError(f"Missing required tests column: {args.tests_column}")

    targets = [target.strip().lower() for target in args.targets if target.strip()]
    if not targets:
        raise ValueError("No targets were provided.")

    target_column_map = _resolve_target_columns(dataframe, targets)
    if not target_column_map:
        raise ValueError(
            "None of the requested targets matched CSV columns. "
            f"Requested={targets}."
        )

    missing_targets = [target for target in targets if target not in target_column_map]
    if missing_targets:
        print(f"Skipping targets with no matching columns: {missing_targets}")

    active_targets = [target for target in targets if target in target_column_map]
    _ensure_output_columns(dataframe, active_targets)

    if args.limit is not None:
        row_indices = list(range(min(len(dataframe), max(args.limit, 0))))
    else:
        row_indices = list(range(len(dataframe)))

    BenchConfig, run_benchmark, finish, parse_tests_payload = _ensure_hyperfine_imports()

    output_csv.parent.mkdir(parents=True, exist_ok=True)
    total_jobs = len(row_indices) * len(active_targets)
    completed_jobs = 0

    for row_idx in row_indices:
        tests_payload = str(dataframe.at[row_idx, args.tests_column])
        problem_id = str(dataframe.at[row_idx, "problem_id"]) if "problem_id" in dataframe.columns else f"row-{row_idx}"

        for target in active_targets:
            completed_jobs += 1
            source_col = target_column_map[target]
            asm_code = str(dataframe.at[row_idx, source_col])

            print(f"[{completed_jobs}/{total_jobs}] {problem_id} target={target}")

            dataframe.at[row_idx, f"benchmark_{target}_source_column"] = source_col

            if not asm_code.strip():
                dataframe.at[row_idx, f"benchmark_{target}_ok"] = "false"
                dataframe.at[row_idx, f"benchmark_{target}_correctness_passed"] = ""
                dataframe.at[row_idx, f"benchmark_{target}_reason"] = "missing_assembly"
                dataframe.at[row_idx, f"benchmark_{target}_error"] = "Assembly column is empty."
                continue

            if _has_existing_result(dataframe.loc[row_idx], target) and not args.force:
                print(f"  -> skipped existing benchmark_{target}_mean_s (use --force to rerun)")
                continue

            try:
                report = _run_single_benchmark(
                    asm_code=asm_code,
                    tests_payload=tests_payload,
                    args=args,
                    BenchConfig=BenchConfig,
                    run_benchmark=run_benchmark,
                    finish=finish,
                    parse_tests_payload=parse_tests_payload,
                )
            except Exception as exc:
                dataframe.at[row_idx, f"benchmark_{target}_ok"] = "false"
                dataframe.at[row_idx, f"benchmark_{target}_reason"] = "benchmark_exception"
                dataframe.at[row_idx, f"benchmark_{target}_error"] = str(exc)
                print(f"  -> exception: {exc}")
                continue

            timing = report.get("timing", {})
            assembly_timing = timing.get("assembly", {}) if isinstance(timing, dict) else {}
            correctness = report.get("correctness", {})

            dataframe.at[row_idx, f"benchmark_{target}_ok"] = "true" if report.get("ok") else "false"
            dataframe.at[row_idx, f"benchmark_{target}_correctness_passed"] = (
                str(bool(correctness.get("all_passed"))).lower()
                if isinstance(correctness, dict) and correctness.get("enabled") is not False
                else ""
            )
            dataframe.at[row_idx, f"benchmark_{target}_script_exit_code"] = str(
                report.get("script_exit_code", "")
            )
            dataframe.at[row_idx, f"benchmark_{target}_timing_count"] = str(
                assembly_timing.get("count", "")
            )
            dataframe.at[row_idx, f"benchmark_{target}_mean_s"] = str(
                assembly_timing.get("mean_s", "")
            )
            dataframe.at[row_idx, f"benchmark_{target}_median_s"] = str(
                assembly_timing.get("median_s", "")
            )
            dataframe.at[row_idx, f"benchmark_{target}_stddev_s"] = str(
                assembly_timing.get("stddev_s", "")
            )
            dataframe.at[row_idx, f"benchmark_{target}_min_s"] = str(
                assembly_timing.get("min_s", "")
            )
            dataframe.at[row_idx, f"benchmark_{target}_max_s"] = str(
                assembly_timing.get("max_s", "")
            )
            dataframe.at[row_idx, f"benchmark_{target}_reason"] = str(
                timing.get("reason", "") if isinstance(timing, dict) else ""
            )
            script_stderr = str(report.get("script_stderr", ""))
            dataframe.at[row_idx, f"benchmark_{target}_error"] = script_stderr[:1000]

        _checkpoint_write(dataframe, output_csv)
        print(f"  -> checkpoint saved: {output_csv}")

    print(f"Benchmarking complete. Updated CSV: {output_csv}")


if __name__ == "__main__":
    main()
