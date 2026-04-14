"""Stage 1: One-shot assembly generation using the SuperCoder PPO model.

Reads supercoder_{split}.csv, sends each row's `prompt_one_shot` to the
SuperCoder PPO model on a Modal GPU, and writes
supercoder_{split}_post_oneshot_supercoder.csv with an added
`output_one_shot_supercoder` column.

Usage:
    modal run run_supercoder_oneshot.py --split val
    modal run run_supercoder_oneshot.py --split train --batch-size 64 --workers 2
"""
from __future__ import annotations

import csv
import sys
from pathlib import Path

import modal

_REPO_ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(_REPO_ROOT / "qwen-debug-rl" / "1-gen-training-data"))
from modal_inference import app, VllmEngine  # noqa: E402

SUPERCODER_MODEL = "random1123anonymized/SuperCoder2"

CSV_DIR = Path(__file__).resolve().parent.parent

INPUT_COLUMNS = [
    "idx",
    "c_code",
    "assembly",
    "test_cases",
    "prompt_one_shot",
    "prompt_infer_improvement",
]


def load_csv(split: str) -> list[dict]:
    path = CSV_DIR / f"supercoder_{split}.csv"
    if not path.exists():
        raise FileNotFoundError(f"CSV not found: {path}")

    csv.field_size_limit(sys.maxsize)
    rows = []
    with path.open("r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows.append(row)
    return rows


def write_csv(split: str, rows: list[dict], results: dict[int, str]) -> Path:
    out_path = CSV_DIR / f"supercoder_{split}_post_oneshot_supercoder.csv"
    out_fields = INPUT_COLUMNS + ["output_one_shot_supercoder"]
    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=out_fields)
        writer.writeheader()
        for row in rows:
            writer.writerow({
                **{col: row[col] for col in INPUT_COLUMNS},
                "output_one_shot_supercoder": results.get(int(row["idx"]), ""),
            })
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
        {"id": int(r["idx"]), "prompt": r["prompt_one_shot"]}
        for r in rows
    ]

    batches = [items[i : i + batch_size] for i in range(0, len(items), batch_size)]
    engines = [
        VllmEngine(model_name=SUPERCODER_MODEL, use_chat_template=False)
        for _ in range(workers)
    ]

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
