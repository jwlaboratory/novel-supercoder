"""Stage 2: Generate optimized assembly using Qwen2.5-Coder-7B-Instruct.

Reads supercoder_{split}.csv (produced by 1-download-supercoder-dataset.py),
sends each row's `question` column — the paper's original prompt containing
C code + unoptimized assembly — to Qwen on Modal, and writes
supercoder_{split}_with_inference.csv with the model's generated assembly.

Matches the inference approach from run-their-paper-exactly:
- No system prompt (just user message with the paper question)
- apply_chat_template → llm.generate (SGLang-style)
- Assembly extracted from ```assembly ... ``` fenced blocks

Usage:
    modal run 2-run-inference.py --split val
    modal run 2-run-inference.py --split train --batch-size 64 --workers 2
"""
from __future__ import annotations

import csv
import sys
from pathlib import Path

import modal

from modal_inference import app, VllmEngine

CSV_DIR = Path(__file__).resolve().parent

INPUT_COLUMNS = ["problem_idx", "test_cases", "question"]


def extract_assembly(raw: str) -> str:
    """Extract assembly from ```assembly ... ``` fenced blocks.

    Same logic as run-their-paper-exactly/modal_generate_supercoder_prompt_sglang_style.py.
    """
    text = raw
    if "```assembly" in text:
        text = text[text.rfind("```assembly") + len("```assembly") :]
    if "```" in text:
        text = text[: text.rfind("```")]
    clean = text.strip()
    return clean + "\n" if clean else "\n"


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
            raw = results.get(int(row["problem_idx"]), "")
            writer.writerow(
                {
                    **{col: row[col] for col in INPUT_COLUMNS},
                    "qwen_assembly": extract_assembly(raw),
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
        {"id": int(r["problem_idx"]), "prompt": r["question"]}
        for r in rows
    ]

    batches = [items[i : i + batch_size] for i in range(0, len(items), batch_size)]
    engines = [VllmEngine() for _ in range(workers)]

    jobs = []
    for i, batch in enumerate(batches):
        engine = engines[i % workers]
        jobs.append((batch, engine.generate_batch.spawn(batch)))

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
