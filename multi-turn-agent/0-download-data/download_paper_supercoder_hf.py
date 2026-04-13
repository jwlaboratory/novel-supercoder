#!/usr/bin/env python3
"""Download the SuperCoder paper HF dataset and write paper-shaped CSVs under multi-turn-agent.

Dataset id (same as the paper pipeline):
  random1123anonymized/supercoder
  https://huggingface.co/datasets/random1123anonymized/supercoder

Where files go
--------------
1) Hugging Face cache (Arrow shards — this is what `load_dataset` always does):
   - If HF_HOME is set: under that tree (see https://huggingface.co/docs/huggingface_hub/guides/manage-cache)
   - Else usually ~/.cache/huggingface/
   - If HF_CACHE is set, `datasets` passes it as cache_dir for this script.

2) CSV exports: default directory is the multi-turn-agent folder. Writes only **train** and
   **val**: {csv_prefix}_train.csv, {csv_prefix}_val.csv. The **fewshot** split is still
   downloaded into the HF cache with the full dataset load, but no fewshot CSV is written.
   Columns: idx, answer, test_cases, question (no c_only_question).

Usage (from repo root):
  uv run python multi-turn-agent/0-download-data/download_paper_supercoder_hf.py
  uv run python multi-turn-agent/0-download-data/download_paper_supercoder_hf.py --split val
  ./multi-turn-agent/run.bash --0
"""
from __future__ import annotations

import argparse
import csv
import json
import os
import sys
from pathlib import Path

from datasets import load_dataset


def _load_split(ds_name: str, split: str | None, cache_dir: str | None):
    kw: dict = {}
    if cache_dir:
        kw["cache_dir"] = cache_dir
    if split:
        return load_dataset(ds_name, split=split, **kw)
    return load_dataset(ds_name, **kw)


def _safe_get_extra(item: dict) -> dict:
    extra = item.get("extra_info", {})
    if isinstance(extra, list) and extra:
        first = extra[0]
        if isinstance(first, dict):
            return first
    if isinstance(extra, dict):
        return extra
    return {}


def _write_paper_csv_for_table(ds, out_path: Path, ds_name: str, split_name: str) -> None:
    """Paper-style rows for multi-turn-agent (no c_only_question, no fewshot file)."""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", encoding="utf-8", newline="") as f_csv:
        writer = csv.DictWriter(
            f_csv,
            fieldnames=["idx", "answer", "test_cases", "question"],
        )
        writer.writeheader()
        for row_index, item in enumerate(ds, start=1):
            extra = _safe_get_extra(item)
            c_code = extra.get("c_code", "") or ""
            question = extra.get("question", "") or ""
            inputs = list(extra.get("inputs", []) or [])
            outputs = list(extra.get("outputs", []) or [])
            tests = [{"input": inp, "output": out} for inp, out in zip(inputs, outputs)]
            writer.writerow(
                {
                    "idx": row_index - 1,
                    "answer": c_code,
                    "test_cases": json.dumps(tests, ensure_ascii=False),
                    "question": question,
                }
            )
    print(f"Wrote {len(ds)} rows: {out_path}  (split={split_name!r}, ds={ds_name!r})")


def main() -> None:
    script_dir = Path(__file__).resolve().parent
    multi_turn_root = script_dir.parent
    default_out = multi_turn_root

    parser = argparse.ArgumentParser(
        description="Cache paper SuperCoder on Hugging Face and export paper-shaped CSVs."
    )
    parser.add_argument(
        "--ds-name",
        default="random1123anonymized/supercoder",
        help="Hugging Face dataset id (paper default).",
    )
    parser.add_argument(
        "--split",
        default=None,
        metavar="NAME",
        help="If set, only this split. CSV written for train|val only; fewshot loads but no CSV.",
    )
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=default_out,
        help="Directory for CSV files (default: multi-turn-agent root)",
    )
    parser.add_argument(
        "--csv-prefix",
        default="supercoder",
        metavar="NAME",
        help="CSV filenames: {prefix}_<split>.csv (default: supercoder).",
    )
    parser.add_argument(
        "--no-csv",
        action="store_true",
        help="Only populate the HF/datasets cache; do not write CSV files.",
    )
    args = parser.parse_args()

    cache_dir = os.environ.get("HF_CACHE")
    hf_home = os.environ.get("HF_HOME")
    if cache_dir:
        cache_hint = f"datasets cache_dir={cache_dir!r}"
    elif hf_home:
        cache_hint = f"HF_HOME={hf_home!r}"
    else:
        cache_hint = "default ~/.cache/huggingface (set HF_HOME or HF_CACHE to override)"
    print(f"HF cache: {cache_hint}")

    out_dir = args.out_dir.resolve()
    prefix = args.csv_prefix.strip() or "supercoder"

    if args.split:
        ds = _load_split(args.ds_name, args.split, cache_dir)
        print(f"{args.ds_name} split={args.split!r}: n={len(ds)} (cached)")
        if not args.no_csv:
            if args.split == "fewshot":
                print("Fewshot: not writing CSV (in-context examples only).", file=sys.stderr)
            else:
                csv_path = out_dir / f"{prefix}_{args.split}.csv"
                _write_paper_csv_for_table(ds, csv_path, args.ds_name, args.split)
    else:
        ds_dict = _load_split(args.ds_name, None, cache_dir)
        for name, table in ds_dict.items():
            print(f"{args.ds_name} split={name!r}: n={len(table)} (cached)")
            if not args.no_csv:
                if name == "fewshot":
                    print("Fewshot: skip CSV (in-context examples only).")
                    continue
                csv_path = out_dir / f"{prefix}_{name}.csv"
                _write_paper_csv_for_table(table, csv_path, args.ds_name, name)

    if args.no_csv:
        print("Skipping CSV export (--no-csv).")
    else:
        print(f"CSV directory: {out_dir}")


if __name__ == "__main__":
    main()
