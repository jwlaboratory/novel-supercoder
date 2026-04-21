# 2-stage validation benchmark

## Stage 1 — supercoder only

Always **`exp1-train-supercoder`** (same as **`supercoder-exp1`** in `inference-debug/infer.py`): `--stage1-ckpt` or auto latest merged HF under `/checkpoints/exp1-train-supercoder`. This pass **only** generates optimized assembly from the normal supercoder prompt (`sc_val.parquet`).

## Stage 2 — how to debug when stage 1 fails

On failure, the script applies **one** of these strategies per summary column (same debug prompt: error + C code + bad assembly — see `1-gen-training-data/3-identify-fails.py`):

| Tag | Model |
|-----|--------|
| `supercoder-again` | **Same checkpoint as stage 1** (exp1 supercoder again on the fix prompt) |
| `qwen-base` | `Qwen/Qwen2.5-Coder-7B-Instruct` (base instruct; override with `--base-fix-ckpt`) |
| `nothing` | No second pass |
| `debug-better-rl` | `exp5-debug-betterRL` (`5-train-debug-betterRL`; `--debug2-ckpt`) |
| `exp3-qwen-debug` | `exp3-qwen-debug` (`3-train-qwen-debug`; `--debug1-ckpt`) |

Dataset: `sc_val.parquet` on the `debug-rl-data` volume.

## Merge checkpoints (if needed)

```bash
modal run ../../2-rl-model/merge_checkpoint.py --exp exp1-train-supercoder --step <N>
modal run ../../2-rl-model/merge_checkpoint.py --exp exp3-qwen-debug --step <N>
modal run ../../2-rl-model/merge_checkpoint.py --exp exp5-debug-betterRL --step <N>
```

## Run

```bash
cd qwen-debug-rl/3-validation-benchmarks/2-stage
modal run infer.py --n-samples 200
modal run infer.py --n-samples 200 --no-do-speedup   # skip hyperfine (faster)
```

Optional overrides: `--stage1-ckpt`, `--base-fix-ckpt`, `--debug1-ckpt`, `--debug2-ckpt`.

## Outputs

- `two_stage_summary.csv` — side-by-side metrics for each stage-2 strategy.
- `two_stage_detail_<tag>.csv` — per-sample detail (`supercoder-again`, `qwen-base`, `nothing`, `debug-better-rl`, `exp3-qwen-debug`).
