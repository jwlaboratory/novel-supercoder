#!/usr/bin/env python3
"""Join per-row bench output with manifest length metadata; summarize accuracy vs C-length bucket.

Expects:
  - run_dir/meta.json (from prepare_kps_supercoder_run.py; includes length_bucket_edges when default)
  - run_dir/supercoder_bench/per_row_bench.jsonl (from bench_correctness_simple.py --write-per-row)

Prints a table to stdout and writes run_dir/supercoder_bench/length_bucket_analysis.json"""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-dir", type=Path, required=True)
    parser.add_argument(
        "--per-row",
        type=Path,
        default=None,
        help="Default: <run-dir>/supercoder_bench/per_row_bench.jsonl",
    )
    args = parser.parse_args()

    run_dir = args.run_dir.resolve()
    per_row_path = args.per_row or (run_dir / "supercoder_bench" / "per_row_bench.jsonl")
    meta_path = run_dir / "meta.json"

    if not per_row_path.exists():
        raise SystemExit(
            f"Missing {per_row_path}; re-run bench_correctness_simple.py with --write-per-row …"
        )
    meta = json.loads(meta_path.read_text(encoding="utf-8")) if meta_path.exists() else {}
    src = meta.get("source") or {}
    edges = src.get("length_bucket_edges")

    rows = [
        json.loads(l)
        for l in per_row_path.read_text(encoding="utf-8").splitlines()
        if l.strip()
    ]

    by_label: dict[str, list[dict]] = defaultdict(list)
    for r in rows:
        label = r.get("c_len_bucket_label")
        if label is None:
            label = "unknown"
        by_label[str(label)].append(r)

    def _rates(bucket_rows: list[dict]) -> dict:
        n = len(bucket_rows)
        if not n:
            return {"n": 0, "compiled_pct": None, "correct_pct": None}
        compiled = sum(1 for x in bucket_rows if x.get("compiled"))
        correct = sum(1 for x in bucket_rows if x.get("correct"))
        return {
            "n": n,
            "compiled": compiled,
            "correct": correct,
            "compiled_pct": round(100.0 * compiled / n, 2),
            "correct_pct": round(100.0 * correct / n, 2),
        }

    order = sorted(by_label.keys(), key=lambda s: (s == "unknown", s))
    buckets_out = []
    print("C-length bucket | n | compile % | correct %")
    print("---|---:|---:|---:")
    for label in order:
        stats = _rates(by_label[label])
        buckets_out.append({"c_len_bucket_label": label, **stats})
        cp = stats["compiled_pct"]
        ap = stats["correct_pct"]
        print(
            f"{label} | {stats['n']} | "
            f"{'' if cp is None else cp} | "
            f"{'' if ap is None else ap}"
        )

    # Failure mix per bucket (tags from bench_correctness_simple)
    fail_mix: dict[str, dict[str, int]] = {}
    for label in order:
        ctr: dict[str, int] = defaultdict(int)
        for r in by_label[label]:
            if r.get("correct"):
                continue
            tag = r.get("failure_tag") or "unknown"
            ctr[str(tag)] += 1
        if ctr:
            fail_mix[label] = dict(sorted(ctr.items(), key=lambda kv: (-kv[1], kv[0])))

    out = {
        "run_dir": str(run_dir),
        "meta_edges": edges,
        "length_stratify": {
            "per_bucket_target": src.get("length_stratify_per_bucket"),
            "bucket_counts_at_prepare": src.get("length_stratify_bucket_counts"),
        },
        "buckets": buckets_out,
        "failure_tag_counts_by_bucket": fail_mix,
        "interpretation_note": (
            "Lower correct% in longer C buckets (with similar compile%) supports investing in "
            "long-context handling (prompt truncation, larger window, retrieval, or chunking). "
            "This is correlational: KPS mixes problem difficulty with length."
        ),
    }

    out_path = run_dir / "supercoder_bench" / "length_bucket_analysis.json"
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(out, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"\nWrote {out_path}")


if __name__ == "__main__":
    main()
