#!/usr/bin/env python3
"""Stage 3: Identify failed assembly generations and build debug training data.

Reads supercoder_{split}_with_inference.csv, compiles and tests each row's
generated assembly inside a Linux x86-64 Docker container (required — x86-64
gcc is the only correct environment; see SUPERCOMPARISON_EXPERIMENTS_GUIDE.md),
then writes supercoder_{split}_fails.csv with only the failed rows plus a
debug prompt suitable for RL fine-tuning.

Requires:
    - Docker with the supercoder-x86-bench image (ubuntu:22.04 + gcc + python3)
      Build: docker build -f <repo>/old-experiments/experiments/run-their-paper-exactly/docker/x86_64-benchmark.Dockerfile -t supercoder-x86-bench .
    - supercoder_{split}_with_inference.csv from stage 2

Usage:
    uv run python 3-identify-fails.py --split val
    uv run python 3-identify-fails.py --split train --docker-image supercoder-x86-bench
    uv run python 3-identify-fails.py --split val --batch-size 100
"""
from __future__ import annotations

import argparse
import csv
import json
import subprocess
import sys
import tempfile
from pathlib import Path

from datasets import load_dataset

CSV_DIR = Path(__file__).resolve().parent
DOCKER_IMAGE_DEFAULT = "supercoder-x86-bench"
MAX_TESTS_DEFAULT = 10
BATCH_SIZE_DEFAULT = 200

# ---------------------------------------------------------------------------
# Debug prompt template for RL training data
# ---------------------------------------------------------------------------

DEBUG_PROMPT_TEMPLATE = """\
You are an expert x86-64 assembly programmer. Fix the following incorrectly \
optimized assembly code for x86-64 Linux (compiled with gcc, linked with -lm). \
The assembly must compile with `gcc <file>.s -o <file> -lm` and produce correct \
output for all test cases. Output ONLY the corrected x86-64 assembly code — no \
explanations, no markdown fences, no additional text.

The error is:
{error}

The correct C code is:
{c_code}

The incorrectly optimized assembly is:
{bad_assembly}

Generated, correct but still optimized assembly:
"""

# ---------------------------------------------------------------------------
# Runner script — executes inside Docker (Python 3 stdlib only, no pip deps)
# Compiles each row's assembly with gcc, runs test I/O, writes results.json.
# ---------------------------------------------------------------------------

_DOCKER_RUNNER = r"""#!/usr/bin/env python3
import json, subprocess, sys
from pathlib import Path

work = Path(sys.argv[1])
results = {}

for row_dir in sorted(work.glob("row_*")):
    idx = row_dir.name[4:]
    asm_path = row_dir / "gen.s"
    bin_path = row_dir / "gen.bin"
    tests_path = row_dir / "tests.json"
    res = {"compile_passed": False, "test_passed": False, "error": ""}

    if not asm_path.exists() or asm_path.stat().st_size == 0:
        res["error"] = "Empty or missing assembly"
        results[idx] = res
        print(f"[{idx}] FAIL: no assembly", flush=True)
        continue

    # ---- compile with gcc (must be Linux x86-64) ----
    try:
        cr = subprocess.run(
            ["gcc", str(asm_path), "-o", str(bin_path), "-lm"],
            capture_output=True, text=True, timeout=45,
        )
    except subprocess.TimeoutExpired:
        res["error"] = "Compile timeout (45s)"
        results[idx] = res
        print(f"[{idx}] FAIL: compile timeout", flush=True)
        continue

    if cr.returncode != 0:
        res["error"] = "Compile error:\n" + cr.stderr[:2000]
        results[idx] = res
        print(f"[{idx}] FAIL: compile error", flush=True)
        continue

    res["compile_passed"] = True

    # ---- run test cases ----
    try:
        tests = json.loads(tests_path.read_text())
    except Exception:
        tests = []

    if not tests:
        res["error"] = "No test cases available"
        results[idx] = res
        print(f"[{idx}] FAIL: no tests", flush=True)
        continue

    all_ok = True
    fail_detail = ""
    for i, t in enumerate(tests):
        inp = t.get("input", "")
        exp = t.get("output", "")
        try:
            tr = subprocess.run(
                [str(bin_path)], input=inp,
                capture_output=True, text=True, timeout=10,
            )
        except subprocess.TimeoutExpired:
            all_ok = False
            fail_detail = f"Test {i}: timeout (10s)"
            break
        if tr.returncode != 0:
            all_ok = False
            fail_detail = (
                f"Test {i}: runtime error (exit {tr.returncode})\n"
                + tr.stderr[:500]
            )
            break
        if tr.stdout != exp:
            all_ok = False
            fail_detail = (
                f"Test {i}: output mismatch\n"
                f"Expected: {repr(exp[:300])}\n"
                f"Actual:   {repr(tr.stdout[:300])}"
            )
            break

    res["test_passed"] = all_ok
    if not all_ok:
        res["error"] = fail_detail

    tag = "PASS" if all_ok else "FAIL"
    print(f"[{idx}] {tag}: compile=OK test={'OK' if all_ok else 'FAIL'}", flush=True)
    results[idx] = res

(work / "results.json").write_text(json.dumps(results, indent=2))
total = len(results)
passed = sum(1 for r in results.values() if r["compile_passed"] and r["test_passed"])
compiled = sum(1 for r in results.values() if r["compile_passed"])
print(f"\nDone: {total} rows, {compiled} compiled ({compiled*100//max(total,1)}%), "
      f"{passed} passed all tests ({passed*100//max(total,1)}%)")
"""

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def clean_assembly(asm: str) -> str:
    """Strip markdown fences that the model sometimes wraps around assembly."""
    asm = asm.strip()
    if asm.startswith("```"):
        lines = asm.split("\n")
        if lines[0].startswith("```"):
            lines = lines[1:]
        if lines and lines[-1].strip() == "```":
            lines = lines[:-1]
        asm = "\n".join(lines)
    return asm.strip()


def _safe_extra(item: dict) -> dict:
    extra = item.get("extra_info", {})
    if isinstance(extra, list) and extra:
        first = extra[0]
        if isinstance(first, dict):
            return first
    return extra if isinstance(extra, dict) else {}


def load_inference_csv(path: Path) -> list[dict]:
    if not path.exists():
        raise FileNotFoundError(f"Inference CSV not found: {path}")
    csv.field_size_limit(sys.maxsize)
    with path.open("r", encoding="utf-8") as f:
        return list(csv.DictReader(f))


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------


def _run_batch(
    batch_rows: list[dict],
    docker_image: str,
    max_tests: int,
) -> dict[str, dict]:
    """Run a single batch of rows inside Docker; return partial results dict."""
    with tempfile.TemporaryDirectory() as tmpdir:
        work = Path(tmpdir)

        for row in batch_rows:
            idx = row["problem_idx"]
            row_dir = work / f"row_{idx}"
            row_dir.mkdir()

            asm = clean_assembly(row.get("qwen_assembly", ""))
            if asm.startswith("ERROR:"):
                asm = ""
            (row_dir / "gen.s").write_text(asm, encoding="utf-8")

            tests = json.loads(row.get("test_cases", "[]"))
            (row_dir / "tests.json").write_text(
                json.dumps(tests[:max_tests], ensure_ascii=False),
                encoding="utf-8",
            )

        (work / "runner.py").write_text(_DOCKER_RUNNER, encoding="utf-8")

        proc = subprocess.run(
            [
                "docker", "run", "--rm", "--platform", "linux/amd64",
                "-v", f"{work}:/work",
                docker_image,
                "python3", "/work/runner.py", "/work",
            ],
        )

        results_file = work / "results.json"
        if results_file.exists():
            return json.loads(results_file.read_text(encoding="utf-8"))

        if proc.returncode != 0:
            print(
                f"  WARNING: Docker exited {proc.returncode} and no results.json "
                f"(OOM kill if 137). Marking batch rows as unknown failures.",
                file=sys.stderr,
            )
            partial: dict[str, dict] = {}
            for row in batch_rows:
                idx = str(row["problem_idx"])
                partial[idx] = {
                    "compile_passed": False,
                    "test_passed": False,
                    "error": f"Docker container killed (exit {proc.returncode})",
                }
            return partial

        return {}


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Identify failed assembly generations and build debug RL training CSV."
    )
    parser.add_argument("--split", required=True, choices=["train", "val"])
    parser.add_argument(
        "--docker-image", default=DOCKER_IMAGE_DEFAULT,
        help=f"Docker image with Linux x86-64 gcc (default: {DOCKER_IMAGE_DEFAULT}).",
    )
    parser.add_argument(
        "--max-tests", type=int, default=MAX_TESTS_DEFAULT,
        help=f"Max test cases per row (default: {MAX_TESTS_DEFAULT}).",
    )
    parser.add_argument(
        "--batch-size", type=int, default=BATCH_SIZE_DEFAULT,
        help=f"Rows per Docker invocation (default: {BATCH_SIZE_DEFAULT}).",
    )
    args = parser.parse_args()

    # 1. Load inference CSV --------------------------------------------------
    csv_path = CSV_DIR / f"supercoder_{args.split}_with_inference.csv"
    rows = load_inference_csv(csv_path)
    print(f"Loaded {len(rows)} rows from {csv_path.name}")

    # 2. Load HF dataset for c_code -----------------------------------------
    print("Loading HF dataset for c_code …")
    ds = load_dataset("random1123anonymized/supercoder", split=args.split)
    c_code_map: dict[int, str] = {}
    for i, item in enumerate(ds):
        extra = _safe_extra(item)
        c_code_map[i] = extra.get("c_code", "")
    print(f"  {len(c_code_map)} c_code entries loaded")

    # 3. Run compile + test in batched Docker containers ---------------------
    results: dict[str, dict] = {}
    n_batches = (len(rows) + args.batch_size - 1) // args.batch_size

    for batch_num in range(n_batches):
        start = batch_num * args.batch_size
        end = min(start + args.batch_size, len(rows))
        batch = rows[start:end]
        print(
            f"\n--- Batch {batch_num + 1}/{n_batches} "
            f"(rows {start}–{end - 1}, n={len(batch)}) "
            f"[Docker: {args.docker_image}] ---"
        )
        batch_results = _run_batch(batch, args.docker_image, args.max_tests)
        results.update(batch_results)
        print(f"  Batch done — {len(batch_results)} results collected")

    # 4. Build fails CSV -----------------------------------------------------
    out_fields = [
        "problem_idx",
        "compile_passed",
        "test_passed",
        "error",
        "c_code",
        "qwen_assembly",
        "debug_prompt",
    ]
    out_path = CSV_DIR / f"supercoder_{args.split}_fails.csv"

    n_fail = 0
    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=out_fields)
        writer.writeheader()

        for row in rows:
            idx = str(row["problem_idx"])
            res = results.get(idx, {})

            if res.get("compile_passed") and res.get("test_passed"):
                continue

            c_code = c_code_map.get(int(idx), "")
            bad_asm = row.get("qwen_assembly", "")
            error = res.get("error", "unknown")

            prompt = DEBUG_PROMPT_TEMPLATE.format(
                error=error,
                c_code=c_code,
                bad_assembly=bad_asm,
            )

            writer.writerow(
                {
                    "problem_idx": idx,
                    "compile_passed": res.get("compile_passed", False),
                    "test_passed": res.get("test_passed", False),
                    "error": error,
                    "c_code": c_code,
                    "qwen_assembly": bad_asm,
                    "debug_prompt": prompt,
                }
            )
            n_fail += 1

    total = len(rows)
    n_compiled = sum(1 for r in results.values() if r.get("compile_passed"))
    n_test_passed = sum(1 for r in results.values() if r.get("test_passed"))

    print(f"\n{'='*50}")
    print(f"  Total rows:      {total}")
    print(f"  Compiled:        {n_compiled}/{total} ({n_compiled*100/max(total,1):.1f}%)")
    print(f"  Passed tests:    {n_test_passed}/{total} ({n_test_passed*100/max(total,1):.1f}%)")
    print(f"  Failed rows:     {n_fail}/{total} ({n_fail*100/max(total,1):.1f}%)")
    print(f"{'='*50}")
    print(f"Output: {out_path}")


if __name__ == "__main__":
    main()
