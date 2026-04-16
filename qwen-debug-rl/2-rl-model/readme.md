# 2-rl-model

4 training experiments. All use the same reward (supercoder speedup reward).

## Structure

```
shared/                     reward.py + data converter scripts (used by all 4)
data/                       CSVs + generated parquets
1-train-supercoder/         Exp 1: Qwen → supercoder RL
2-train-supercoder-debug/   Exp 2: supercoder → debug RL
3-train-qwen-debug/         Exp 3: Qwen → debug RL
4-train-debug-supercoder/   Exp 4: debug checkpoint (exp3) → supercoder RL
```

## Run

Dependency graph — only 2 rounds needed:

```
Exp 1 ──► Exp 2
Exp 3 ──► Exp 4
```

```bash
# Round 1: run in parallel (separate terminals)
cd 1-train-supercoder  && modal run modal_train.py
cd 3-train-qwen-debug  && modal run modal_train.py

# Round 2: once exp 1 done:
cd 2-train-supercoder-debug && modal run modal_train.py
# Round 2: once exp 3 done:
cd 4-train-debug-supercoder && modal run modal_train.py
```

## Experiments

| Folder | Base model | Task | Data | Status |
|---|---|---|---|---|
| 1-train-supercoder | Qwen2.5-Coder-7B | optimize asm | supercoder HF dataset | TODO |
| 2-train-supercoder-debug | supercoder-7b | fix broken asm | debug fails CSVs | TODO |
| 3-train-qwen-debug | Qwen2.5-Coder-7B | fix broken asm | debug fails CSVs | Done (poor, see below) |
| 4-train-debug-supercoder | exp3 checkpoint | optimize asm | supercoder HF dataset | TODO |

## Reward (shared/reward.py)

Identical to supercoder `speedup_assembly_design2.py`:
- Compile fails → 0
- Any test fails → 0
- All tests pass → `avg_speedup` (continuous, e.g. 2.5x)

## Exp 3 results (3-train-qwen-debug, first run)

258 steps, 4× A100-80GB. Used old all-or-nothing reward `{-1, -0.5, 0, 1}`.

| Steps | Avg reward |
|---|---|
| 1–50 | -0.232 |
| 209–258 | +0.016 |

Did not learn. Re-run with the speedup reward for a fair comparison.


  data/
  ├── train.parquet              ← debug train  (exps 2 &
   3)
  ├── val.parquet                ← debug val    (exps 2 &
   3)
  ├── supercoder_train.parquet   ← sc train     (exps 1 &
   4)
  ├── supercoder_val.parquet     ← sc val       (exps 1 &
   4)
  ├── supercoder_train_fails.csv
  └── supercoder_val_fails.csv

  shared/
  ├── reward.py
  ├── debug_to_parquet.py
  └── supercoder_to_parquet.py



modal secret create wandb WANDB_API_KEY=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