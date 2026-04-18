# inference-debug

Compares Qwen-base vs debug1 (exp3) vs debug2 (exp5) on the assembly debugging failures dataset.

**Dataset:** `debug_val.parquet` in the `debug-rl-data` Modal volume — sampled from `supercoder_val_fails.csv`, which contains Qwen-generated assembly that failed to compile or pass tests.

**Merge checkpoints to HF format first** (if not already done — replace `--step` with the actual global step number):
```bash
modal run ../../2-rl-model/merge_checkpoint.py --exp exp1-train-supercoder --step 420
modal run ../../2-rl-model/merge_checkpoint.py --exp exp3-qwen-debug --step 258
modal run ../../2-rl-model/merge_checkpoint.py --exp exp5-debug-betterRL --step 700
```

**Run the comparison:**
```bash
modal run infer.py --n-samples 200 --no-do-speedup   # fast: inference only, no hyperfine
modal run infer.py --n-samples 200                   # full: inference + speedup benchmarking
```

**Already have CSVs? Just add speedup without re-running inference:**
```bash
modal run infer.py --speedup-only                    # reads existing CSVs, runs hyperfine on ALL_PASS rows
```
Note: `--speedup-only` requires that the CSVs were generated without `--no-do-speedup` truncation (i.e. after this fix). Re-run inference once to get full responses saved, then `--speedup-only` works on subsequent calls.

**Plot results:**
```bash
python plot.py   # saves infer_comparison.png (9-panel chart including speedup)
```

Outputs `infer_results_<model>.csv` per model and `infer_summary.csv` with a side-by-side comparison of compile rate, test-pass rate, mean correctness, and speedup.
