# Exp 6 — betterDebug → supercoder

Continue supercoder RL on top of the best debug checkpoint we have: the
**step-700** actor from `exp5-debug-betterRL` (the partial-credit debug run that
reached val ≈ 0.28 — the strongest debug signal in the project, see
`../WANDB_RUNS.md`).

| Stage | Task | Data | Reward | Base |
|---|---|---|---|---|
| exp5-debug-betterRL | fix broken asm | debug fails CSVs | `passed/total` (fractional) | Qwen2.5-Coder-7B-Instruct |
| **exp6-betterDebug-supercoder** | **optimize asm** | **supercoder HF dataset** | **speedup if all pass else 0** | **exp5 @ step 700** |

Same supercoder training methodology as `1-train-supercoder` / `4-train-debug-supercoder-try2`:
- `shared/reward.py` (avg speedup gated on all tests passing, via `hyperfine`)
- supercoder parquets (`sc_train.parquet` / `sc_val.parquet`)
- `max_prompt_length=3000`, `max_response_length=4096`
- 1 epoch, `save_freq=100`, `test_freq=100`, `resume_mode=auto`

## Run

```bash
# 1. Make an HF copy of the FSDP step-700 checkpoint.
#    This writes weights to /checkpoints/exp5-debug-betterRL/global_step_700/hf_model
#    (leaves the original shards untouched).
cd qwen-debug-rl/3-rl-train-combined
modal run merge_checkpoint.py --exp exp5-debug-betterRL --step 700

# 2. Kick off exp 6. Default --model-path points at the merged copy above.
cd 6-betterDebug-supercoder
modal run modal_train.py --detach

# Override the checkpoint if needed:
modal run modal_train.py --model-path /checkpoints/exp5-debug-betterRL/global_step_700/hf_model
```

Checkpoints save to `/checkpoints/exp6-betterDebug-supercoder/`.
W&B run shows up in project `qwen-debug-rl` with `experiment_name=exp6-betterDebug-supercoder`.

## Why this experiment

`exp4-debug-supercoder` (same recipe, but initialized from `exp3-qwen-debug` step 258)
**collapsed** — rollouts stuck at length 10, reward 0 throughout. The likely cause
is that exp3 used a near-zero speedup reward for debug, so the exp3 weights gave
nothing useful to supercoder-style rollouts.

exp5 uses a dense fractional reward and actually learned (val ≈ 0.28), so its
step-700 weights should be a much better starting point for supercoder RL than
exp3's were. This is the matched re-run of exp4 with a better debug base.
