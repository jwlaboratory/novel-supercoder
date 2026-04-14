# 1-gen-training-data

Generate debug RL training data: download SuperCoder, run Qwen inference, identify failures.

```bash
./run.bash --1,2,3,4 --split=val   # full pipeline (download → inference → identify fails → backfill I/O)
./run.bash --3 --split=val         # just stage 3 (needs inference CSV + Docker supercoder-x86-bench)
./run.bash --4 --split=both        # just stage 4: backfill missing test_cases into all downstream CSVs
```

| Stage | Script | Description |
|-------|--------|-------------|
| 1 | `1-download-supercoder-dataset.py` | Download from HF, write `supercoder_{split}.csv` with `test_cases` |
| 2 | `2-run-inference.py` (Modal) | Run Qwen, write `supercoder_{split}_with_inference.csv` |
| 3 | `3-identify-fails.py` | Compile + test in Docker, write `supercoder_{split}_fails.csv` |
| 4 | `4-add-io-test-cases.py` | Backfill missing `test_cases` column into any downstream CSV |

Stage 3 compiles/tests assembly inside `supercoder-x86-bench` Docker (Linux x86-64 gcc) — **do not** run gcc on macOS/ARM, results will be wrong.

Stage 4 is a post-hoc fix: if `test_cases` (input/output pairs) were accidentally dropped from a downstream CSV, run stage 4 to re-join them from the base `supercoder_{split}.csv`. It is idempotent — CSVs that already have the column are skipped.

TODO: Update to use our benchmarks
