#!/usr/bin/env python3
"""Stage 5: Add unoptimized_assembly and unoptimized_compiled to the fails CSVs.

The supercoder reward function needs two extra fields to compute speedup:
  - unoptimized_assembly:    the original (slow) assembly text
  - unoptimized_compiled_b64: the precompiled unoptimized binary (base64-encoded)

Both come from the HF dataset's extra_info, joined on problem_idx (= row index).

This is idempotent — CSVs that already have both columns are skipped.

Usage:
    uv run python 5-add-unoptimized-compiled.py --split val
    uv run python 5-add-unoptimized-compiled.py --split train
    uv run python 5-add-unoptimized-compiled.py --split both
"""
from __future__ import annotations

import argparse
import base64
import csv
import shutil
import sys
import tempfile
from pathlib import Path

from datasets import load_dataset

CSV_DIR  = Path(__file__).resolve().parent
HF_DATASET = "random1123anonymized/supercoder"
NEW_COLS = ("unoptimized_assembly", "unoptimized_compiled_b64")


def _safe_extra(item: dict) -> dict:
    extra = item.get("extra_info", {})
    if isinstance(extra, list) and extra:
        first = extra[0]
        if isinstance(first, dict):
            return first
    return extra if isinstance(extra, dict) else {}


def _build_map(split: str) -> dict[int, dict]:
    """Return {problem_idx: {unoptimized_assembly, unoptimized_compiled_b64}}."""
    print(f"  Loading HF dataset split={split!r} …")
    ds = load_dataset(HF_DATASET, split=split)
    mapping: dict[int, dict] = {}
    missing_compiled = 0

    for i, item in enumerate(ds):
        extra = _safe_extra(item)
        asm   = extra.get("unoptimized_assembly", "") or ""
        comp  = extra.get("unoptimized_compiled", None)

        if comp is None:
            missing_compiled += 1
            b64 = ""
        elif isinstance(comp, (bytes, bytearray)):
            b64 = base64.b64encode(comp).decode("ascii")
        else:
            # already a string (shouldn't happen but be safe)
            b64 = comp

        mapping[i] = {
            "unoptimized_assembly":    asm,
            "unoptimized_compiled_b64": b64,
        }

    print(f"  {len(mapping)} rows loaded  ({missing_compiled} missing compiled binary)")
    return mapping


def _patch_csv(path: Path, hf_map: dict[int, dict]) -> bool:
    """Add the two new columns to *path* in-place. Returns True if patched."""
    csv.field_size_limit(sys.maxsize)
    with path.open("r", encoding="utf-8") as f:
        reader   = csv.DictReader(f)
        fields   = list(reader.fieldnames or [])
        rows     = list(reader)

    if all(c in fields for c in NEW_COLS):
        print(f"  [skip] {path.name} already has both columns")
        return False

    if not rows:
        print(f"  [skip] {path.name} is empty")
        return False

    # insert new columns right after problem_idx
    insert_at = fields.index("problem_idx") + 1
    new_fields = fields[:insert_at] + list(NEW_COLS) + fields[insert_at:]

    missing = 0
    with tempfile.NamedTemporaryFile(
        mode="w", encoding="utf-8", newline="",
        dir=path.parent, suffix=".tmp", delete=False,
    ) as tmp:
        tmp_path = Path(tmp.name)
        writer   = csv.DictWriter(tmp, fieldnames=new_fields)
        writer.writeheader()
        for row in rows:
            idx  = int(row.get("problem_idx", -1))
            data = hf_map.get(idx, {})
            if not data:
                missing += 1
            row["unoptimized_assembly"]     = data.get("unoptimized_assembly",    "")
            row["unoptimized_compiled_b64"] = data.get("unoptimized_compiled_b64", "")
            writer.writerow(row)

    shutil.move(str(tmp_path), str(path))
    if missing:
        print(f"  [warn] {path.name}: {missing}/{len(rows)} rows had no HF match")
    print(f"  [patch] {path.name} — added unoptimized_assembly + unoptimized_compiled_b64 ({len(rows)} rows)")
    return True


def _process_split(csv_dir: Path, split: str) -> None:
    print(f"\n=== split: {split} ===")
    hf_map  = _build_map(split)
    targets = [csv_dir / f"supercoder_{split}_fails.csv"]
    # also patch with_inference CSV if present
    targets.append(csv_dir / f"supercoder_{split}_with_inference.csv")

    patched = 0
    for p in targets:
        if not p.exists():
            print(f"  [skip] {p.name} not found")
            continue
        try:
            if _patch_csv(p, hf_map):
                patched += 1
        except Exception as exc:
            print(f"  [error] {p.name}: {exc}")

    print(f"\n  Done — {patched} file(s) patched")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Backfill unoptimized_assembly and unoptimized_compiled_b64 into fails CSVs."
    )
    parser.add_argument("--split", default="both", choices=["train", "val", "both"])
    parser.add_argument("--csv-dir", type=Path, default=CSV_DIR)
    args = parser.parse_args()

    csv_dir = args.csv_dir.resolve()
    splits  = ["train", "val"] if args.split == "both" else [args.split]
    for split in splits:
        _process_split(csv_dir, split)


if __name__ == "__main__":
    main()
