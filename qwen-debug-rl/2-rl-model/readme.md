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





HERE:

---

## Full Training Walkthrough (all 4 experiments)

### Prerequisites

```bash
# Modal volumes (created automatically on first run, but create secrets manually)
modal secret create huggingface HF_TOKEN=<your_hf_token>
modal secret create wandb WANDB_API_KEY=<your_wandb_key>
```

---

### Step 1 — Upload data to Modal volume

The training scripts auto-upload data on first run via `_ensure_sc_data()` /
`_ensure_debug_data()`. If you want to upload manually:

```bash
cd qwen-debug-rl/2-rl-model
modal run upload_data.py              # uploads all 4 parquets
modal run upload_data.py --sc-only    # sc_train + sc_val only
modal run upload_data.py --debug-only # debug_train + debug_val only
```

---

### Step 2 — Run Exp 1 and Exp 3 in parallel (no dependencies)

Open two terminals:

```bash
# Terminal 1
cd 1-train-supercoder
modal run modal_train.py
# Trains Qwen2.5-Coder-7B → optimize assembly (supercoder dataset)
# Saves checkpoint to: debug-rl-checkpoints/exp1-train-supercoder/global_step_N

# Terminal 2
cd 3-train-qwen-debug
modal run modal_train.py
# Trains Qwen2.5-Coder-7B → fix broken assembly (debug dataset)
# Saves checkpoint to: debug-rl-checkpoints/exp3-qwen-debug/global_step_N
```

Monitor both on WandB project `qwen-debug-rl`. Each run is ~492 steps (~1 epoch).

---

### Step 3 — Run Exp 2 (after Exp 1 finishes)

Exp 2 starts from the Exp 1 checkpoint (supercoder-trained model) and continues
training on the debug task.

```bash
# Find the final step from Exp 1
modal volume ls debug-rl-checkpoints /exp1-train-supercoder

# Convert FSDP checkpoint → HuggingFace model
cd qwen-debug-rl/2-rl-model
modal run merge_checkpoint.py --exp exp1-train-supercoder --step <N>
# Prints the HF model path, e.g.: /checkpoints/exp1-train-supercoder/global_step_N/hf_model

# Launch Exp 2
cd 2-train-supercoder-debug
modal run modal_train.py --model-path /checkpoints/exp1-train-supercoder/global_step_<N>/hf_model
```

---

### Step 4 — Run Exp 4 (after Exp 3 finishes)

Exp 4 starts from the Exp 3 checkpoint (debug-trained model) and trains on the
supercoder task to test whether debug pretraining helps with optimization.

```bash
# Find the final step from Exp 3
modal volume ls debug-rl-checkpoints /exp3-qwen-debug

# Convert FSDP checkpoint → HuggingFace model
cd qwen-debug-rl/2-rl-model
modal run merge_checkpoint.py --exp exp3-qwen-debug --step <N>
# Prints the HF model path, e.g.: /checkpoints/exp3-qwen-debug/global_step_N/hf_model

# Launch Exp 4
cd 4-train-debug-supercoder
modal run modal_train.py --model-path /checkpoints/exp3-qwen-debug/global_step_<N>/hf_model
```

---

### Why merge_checkpoint.py?

verl saves checkpoints as FSDP shards (`model_world_size_4_rank_0.pt` etc.), not
HuggingFace format. A new training run needs a valid `config.json` + `model.safetensors`
to load from. `merge_checkpoint.py` uses verl's own `scripts/model_merger.py` to
consolidate the 4 shards into a standard HF directory inside the same Modal volume.

The merge runs CPU-only (64 GB RAM, ~10 min for 7B model).

---

### Inspect / debug runs without training

```bash
# Run inference on N samples, save CSV of compile/test/speedup results
cd qwen-debug-rl/2-rl-model
modal run inspect_run.py --n-samples 20
modal run inspect_run.py --n-samples 50 --parquet debug_train
open inspect_results.csv
```

---

## Exp 5 — Debug with Better RL (5-train-debug-betterRL)

**Problem with exp3:** Speedup reward stacks 3 hard hurdles (fix compile errors → pass all
tests → beat GCC timing). Almost every sample returns reward=0, giving the model no gradient
to learn from. Mean reward flatlined despite occasional max spikes up to 1.5×.

**Changes in exp5:**

| Setting | Exp 3 | Exp 5 |
|---|---|---|
| Reward | `avg_speedup if all_pass else 0` | `passed/total` (0.0–1.0 fraction) |
| Epochs | 1 | 5 |
| GPU | h100:4 | a100-40gb:4 (cheaper) |
| hyperfine | required | not needed (no benchmarking) |

**Reward design:** `passed/total` gives gradient for partial fixes. A model that fixes 3/5
test cases gets `0.6` instead of `0`. Full pass → `1.0`. The optimization skill is learned
separately in the supercoder stage (exp4 / future exp6).

**Run:**

```bash
cd 5-train-debug-betterRL
modal run modal_train.py --detach
```

**Expected WandB signals if working:**
- `critic/rewards/mean` should be non-zero from step 1 (partial fixes already get credit)
- `critic/rewards/mean` trend should clearly increase (less noisy than exp3)
- `critic/rewards/max` approaching 1.0 as model learns to fully fix assembly