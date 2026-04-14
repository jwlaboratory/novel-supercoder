"""Stage 2: Generate optimized assembly using Qwen2.5-Coder-7B-Instruct.

Reads supercoder_{split}.csv (produced by 1-download-supercoder-dataset.py),
sends each row's question + test cases to Qwen2.5-Coder-7B-Instruct on a
Modal GPU, and writes supercoder_{split}_with_inference.csv with an added
`qwen_assembly` column containing the model's generated assembly.

Usage:
    modal run 2-run-inference.py --split val
    modal run 2-run-inference.py --split train --batch-size 64 --workers 2
"""
from __future__ import annotations

import csv
import sys
from pathlib import Path

import modal

sys.path.insert(
    0,
    str(
        Path(__file__).resolve().parents[2]
        / "old-experiments"
        / "multi-turn-agent"
        / "3-stage3-infer-improvements"
    ),
)
from modal_inference import app, VllmEngine  # noqa: E402

QWEN_MODEL = "Qwen/Qwen2.5-Coder-7B-Instruct"

CSV_DIR = Path(__file__).resolve().parent

INPUT_COLUMNS = ["problem_idx", "test_cases", "question"]

SYSTEM_PROMPT = (
    "You are an expert x86-64 assembly programmer who writes highly optimized "
    "assembly solutions for competitive programming problems. Your output must "
    "be a complete, self-contained x86-64 Linux assembly program that reads "
    "from stdin and writes to stdout. Output ONLY the assembly code — no "
    "explanations, no markdown fences."
)

USER_PROMPT_TEMPLATE = """\
Write an optimized x86-64 assembly program for the following problem.
The program must read input from stdin and write output to stdout.

## Problem
{question}

## Test Cases
{test_cases}

Respond with the complete x86-64 assembly source code only."""


def build_prompt(row: dict) -> str:
    return USER_PROMPT_TEMPLATE.format(
        question=row["question"],
        test_cases=row["test_cases"],
    )


def load_csv(split: str) -> list[dict]:
    path = CSV_DIR / f"supercoder_{split}.csv"
    if not path.exists():
        raise FileNotFoundError(f"CSV not found: {path}")

    csv.field_size_limit(sys.maxsize)
    rows: list[dict] = []
    with path.open("r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows.append(row)
    return rows


def write_csv(split: str, rows: list[dict], results: dict[int, str]) -> Path:
    out_path = CSV_DIR / f"supercoder_{split}_with_inference.csv"
    out_fields = INPUT_COLUMNS + ["qwen_assembly"]
    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=out_fields)
        writer.writeheader()
        for row in rows:
            writer.writerow(
                {
                    **{col: row[col] for col in INPUT_COLUMNS},
                    "qwen_assembly": results.get(int(row["problem_idx"]), ""),
                }
            )
    return out_path


@app.local_entrypoint()
def main(
    split: str = "val",
    batch_size: int = 32,
    workers: int = 1,
):
    if split not in {"train", "val"}:
        raise ValueError("--split must be 'train' or 'val'")

    rows = load_csv(split)
    print(f"Loaded {len(rows)} rows from supercoder_{split}.csv")

    items = [
        {"id": int(r["problem_idx"]), "prompt": build_prompt(r)}
        for r in rows
    ]

    batches = [items[i : i + batch_size] for i in range(0, len(items), batch_size)]
    engines = [VllmEngine() for _ in range(workers)]

    jobs = []
    for i, batch in enumerate(batches):
        engine = engines[i % workers]
        jobs.append((batch, engine.generate_batch.spawn(batch, system_prompt=SYSTEM_PROMPT)))

    done = 0
    total = len(rows)
    results: dict[int, str] = {}

    for batch, call in jobs:
        try:
            batch_results = call.get()
        except Exception as exc:
            for item in batch:
                results[item["id"]] = f"ERROR: {exc}"
                done += 1
                print(f"[{done}/{total}] idx={item['id']} ERROR", flush=True)
            continue

        for result in batch_results:
            results[result["id"]] = result["output"]
            done += 1
            print(
                f"[{done}/{total}] idx={result['id']} ({result['status']})",
                flush=True,
            )

    out_path = write_csv(split, rows, results)
    print(f"\nDone. Results written to {out_path}")
