"""Convert supercoder_train_fails.csv → train.parquet (and val equivalent).

The output parquet schema matches what verl's RLHFDataset + NaiveRewardManager
expect:

    data_source    str          tag passed to compute_score() as first arg
    prompt         list[dict]   chat messages: [{"role": "user", "content": ...}]
    reward_model   dict         {"style": "rule", "ground_truth": ""}  (dummy)
    extra_info     dict         {"inputs": [...], "outputs": [...], ...}
                                → passed directly to compute_score()

Usage
-----
    uv run python convert_to_parquet.py --split train
    uv run python convert_to_parquet.py --split val
    uv run python convert_to_parquet.py --split train --input-csv /path/to/file.csv
    uv run python convert_to_parquet.py --split train --max-rows 1000  # for quick tests
"""
from __future__ import annotations

import argparse
import base64
import csv
import json
import sys
from pathlib import Path

from datasets import Dataset


HERE = Path(__file__).resolve().parent


def _parse_test_cases(raw: str) -> tuple[list[str], list[str]]:
    """Parse test_cases JSON column → (inputs, outputs) string lists."""
    try:
        cases = json.loads(raw)
    except (json.JSONDecodeError, TypeError):
        return [], []

    inputs, outputs = [], []
    for tc in cases:
        if isinstance(tc, dict):
            inputs.append(tc.get("input", ""))
            outputs.append(tc.get("output", ""))
    return inputs, outputs


def convert(csv_path: Path, out_path: Path, split: str, max_rows: int | None) -> None:
    csv.field_size_limit(sys.maxsize)

    examples = []
    skipped = 0

    with csv_path.open("r", encoding="utf-8") as f:
        reader = csv.DictReader(f)

        for i, row in enumerate(reader):
            if max_rows is not None and i >= max_rows:
                break

            inputs, outputs = _parse_test_cases(row.get("test_cases", "[]"))

            if not inputs:
                skipped += 1
                continue

            prompt_content = row.get("debug_prompt", "").strip()
            if not prompt_content:
                skipped += 1
                continue

            # decode precompiled unoptimized binary (base64 → bytes)
            b64 = row.get("unoptimized_compiled_b64", "")
            unopt_compiled = base64.b64decode(b64) if b64 else b""

            examples.append({
                "data_source": split,
                "prompt": [{"role": "user", "content": prompt_content}],
                "reward_model": {
                    "style": "rule",
                    "ground_truth": "",
                },
                "extra_info": {
                    "problem_idx":          int(row.get("problem_idx", -1)),
                    "inputs":               inputs,
                    "outputs":              outputs,
                    "c_code":               row.get("c_code", ""),
                    "broken_assembly":      row.get("qwen_assembly", ""),
                    "original_error":       row.get("error", ""),
                    "unoptimized_assembly": row.get("unoptimized_assembly", ""),
                    "unoptimized_compiled": unopt_compiled,
                },
            })

    print(f"Converted {len(examples)} rows ({skipped} skipped — no test cases or no prompt)")

    dataset = Dataset.from_list(examples)
    dataset.to_parquet(str(out_path))
    print(f"Saved → {out_path}  ({out_path.stat().st_size // 1024} KB)")


def main() -> None:
    parser = argparse.ArgumentParser(description="Convert fails CSV to verl-compatible parquet.")
    parser.add_argument("--split", default="train", choices=["train", "val"])
    parser.add_argument(
        "--input-csv",
        type=Path,
        default=None,
        help="Path to CSV. Defaults to supercoder_{split}_fails.csv in this directory.",
    )
    parser.add_argument(
        "--output-parquet",
        type=Path,
        default=None,
        help="Output path. Defaults to {split}.parquet in this directory.",
    )
    parser.add_argument(
        "--max-rows",
        type=int,
        default=None,
        help="Only convert first N rows (useful for quick smoke tests).",
    )
    args = parser.parse_args()

    csv_path = args.input_csv or (HERE / f"supercoder_{args.split}_fails.csv")
    out_path = args.output_parquet or (HERE / f"{args.split}.parquet")

    if not csv_path.exists():
        print(f"ERROR: CSV not found: {csv_path}", file=sys.stderr)
        sys.exit(1)

    convert(csv_path, out_path, args.split, args.max_rows)


if __name__ == "__main__":
    main()
