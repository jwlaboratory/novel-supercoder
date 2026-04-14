#!/usr/bin/env python3
"""Compare Hugging Face datasets used in this repo: KPS CodeNet vs paper SuperCoder."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from datetime import datetime, timezone
from pathlib import Path

from datasets import load_dataset


KPS_DEFAULT = "KrishPS/codenet-accepted-c"
PAPER_DEFAULT = "random1123anonymized/supercoder"


def _norm_extra(item: dict) -> dict:
    extra = item.get("extra_info", item)
    if isinstance(extra, list) and extra:
        first = extra[0]
        if isinstance(first, dict):
            return first
    if isinstance(extra, dict):
        return extra
    return {}


def _norm_c(s: str) -> str:
    s = s or ""
    return re.sub(r"\s+", " ", s.strip())


def _chash(s: str) -> str:
    return hashlib.sha256(_norm_c(s).encode("utf-8")).hexdigest()


def _byte_chash(s: str) -> str:
    return hashlib.sha256((s or "").encode("utf-8")).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--kps-dataset", default=KPS_DEFAULT)
    parser.add_argument("--paper-dataset", default=PAPER_DEFAULT)
    parser.add_argument(
        "--out-json",
        type=Path,
        default=None,
        help="Write full comparison report as JSON (default: results/kps_vs_paper_supercoder.json next to this script).",
    )
    args = parser.parse_args()

    script_dir = Path(__file__).resolve().parent
    out_path = args.out_json
    if out_path is None:
        out_path = script_dir / "results" / "kps_vs_paper_supercoder.json"

    paper_val = load_dataset(args.paper_dataset, split="val")
    paper_train = load_dataset(args.paper_dataset, split="train")
    kps = load_dataset(args.kps_dataset, split="train")

    e0 = _norm_extra(paper_val[0])
    k0 = kps[0]

    val_hashes_byte = {}
    val_hashes_norm = {}
    for i in range(len(paper_val)):
        e = _norm_extra(paper_val[i])
        c = e.get("c_code") or ""
        val_hashes_byte[_byte_chash(c)] = i
        val_hashes_norm[_chash(c)] = i

    train_hashes_byte = set()
    train_hashes_norm = set()
    for i in range(len(paper_train)):
        e = _norm_extra(paper_train[i])
        c = e.get("c_code") or ""
        train_hashes_byte.add(_byte_chash(c))
        train_hashes_norm.add(_chash(c))

    def count_matches(hashes: set[str] | dict[str, int], norm: bool) -> int:
        fn = _chash if norm else _byte_chash
        n = 0
        for row in kps:
            h = fn(row.get("code") or "")
            if isinstance(hashes, dict):
                if h in hashes:
                    n += 1
            else:
                if h in hashes:
                    n += 1
        return n

    report = {
        "generated_at_utc": datetime.now(timezone.utc).isoformat(),
        "kps_dataset": args.kps_dataset,
        "paper_dataset": args.paper_dataset,
        "kps": {
            "split": "train",
            "num_rows": len(kps),
            "column_names": kps.column_names,
            "example_keys_non_empty": sorted(k for k, v in k0.items() if v not in (None, "", [], {})),
        },
        "paper": {
            "splits": {
                "val": {"num_rows": len(paper_val), "column_names": paper_val.column_names},
                "train": {"num_rows": len(paper_train), "column_names": paper_train.column_names},
            },
            "extra_info_keys": sorted(e0.keys()),
            "val_row_index_field": e0.get("index"),
        },
        "overlap_kps_train_vs_paper_c_code": {
            "val_rows_matched_byte_identical": count_matches(val_hashes_byte, norm=False),
            "val_rows_matched_whitespace_normalized": count_matches(val_hashes_norm, norm=True),
            "train_hashes_matched_byte_identical": sum(
                1 for row in kps if _byte_chash(row.get("code") or "") in train_hashes_byte
            ),
            "train_hashes_matched_whitespace_normalized": sum(
                1 for row in kps if _chash(row.get("code") or "") in train_hashes_norm
            ),
            "note": "Counts KPS train submissions whose C source equals a paper split c_code (exact or whitespace-collapsed).",
        },
        "semantic_notes": [
            "KPS rows are CodeNet accepted submissions (many per problem_id); paper rows are SuperCoder benchmark instances with prompts and assembly fields.",
            "prepare_supercoder_run.py reads paper extra_info (c_code, question, inputs/outputs, assembly); the 100-dataset experiment uses CSV from a different pipeline (KPS / local sampling).",
        ],
    }

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(report, indent=2), encoding="utf-8")
    print(json.dumps(report, indent=2))
    print(f"\nWrote {out_path}", flush=True)


if __name__ == "__main__":
    main()
