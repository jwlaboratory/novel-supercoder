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
modal run infer.py                              # 50 samples, with speedup benchmarking
modal run infer.py --n-samples 200 --no-do-speedup   # faster, skips hyperfine
```

Outputs `infer_results_<model>.csv` per model and `infer_summary.csv` with a side-by-side comparison of compile rate, test-pass rate, mean correctness, and speedup.
