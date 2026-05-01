"""Convert the `random1123anonymized/supercoder` HuggingFace dataset to verl parquet.

The supercoder dataset already has `extra_info` with all fields the reward fn needs:
  inputs, outputs, unoptimized_assembly, unoptimized_compiled

Usage
-----
    uv run python supercoder_to_parquet.py --split train
    uv run python supercoder_to_parquet.py --split val
"""
from __future__ import annotations

import argparse
from pathlib import Path

from datasets import load_dataset, Dataset


HF_DATASET = "random1123anonymized/supercoder"


def _print_prompts(examples: list[dict], count: int, label: str) -> None:
    for idx, example in enumerate(examples[:count], start=1):
        print(f"\n===== {label} prompt {idx} =====")
        print(example["prompt"][0]["content"])


def convert(
    split: str,
    out_path: Path,
    max_rows: int | None,
    print_prompts: int,
    print_only: bool,
) -> None:
    print(f"Loading {HF_DATASET} split={split} ...")
    ds = load_dataset(HF_DATASET, split=split)

    if max_rows:
        ds = ds.select(range(min(max_rows, len(ds))))

    examples = []
    skipped = 0

    for row in ds:
        ei = row.get("extra_info", {})
        # extra_info is a list of dicts in the HF dataset
        if isinstance(ei, list):
            ei = ei[0] if ei else {}

        prompt_text = ei.get("question", "")
        inputs  = ei.get("inputs",  [])
        outputs = ei.get("outputs", [])

        if not prompt_text or not inputs:
            skipped += 1
            continue

        examples.append({
            "data_source": split,
            "prompt": [{"role": "user", "content": prompt_text}],
            "reward_model": {
                "style": "rule",
                "ground_truth": ei.get("answer", ""),
            },
            "extra_info": {
                "inputs":               inputs,
                "outputs":              outputs,
                "unoptimized_assembly": ei.get("unoptimized_assembly", ""),
                "unoptimized_compiled": ei.get("unoptimized_compiled", b""),
            },
        })

    print(f"Converted {len(examples)} rows ({skipped} skipped)")
    if print_prompts:
        _print_prompts(examples, print_prompts, "normal")

    if print_only:
        return

    out = Dataset.from_list(examples)
    out.to_parquet(str(out_path))
    print(f"Saved → {out_path}  ({out_path.stat().st_size // 1024} KB)")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--split", default="train", choices=["train", "val"])
    parser.add_argument("--output-parquet", type=Path, default=None)
    parser.add_argument("--max-rows", type=int, default=None)
    parser.add_argument(
        "--print-prompts",
        type=int,
        default=0,
        metavar="N",
        help="Print the first N user prompts written to the parquet.",
    )
    parser.add_argument(
        "--print-only",
        action="store_true",
        help="Print prompts without writing a parquet file.",
    )
    args = parser.parse_args()
    if args.print_only and args.print_prompts == 0:
        args.print_prompts = 1

    here = Path(__file__).resolve().parent
    out_path = args.output_parquet or (here / f"supercoder_{args.split}.parquet")
    convert(args.split, out_path, args.max_rows, args.print_prompts, args.print_only)


if __name__ == "__main__":
    main()
