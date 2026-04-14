#!/usr/bin/env python3
"""Stage 4: Backfill missing test_cases (input/output) into generated CSVs.

When stage 1 is re-run later or test_cases were accidentally omitted from a
downstream CSV (e.g. *_fails.csv), this script re-joins on problem_idx using
the base supercoder_{split}.csv as the source of truth and rewrites every
target CSV that is missing the test_cases column.

Source of test_cases (searched in order):
  1. supercoder_{split}.csv           (stage 1 output)
  2. supercoder_{split}_with_inference.csv  (stage 2 output, also has test_cases)

Target CSVs patched (any CSV in --csv-dir that matches supercoder_{split}_*.csv
and lacks a test_cases column):
  - supercoder_{split}_with_inference.csv
  - supercoder_{split}_fails.csv
  - … any other downstream CSVs that share problem_idx

Usage:
    uv run python 4-add-io-test-cases.py --split val
    uv run python 4-add-io-test-cases.py --split train
    uv run python 4-add-io-test-cases.py --split both
    uv run python 4-add-io-test-cases.py --split both --csv-dir /path/to/csvs
"""
from __future__ import annotations

import argparse
import csv
import shutil
import sys
import tempfile
from pathlib import Path

CSV_DIR = Path(__file__).resolve().parent


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def _load_test_cases(csv_dir: Path, split: str) -> dict[str, str]:
    """Return {problem_idx_str: test_cases_json} from the best available source."""
    candidates = [
        csv_dir / f"supercoder_{split}.csv",
        csv_dir / f"supercoder_{split}_with_inference.csv",
    ]
    for src in candidates:
        if not src.exists():
            continue
        csv.field_size_limit(sys.maxsize)
        with src.open("r", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            if "test_cases" not in (reader.fieldnames or []):
                continue
            mapping = {row["problem_idx"]: row["test_cases"] for row in reader}
            if mapping:
                print(f"  [source] test_cases loaded from {src.name} ({len(mapping)} rows)")
                return mapping
    raise FileNotFoundError(
        f"No source CSV with test_cases found for split={split!r} in {csv_dir}"
    )


def _patch_csv(path: Path, tc_map: dict[str, str]) -> bool:
    """Add test_cases column to *path* (in-place). Returns True if patched."""
    csv.field_size_limit(sys.maxsize)
    with path.open("r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        fieldnames = list(reader.fieldnames or [])
        if "test_cases" in fieldnames:
            print(f"  [skip]  {path.name} already has test_cases")
            return False
        rows = list(reader)

    if not rows:
        print(f"  [skip]  {path.name} is empty")
        return False

    missing = sum(1 for r in rows if r["problem_idx"] not in tc_map)
    if missing:
        print(
            f"  [warn]  {path.name}: {missing}/{len(rows)} rows have no matching "
            f"problem_idx in source — they will get an empty test_cases value"
        )

    # Insert test_cases right after problem_idx
    insert_pos = fieldnames.index("problem_idx") + 1
    new_fields = fieldnames[:insert_pos] + ["test_cases"] + fieldnames[insert_pos:]

    # Write to a temp file then atomically replace
    with tempfile.NamedTemporaryFile(
        mode="w", encoding="utf-8", newline="",
        dir=path.parent, suffix=".tmp", delete=False
    ) as tmp:
        tmp_path = Path(tmp.name)
        writer = csv.DictWriter(tmp, fieldnames=new_fields)
        writer.writeheader()
        for row in rows:
            row["test_cases"] = tc_map.get(row["problem_idx"], "[]")
            writer.writerow(row)

    shutil.move(str(tmp_path), str(path))
    print(f"  [patch] {path.name} — added test_cases ({len(rows)} rows)")
    return True


def _process_split(csv_dir: Path, split: str) -> None:
    print(f"\n=== split: {split} ===")
    tc_map = _load_test_cases(csv_dir, split)

    # Find all CSVs for this split that are NOT the raw source (those already have it)
    prefix = f"supercoder_{split}_"
    targets = sorted(csv_dir.glob(f"{prefix}*.csv"))
    if not targets:
        print(f"  No downstream CSVs found matching {prefix}*.csv")
        return

    patched = 0
    for csv_path in targets:
        try:
            if _patch_csv(csv_path, tc_map):
                patched += 1
        except Exception as exc:
            print(f"  [error] {csv_path.name}: {exc}")

    print(f"\n  Done — {patched}/{len(targets)} file(s) patched")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Backfill missing test_cases column into generated CSVs."
    )
    parser.add_argument(
        "--split",
        default="both",
        choices=["train", "val", "both"],
        help="Which split(s) to process (default: both).",
    )
    parser.add_argument(
        "--csv-dir",
        type=Path,
        default=CSV_DIR,
        help="Directory containing the CSVs (default: script directory).",
    )
    args = parser.parse_args()

    csv_dir = args.csv_dir.resolve()
    splits = ["train", "val"] if args.split == "both" else [args.split]
    for split in splits:
        _process_split(csv_dir, split)


if __name__ == "__main__":
    main()
