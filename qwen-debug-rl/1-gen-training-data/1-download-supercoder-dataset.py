#!/usr/bin/env python3
"""Download SuperCoder from Hugging Face and export compact CSVs.

Writes:
  - supercoder_train.csv
  - supercoder_val.csv

Columns:
  - problem_idx
  - test_cases
  - question
"""
from __future__ import annotations

import argparse
import csv
import json
import os
from pathlib import Path

from datasets import load_dataset


def _load_split(ds_name: str, split: str | None, cache_dir: str | None):
    kwargs: dict = {}
    if cache_dir:
        kwargs["cache_dir"] = cache_dir
    if split:
        return load_dataset(ds_name, split=split, **kwargs)
    return load_dataset(ds_name, **kwargs)


def _safe_get_extra(item: dict) -> dict:
    extra = item.get("extra_info", {})
    if isinstance(extra, list) and extra:
        first = extra[0]
        if isinstance(first, dict):
            return first
    if isinstance(extra, dict):
        return extra
    return {}


def _write_csv(ds, out_path: Path, ds_name: str, split_name: str) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = ["problem_idx", "test_cases", "question"]
    with out_path.open("w", encoding="utf-8", newline="") as f_csv:
        writer = csv.DictWriter(f_csv, fieldnames=fieldnames)
        writer.writeheader()
        for row_index, item in enumerate(ds):
            extra = _safe_get_extra(item)
            question = extra.get("question", "") or ""
            inputs = list(extra.get("inputs", []) or [])
            outputs = list(extra.get("outputs", []) or [])
            tests = [{"input": inp, "output": out} for inp, out in zip(inputs, outputs)]

            writer.writerow(
                {
                    "problem_idx": row_index,
                    "test_cases": json.dumps(tests, ensure_ascii=False),
                    "question": question,
                }
            )
    print(f"Wrote {len(ds)} rows: {out_path} (split={split_name!r}, ds={ds_name!r})")


def main() -> None:
    script_dir = Path(__file__).resolve().parent
    default_out_dir = script_dir

    parser = argparse.ArgumentParser(
        description="Download SuperCoder and export minimal CSV files."
    )
    parser.add_argument(
        "--ds-name",
        default="random1123anonymized/supercoder",
        help="Hugging Face dataset id (default: random1123anonymized/supercoder).",
    )
    parser.add_argument(
        "--split",
        default=None,
        metavar="NAME",
        help="If set, only download/write this split (e.g. train or val).",
    )
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=default_out_dir,
        help="Directory for CSV files (default: script directory).",
    )
    parser.add_argument(
        "--csv-prefix",
        default="supercoder",
        metavar="NAME",
        help="CSV filename prefix. Output format: {prefix}_<split>.csv.",
    )
    parser.add_argument(
        "--no-csv",
        action="store_true",
        help="Only populate HF cache; do not write CSV files.",
    )
    args = parser.parse_args()

    cache_dir = os.environ.get("HF_CACHE")
    out_dir = args.out_dir.resolve()
    prefix = args.csv_prefix.strip() or "supercoder"

    if args.split:
        ds = _load_split(args.ds_name, args.split, cache_dir)
        print(f"{args.ds_name} split={args.split!r}: n={len(ds)} (cached)")
        if not args.no_csv:
            csv_path = out_dir / f"{prefix}_{args.split}.csv"
            _write_csv(ds, csv_path, args.ds_name, args.split)
    else:
        ds_dict = _load_split(args.ds_name, None, cache_dir)
        for name, table in ds_dict.items():
            print(f"{args.ds_name} split={name!r}: n={len(table)} (cached)")
            if args.no_csv:
                continue
            if name not in {"train", "val"}:
                continue
            csv_path = out_dir / f"{prefix}_{name}.csv"
            _write_csv(table, csv_path, args.ds_name, name)

    if args.no_csv:
        print("Skipping CSV export (--no-csv).")
    else:
        print(f"CSV directory: {out_dir}")


if __name__ == "__main__":
    main()