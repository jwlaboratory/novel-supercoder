# inference-raw

Raw (single-stage, one-shot) comparison on the **original SuperCoder prompt and
validation set** (`sc_val.parquet` on the `debug-rl-data` Modal volume).

The three models run in parallel, each in its own GPU container, against the
same fixed random sample of `sc_val`:

| Tag                 | Model |
|---------------------|-------|
| `qwen-base`         | `Qwen/Qwen2.5-Coder-7B-Instruct` (base instruct) |
| `supercoder`        | `exp1-train-supercoder` (latest merged HF checkpoint) |
| `debug-supercoder`  | `exp6-betterDebug-supercoder` @ **global_step_490** (merged HF) |

## 1. Merge the exp6 checkpoint (once)

```bash
cd qwen-debug-rl/3-rl-train-combined
modal run merge_checkpoint.py --exp exp6-betterDebug-supercoder --step 490
```

This converts the FSDP actor shards at
`/checkpoints/exp6-betterDebug-supercoder/global_step_490/actor/*.pt` into a
HuggingFace-format directory at
`/checkpoints/exp6-betterDebug-supercoder/global_step_490/hf_model/` on the
`debug-rl-checkpoints` volume.

`exp1-train-supercoder` is auto-detected (latest `global_step_*/hf_model`). If
needed, merge it too:

```bash
modal run merge_checkpoint.py --exp exp1-train-supercoder --step <N>
```

## 2. Run the benchmark

```bash
cd qwen-debug-rl/3-validation-benchmarks/inference-raw

# default: 200 samples with speedup benchmarking (hyperfine)
modal run infer.py

# larger sample, or skip speedup for speed
modal run infer.py --n-samples 500
modal run infer.py --no-do-speedup

# override checkpoints explicitly
modal run infer.py \
    --supercoder-ckpt /checkpoints/exp1-train-supercoder/global_step_420/hf_model \
    --debug-supercoder-ckpt /checkpoints/exp6-betterDebug-supercoder/global_step_490/hf_model
```

Outputs (local directory):

- `infer_results_qwen-base.csv`
- `infer_results_supercoder.csv`
- `infer_results_debug-supercoder.csv`
- `infer_summary.csv` — side-by-side comparison

## 3. Plot

```bash
python plot.py            # saves infer_comparison.png
```

Produces a 3×3 panel chart covering compile rate, all-tests pass rate, mean
correctness, status breakdown, correctness distribution, mean speedup on
`ALL_PASS` samples, **mean effective speedup** (failures counted as 1.0×), and
speedup distribution.
