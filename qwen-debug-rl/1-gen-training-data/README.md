# 1-gen-training-data

Generate debug RL training data: download SuperCoder, run Qwen inference, identify failures.

```bash
./run.bash --1,2,3,4,5             # full pipeline
./run.bash --5                     # just stage 5: add unoptimized_compiled to existing fails CSVs
./run.bash --5 --split=val         # stage 5: val only
./run.bash --3 --split=val         # just stage 3 (needs inference CSV + Docker supercoder-x86-bench)
```

| Stage | Script | Description |
|-------|--------|-------------|
| 1 | `1-download-supercoder-dataset.py` | Download from HF, write `supercoder_{split}.csv` with `test_cases` |
| 2 | `2-run-inference.py` (Modal) | Run Qwen, write `supercoder_{split}_with_inference.csv` |
| 3 | `3-identify-fails.py` | Compile + test in Docker, write `supercoder_{split}_fails.csv` |
| 4 | `4-add-io-test-cases.py` | Backfill missing `test_cases` column into any downstream CSV |
| 5 | `5-add-unoptimized-compiled.py` | Add `unoptimized_assembly` + `unoptimized_compiled_b64` from HF dataset |

Stage 3 compiles/tests assembly inside `supercoder-x86-bench` Docker (Linux x86-64 gcc) — **do not** run gcc on macOS/ARM, results will be wrong.

Stage 5 joins back the precompiled unoptimized binary from the HF dataset (by `problem_idx`). This is required for the supercoder reward function to compute speedup during RL training. It is idempotent — CSVs that already have both columns are skipped.
