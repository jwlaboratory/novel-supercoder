#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import json
import os
from pathlib import Path

from datasets import load_dataset


def _load_split(ds_name: str, split: str):
    cache_dir = os.environ.get("HF_CACHE")
    if cache_dir:
        return load_dataset(ds_name, split=split, cache_dir=cache_dir)
    return load_dataset(ds_name, split=split)


def _safe_get_extra(item: dict) -> dict:
    extra = item.get("extra_info", {})
    if isinstance(extra, list) and extra:
        first = extra[0]
        if isinstance(first, dict):
            return first
    if isinstance(extra, dict):
        return extra
    return {}


def _extract_asm_from_fenced(text: str) -> str:
    if not text:
        return ""
    start = text.rfind("```assembly")
    if start == -1:
        return ""
    chunk = text[start + len("```assembly") :]
    end = chunk.rfind("```")
    if end != -1:
        chunk = chunk[:end]
    return chunk.strip()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-dir", required=True)
    parser.add_argument("--ds-name", default="random1123anonymized/supercoder")
    parser.add_argument("--split", default="val")
    parser.add_argument("--offset", type=int, default=0)
    parser.add_argument("--limit", type=int, default=0, help="0 = all rows from offset")
    args = parser.parse_args()

    run_dir = Path(args.run_dir).resolve()
    rows_dir = run_dir / "rows"
    manifest = run_dir / "manifest.jsonl"
    meta = run_dir / "meta.json"
    dataset_csv = run_dir / "paper_dataset.csv"
    o3_summary = run_dir / "o3_summary.jsonl"
    rows_dir.mkdir(parents=True, exist_ok=True)

    ds = _load_split(args.ds_name, args.split)
    if args.offset > 0:
        ds = ds.select(range(args.offset, len(ds)))
    if args.limit > 0:
        ds = ds.select(range(0, min(args.limit, len(ds))))

    with dataset_csv.open("w", encoding="utf-8", newline="") as f_csv, manifest.open(
        "w", encoding="utf-8"
    ) as f_manifest, o3_summary.open("w", encoding="utf-8") as f_o3:
        writer = csv.DictWriter(
            f_csv, fieldnames=["idx", "answer", "test_cases", "question", "c_only_question"]
        )
        writer.writeheader()

        for row_index, item in enumerate(ds, start=1):
            extra = _safe_get_extra(item)
            c_code = extra.get("c_code", "") or ""
            question = extra.get("question", "") or ""
            c_only_question = extra.get("c_only_question", "") or ""
            unoptimized_assembly = extra.get("unoptimized_assembly", "") or ""
            optimized_assembly = _extract_asm_from_fenced(extra.get("answer", "") or "")
            inputs = list(extra.get("inputs", []) or [])
            outputs = list(extra.get("outputs", []) or [])

            tests = []
            for inp, out in zip(inputs, outputs):
                tests.append({"input": inp, "output": out})

            row_dir = rows_dir / f"row_{row_index:05d}"
            row_dir.mkdir(parents=True, exist_ok=True)
            (row_dir / "inputC.c").write_text(c_code, encoding="utf-8")
            (row_dir / "input_tests.json").write_text(
                json.dumps(tests, ensure_ascii=False, indent=2), encoding="utf-8"
            )
            (row_dir / "prompt_supercoder_main.txt").write_text(question, encoding="utf-8")
            (row_dir / "prompt_supercoder_c_only.txt").write_text(c_only_question, encoding="utf-8")
            (row_dir / "inputo0.s").write_text(unoptimized_assembly, encoding="utf-8")
            (row_dir / "inputo3.s").write_text(optimized_assembly, encoding="utf-8")

            f_manifest.write(
                json.dumps(
                    {
                        "row_index": row_index,
                        "problem_idx": row_index - 1,
                        "row_dir": str(row_dir),
                        "has_tests": 1 if tests else 0,
                    },
                    ensure_ascii=False,
                )
                + "\n"
            )

            f_o3.write(
                json.dumps(
                    {
                        "row_index": row_index,
                        "status": "paper_dataset_o3_from_answer",
                        "o3_file": str(row_dir / "inputo3.s"),
                    },
                    ensure_ascii=False,
                )
                + "\n"
            )

            writer.writerow(
                {
                    "idx": row_index - 1,
                    "answer": c_code,
                    "test_cases": json.dumps(tests, ensure_ascii=False),
                    "question": question,
                    "c_only_question": c_only_question,
                }
            )

    meta.write_text(
        json.dumps(
            {
                "data_csv": str(dataset_csv),
                "total_rows": len(ds),
                "source": {
                    "dataset": args.ds_name,
                    "split": args.split,
                    "offset": args.offset,
                    "limit": args.limit,
                },
            },
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )

    print(f"Prepared run dir: {run_dir}")
    print(f"Rows: {len(ds)}")
    print(f"Manifest: {manifest}")
    print(f"Meta: {meta}")


if __name__ == "__main__":
    main()
