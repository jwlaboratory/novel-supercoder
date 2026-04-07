#!/usr/bin/env python3
"""
Build a flat dataframe from the filtered CodeNet output.

Each row = one submission:
  problem_id  |  submission_id  |  code  |  test_cases (JSON array)

test_cases column looks like:
  [{"input": "5\n1 2 3 4 5", "output": "15"}, ...]

Outputs CSV and (optionally) Parquet.
"""

import argparse
import csv
import json
import sys
from pathlib import Path


def parse_args():
    p = argparse.ArgumentParser(description="Build a per-submission dataframe from filtered CodeNet data")
    p.add_argument(
        "--input-dir",
        default="filtered_codenet_c",
        help="Directory produced by filter.py (default: filtered_codenet_c)",
    )
    p.add_argument(
        "--output", "-o",
        default="codenet_c_dataset",
        help="Output filename without extension (default: codenet_c_dataset)",
    )
    p.add_argument(
        "--format", "-f",
        choices=["csv", "parquet", "both"],
        default="csv",
        help="Output format (default: csv). 'parquet' requires pandas + pyarrow.",
    )
    p.add_argument(
        "--max-test-cases",
        type=int,
        default=0,
        help="Cap test cases per problem (0 = all)",
    )
    return p.parse_args()


def tc_sort_key(path: Path) -> int:
    try:
        return int(path.stem.split(".")[1])
    except (IndexError, ValueError):
        return 0


def load_test_cases(tc_dir: Path, cap: int) -> str:
    """Return test cases as a JSON string: [{"input": ..., "output": ...}, ...]"""
    if not tc_dir.exists():
        return "[]"

    inputs = sorted(tc_dir.glob("input.*.txt"), key=tc_sort_key)
    if cap:
        inputs = inputs[:cap]

    cases = []
    for inp_file in inputs:
        idx = inp_file.stem.split(".")[1]
        out_file = tc_dir / f"output.{idx}.txt"
        tc = {"input": inp_file.read_text(encoding="utf-8", errors="replace").strip()}
        if out_file.exists():
            tc["output"] = out_file.read_text(encoding="utf-8", errors="replace").strip()
        cases.append(tc)

    return json.dumps(cases, ensure_ascii=False)


def build_rows(input_dir: Path, tc_cap: int):
    problem_dirs = sorted(
        [d for d in input_dir.iterdir() if d.is_dir()],
        key=lambda d: d.name,
    )

    rows = []
    for pdir in problem_dirs:
        pid = pdir.name
        sol_dir = pdir / "solutions"
        tc_dir = pdir / "test_cases"

        if not sol_dir.exists():
            continue

        test_cases_json = load_test_cases(tc_dir, tc_cap)
        num_tc = len(json.loads(test_cases_json))

        for cfile in sorted(sol_dir.glob("*.c")):
            code = cfile.read_text(encoding="utf-8", errors="replace")
            rows.append({
                "problem_id": pid,
                "submission_id": cfile.stem,
                "code": code,
                "test_cases": test_cases_json,
                "num_test_cases": num_tc,
            })

    return rows


def write_csv(rows: list[dict], path: Path):
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=["problem_id", "submission_id", "code", "test_cases", "num_test_cases"])
        writer.writeheader()
        writer.writerows(rows)
    print(f"  CSV  → {path}  ({path.stat().st_size / 1024 / 1024:.1f} MB)")


def write_parquet(rows: list[dict], path: Path):
    try:
        import pandas as pd
    except ImportError:
        sys.exit("parquet format requires pandas + pyarrow:\n  pip install pandas pyarrow")

    df = pd.DataFrame(rows)
    df.to_parquet(path, index=False, engine="pyarrow")
    print(f"  Parquet → {path}  ({path.stat().st_size / 1024 / 1024:.1f} MB)")


def main():
    args = parse_args()
    base = Path(__file__).resolve().parent
    input_dir = base / args.input_dir
    output_base = base / args.output

    if not input_dir.exists():
        sys.exit(f"Input dir not found: {input_dir}\nRun filter.py first.")

    print(f"Building dataframe from {input_dir} …")
    rows = build_rows(input_dir, args.max_test_cases)

    if not rows:
        sys.exit("No data found.")

    problems = len(set(r["problem_id"] for r in rows))
    print(f"  {len(rows)} rows  ({problems} problems, {len(rows)} submissions)")

    if args.format in ("csv", "both"):
        write_csv(rows, output_base.with_suffix(".csv"))
    if args.format in ("parquet", "both"):
        write_parquet(rows, output_base.with_suffix(".parquet"))

    # quick preview
    print(f"\nPreview (first 3 rows):")
    print(f"{'─'*80}")
    for row in rows[:3]:
        tc = json.loads(row["test_cases"])
        code_preview = row["code"].split("\n")[0][:60]
        print(f"  {row['problem_id']} / {row['submission_id']}")
        print(f"    code: {code_preview} …")
        print(f"    test_cases: {row['num_test_cases']} pairs, first input: {tc[0]['input'][:50]}…" if tc else "    test_cases: none")
        print()


if __name__ == "__main__":
    main()
