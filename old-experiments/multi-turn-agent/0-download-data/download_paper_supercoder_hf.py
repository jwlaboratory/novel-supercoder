#!/usr/bin/env python3
"""Download the SuperCoder paper HF dataset and write CSVs under multi-turn-agent.

Dataset id (same as the paper pipeline):
  random1123anonymized/supercoder
  https://huggingface.co/datasets/random1123anonymized/supercoder

Extended dataset (larger, code-only — no assembly):
  KrishPS/codenet-accepted-c
  https://huggingface.co/datasets/KrishPS/codenet-accepted-c

Where files go
--------------
1) Hugging Face cache (Arrow shards — this is what `load_dataset` always does):
   - If HF_HOME is set: under that tree
   - Else usually ~/.cache/huggingface/
   - If HF_CACHE is set, `datasets` passes it as cache_dir for this script.

2) CSV exports: default directory is the multi-turn-agent folder. Writes only
   **train** and **val**: {csv_prefix}_train.csv, {csv_prefix}_val.csv.
   Columns:
     idx, c_code, assembly, test_cases,
     prompt_one_shot, prompt_infer_improvement

   With --extended, also downloads KrishPS/codenet-accepted-c and writes
   krishPS_extended_train.csv (same columns, assembly/prompt_one_shot empty).
   Rows whose c_code or test_cases overlap with supercoder_val.csv are excluded.

Usage (from repo root):
  uv run python multi-turn-agent/0-download-data/download_paper_supercoder_hf.py
  uv run python multi-turn-agent/0-download-data/download_paper_supercoder_hf.py --split val
  uv run python multi-turn-agent/0-download-data/download_paper_supercoder_hf.py --extended
  ./multi-turn-agent/run.bash --0
  ./multi-turn-agent/run.bash --0 --extended
"""
from __future__ import annotations

import argparse
import csv
import json
import os
import re
import sys
from pathlib import Path

from datasets import load_dataset

PROMPT_INFER_IMPROVEMENT = """\
You are given C source code and its compiler-generated x86-64 assembly.
Analyze the SPECIFIC assembly below and list concrete, actionable optimizations.

Rules:
- Reference specific labels or instructions by name (e.g. "the imulq at .L7 can be replaced with...")
- Explain WHY each thing is suboptimal in THIS code
- Do NOT suggest generic advice like "use SIMD", "profile first", or "enable -O3"
- Do NOT write any assembly or C code — observations only
- Keep each item to 1-2 sentences max
- If you cannot find a real, concrete inefficiency, output NOTHING — do not fabricate or stretch observations

C Code:

```c
{c_code}
```

Assembly Code:

```assembly
{assembly}
```"""


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


def _extract_assembly(question: str) -> str:
    """Pull the assembly block out of the original question text."""
    m = re.search(r"```assembly\n(.*?)```", question, re.DOTALL)
    return m.group(1).strip() if m else ""


def _write_paper_csv_for_table(ds, out_path: Path, ds_name: str, split_name: str) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "idx",
        "c_code",
        "assembly",
        "test_cases",
        "prompt_one_shot",
        "prompt_infer_improvement",
    ]
    with out_path.open("w", encoding="utf-8", newline="") as f_csv:
        writer = csv.DictWriter(f_csv, fieldnames=fieldnames)
        writer.writeheader()
        for row_index, item in enumerate(ds):
            extra = _safe_get_extra(item)
            c_code = (extra.get("c_code", "") or "").strip()
            question = extra.get("question", "") or ""
            assembly = _extract_assembly(question)
            inputs = list(extra.get("inputs", []) or [])
            outputs = list(extra.get("outputs", []) or [])
            tests = [{"input": inp, "output": out} for inp, out in zip(inputs, outputs)]
            writer.writerow({
                "idx": row_index,
                "c_code": c_code,
                "assembly": assembly,
                "test_cases": json.dumps(tests, ensure_ascii=False),
                "prompt_one_shot": question,
                "prompt_infer_improvement": PROMPT_INFER_IMPROVEMENT.format(
                    c_code=c_code,
                    assembly=assembly,
                ),
            })
    print(f"Wrote {len(ds)} rows: {out_path}  (split={split_name!r}, ds={ds_name!r})")


def _strip_code_fence(text: str) -> str:
    """Remove markdown ```c ... ``` fencing if present."""
    t = text.strip()
    if t.startswith("```"):
        first_nl = t.find("\n")
        if first_nl != -1:
            t = t[first_nl + 1:]
        if t.endswith("```"):
            t = t[:-3]
    return t.strip()


def _load_val_fingerprints(val_csv: Path) -> set[str]:
    """Load normalised c_code values from the validation CSV for dedup."""
    codes: set[str] = set()
    if not val_csv.exists():
        return codes
    with val_csv.open(encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            raw = row.get("c_code", "")
            normed = _strip_code_fence(raw).replace(" ", "").replace("\n", "")
            if normed:
                codes.add(normed)
    return codes


KRISHPS_DS = "KrishPS/codenet-accepted-c"


def _write_krishps_csv(
    ds,
    out_path: Path,
    val_fingerprints: set[str],
) -> None:
    """Write KrishPS rows to CSV, excluding any whose c_code overlaps with val."""
    out_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "idx",
        "c_code",
        "assembly",
        "test_cases",
        "prompt_one_shot",
        "prompt_infer_improvement",
    ]
    kept = 0
    skipped = 0
    with out_path.open("w", encoding="utf-8", newline="") as f_csv:
        writer = csv.DictWriter(f_csv, fieldnames=fieldnames)
        writer.writeheader()
        for item in ds:
            c_code = (item.get("code", "") or "").strip()
            normed = c_code.replace(" ", "").replace("\n", "")
            if normed in val_fingerprints:
                skipped += 1
                continue

            test_cases_raw = item.get("test_cases", "[]") or "[]"
            if isinstance(test_cases_raw, list):
                test_cases_str = json.dumps(test_cases_raw, ensure_ascii=False)
            else:
                test_cases_str = str(test_cases_raw)

            writer.writerow({
                "idx": kept,
                "c_code": c_code,
                "assembly": "",
                "test_cases": test_cases_str,
                "prompt_one_shot": "",
                "prompt_infer_improvement": PROMPT_INFER_IMPROVEMENT.format(
                    c_code=c_code,
                    assembly="",
                ),
            })
            kept += 1
    print(
        f"Wrote {kept} rows (skipped {skipped} val-overlapping): {out_path}  "
        f"(ds={KRISHPS_DS!r})"
    )


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
    parser.add_argument(
        "--extended",
        action="store_true",
        help=(
            "Also download KrishPS/codenet-accepted-c and write "
            "krishPS_extended_train.csv (val rows excluded)."
        ),
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

    # --- extended KrishPS dataset ---
    if args.extended:
        print(f"\n=== Extended: downloading {KRISHPS_DS} ===")
        val_csv = out_dir / f"{prefix}_val.csv"
        print(f"Loading val fingerprints from {val_csv} for dedup …")
        val_fps = _load_val_fingerprints(val_csv)
        print(f"  {len(val_fps)} unique val c_code fingerprints loaded")

        kds = _load_split(KRISHPS_DS, "train", cache_dir)
        print(f"{KRISHPS_DS} train: n={len(kds)} (cached)")

        extended_csv = out_dir / "krishPS_extended_train.csv"
        _write_krishps_csv(kds, extended_csv, val_fps)


if __name__ == "__main__":
    main()
