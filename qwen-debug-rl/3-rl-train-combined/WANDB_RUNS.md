# W&B run log — `qwen-debug-rl`

**Entity / project:** `shreybirmiwal-university-of-texas-at-austin` / [`qwen-debug-rl`](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl)

**Scope:** Runs below were re-queried via W&B API **2026-04-18** (late UTC). Metrics use W&B keys (`val-core/val/reward/mean@1` = validation). **Debug exps (2, 3, 5)** use a **bounded / fractional** style metric from the debug reward; **exp1** val is **speedup-style** (can be **>1**) from `shared/reward.py`.

---

## W&B groups (UI)

Runs with the same `displayName` are easier to scan if you assign a **Group** in the W&B run table (gear → Group or run settings):

| W&B Group (your label) | `displayName` (VERL `experiment_name`) | Run ids in group |
|------------------------|----------------------------------------|------------------|
| **`ex2-supercoder-debug2`** | `exp2-supercoder-debug2` | `irmc58n9`, `92dyat8d` |
| **`exp5-debug-betterRL`** | `exp5-debug-betterRL` | `y8fs4hty`, `qjtrecgf` |

*(Group spelling `ex2-…` is intentional if that is what you set in W&B; repo folder / `EXPERIMENT_NAME` is `exp2-supercoder-debug2`.)*

The GraphQL API used here does **not** expose `group` on `Run`, so the table above reflects **your UI grouping**, not an automated field.

---

## Quick index (all tracked runs)

| displayName | run id | state (W&B) | last `training/global_step` | val `mean@1` (summary) |
|-------------|--------|-------------|----------------------------|-------------------------|
| exp5-debug-betterRL | `y8fs4hty` | running | 670 | ~0.284 |
| exp5-debug-betterRL | `qjtrecgf` | crashed | 379 | ~0.215 |
| exp2-supercoder-debug2 | `irmc58n9` | running † | 672 | ~0.105 |
| exp2-supercoder-debug2 | `92dyat8d` | crashed | 236 | ~0.092 |
| exp4-debug-supercoder | `2hwfxk0f` | crashed | 488 | 0 |
| exp1-train-supercoder | `cggdj2ax` | crashed | 418 | ~1.19 |
| exp3-qwen-debug | `tijo44v7` | crashed | 256 | ~0.029 |

† **`irmc58n9`:** Modal job was **Ctrl+C aborted** around step **~673** in your session; W&B may still show `running` briefly until the run finalizes — refresh the UI. Last polled summary: step **672**, val **~0.105**.

---

## Group `ex2-supercoder-debug2` — experiment `exp2-supercoder-debug2`

**Purpose:** Debug RL on the **debug** parquets; **reward** is speedup + hyperfine (`reward_debug.py`). **Code default** base is Hub `random1123anonymized/supercoder`; **logged W&B configs** for both runs use **on-volume actor/critic init** ` /checkpoints/exp1-train-supercoder/global_step_420/hf_model` (your exp1 export), not the Hub id.

**Setup:** `2-train-supercoder-debug2/modal_train.py` — `save_freq=100`, **`resume_mode=auto`** in current file; **first run** in W&B logged **`resume_mode=disable`**, **continuation** logged **`resume_mode=auto`** (matches “fresh dir then resume” story).

### Run `92dyat8d` (first) — [link](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl/runs/92dyat8d)

**State:** **crashed** · **236** steps · epoch **0** · val **~0.092** (flat @100 vs @200).

**Config note:** `trainer.resume_mode` = **`disable`**.

**Verdict:** No val lift in window; crash early.

### Run `irmc58n9` (continuation) — [link](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl/runs/irmc58n9)

**State:** W&B **running** at last poll; **672** steps · epoch **2** · val **~0.105** (still flat vs long plateau). Train `critic/rewards/mean` last **~0.15** (batch noise; was oscillating earlier).

**Config note:** `trainer.resume_mode` = **`auto`**.

**Modal:** If you **aborted** this job, treat as **stopped**; volume checkpoints should still include last **`save_freq`** boundary (e.g. **600** — confirm with `modal volume ls debug-rl-checkpoints /exp2-supercoder-debug2`).

**Verdict:** **Train moves; val stuck ~0.105** — good candidate to stop if saving GPU; grouping in W&B under **`ex2-supercoder-debug2`** keeps both legs together.

---

## Group `exp5-debug-betterRL` — experiment `exp5-debug-betterRL`

**Purpose:** Debug RL from **Qwen2.5-Coder-7B-Instruct** with **partial-credit / correctness-style** reward (`reward_debug.py` in exp5 folder; **no hyperfine** in reward). **5 epochs**, `total_training_steps` in critic config **1290** steps.

**Setup:** `5-train-debug-betterRL/modal_train.py` — `save_freq=100`, current file has **`resume_mode=auto`**. **First W&B leg** logged **`resume_mode=disable`**; **continuation** logged **`auto`**.

### Run `qjtrecgf` (first) — [link](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl/runs/qjtrecgf)

**State:** **crashed** · **379** steps · val **~0.215** (history: **0.105 → 0.221 → 0.215** @100/200/300).

**Config note:** `trainer.resume_mode` = **`disable`**.

**Verdict:** Early gain then plateau; crash before long horizon.

### Run `y8fs4hty` (continuation) — [link](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl/runs/y8fs4hty)

**State:** **running** · **670** steps · epoch **1** · val **~0.284** · train `critic/rewards/mean` **~0.54**.

**Config note:** `trainer.resume_mode` = **`auto`**.

**Verdict:** **Strongest debug val** in this project; noisy but above first leg (~0.215). Group **`exp5-debug-betterRL`** in UI stacks both runs for comparison.

---

## exp1-train-supercoder

**Purpose:** RL on **supercoder** data starting from **Qwen2.5-Coder-7B-Instruct**: C + slow asm → faster asm. **Reward:** speedup if compile + all tests pass, else 0 (`shared/reward.py` + hyperfine). **Setup:** `1-train-supercoder/modal_train.py` — 4× GPU, `max_response_length=2000`, 1 epoch, `sc_train` / `sc_val` parquets.

**W&B run:** [`cggdj2ax`](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl/runs/cggdj2ax) — **crashed** after **418** steps (~15.7 h wall). Last epoch index 0 in summary (single-epoch config; step count reflects batches through the epoch).

**Results (from history):** Validation `mean@1` moved **0.78 → 1.22 → 0.76 → 1.19** at steps 100 / 200 / 300 / 400 — high variance but **not stuck**; best logged val **~1.22**. Training `critic/rewards/mean` and `critic/score/mean` swung with val (e.g. **1.49 → 0.63 → 1.44 → 0.60**), consistent with speedup reward noise batch-to-batch. `response_length/mean` **~840–1125**, i.e. real-length generations.

**Learning vs stall:** **Genuine optimization signal** on both train and val; no collapse to zero reward. **Did not finish** — crash stopped the run before epoch completion; cause is outside W&B metrics (check Modal logs). `actor/ppo_kl` logged as 0 in summaries (same artifact as other exps — do not read as “no update” without verifying VERL logging).

---

## exp3-qwen-debug

**Purpose:** RL on **debug** data from scratch on **Qwen2.5-Coder-7B-Instruct**: broken asm + error + C → fixed asm. **Reward:** same speedup-based `reward.py` as supercoder (not the old discrete reward mentioned in older readme notes for an earlier attempt). **Setup:** `3-train-qwen-debug/modal_train.py` — longer context (`max_response_length=4096`), stop token ids set, **3 epochs**, `resume` mode, debug parquets.

**W&B run:** [`tijo44v7`](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl/runs/tijo44v7) — **crashed** at **256** steps (~7.5 h).

**Results:** Val `mean@1` **~0.029** at both 100 and 200 — **flat** in the logged window. Training `critic/rewards/mean` **0.137 → 0.068** — **weak and drifting down**. Matches the in-repo note: sparse signal for hard task from base Qwen.

**Learning vs stall:** **Little evidence of improvement** on val; training reward does not show a clean upward trend before crash. **Stalled / underpowered** for the objective in the steps observed, not a hardware-successful run.

---

## exp4-debug-supercoder

**Purpose:** Continue **supercoder** RL but initialize from **exp3** debug-tuned weights (default path `exp3-qwen-debug/global_step_258` in code). Same speedup reward and `sc_train` / `sc_val`. **Setup:** `4-train-debug-supercoder/modal_train.py` — **2 GPUs** (note: fewer than exp1), long context + stop tokens like debug recipes.

**W&B run:** [`2hwfxk0f`](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl/runs/2hwfxk0f) — **crashed** at **488** steps; **epoch 0** in summary.

**Results:** **Degenerate rollouts:** `response_length/mean` and `response_length/max` stuck at **10** for all sampled steps (100–400). **Train** `critic/rewards/mean` **0** throughout; **val** `mean@1` **0** throughout. PPO losses still non-zero — optimizer moves, but **policy output is effectively useless** for the task (immediate stop or empty-like completions).

**Learning vs stall:** **Not learning the task** — reward signal is uniformly zero because generations never reach valid solutions. Treat as **broken run / collapse**; fix generation (stopping, tokenizer, max length mismatch, or bad init) before interpreting training curves.

---

## Cross-run comparison (sharp)

| Experiment | Base init | Val behavior (W&B) | Train behavior | Interpretation |
|------------|-----------|--------------------|----------------|----------------|
| exp1 | Qwen | High, volatile speedup (~0.8–1.2) | Rewards move | **Strong signal**; crash interrupted |
| exp3 | Qwen | ~0.03 flat | Weak, down | **Poor scratch debug** |
| exp4 | exp3 ckpt | 0 | 0 reward, len 10 | **Collapsed generations** — fix rollout |
| exp2 | Supercoder (exp1 ckpt in logged runs) | ~0.09 early; continuation ~0.105 flat | Oscillates | **Train moves, val stuck** |
| exp5 | Qwen + better reward | Up to ~0.28+ with dips | Volatile but non-zero | **Most promising debug run** |

---

## Notes

- **Duplicate display names:** distinguish by **run id** (`name`) and **createdAt**; use **W&B Group** to bundle first + continuation legs.
- **PPO KL = 0** in summaries — verify in VERL / W&B whether KL is truly zero or a logging default.
- **Failure modes:** pair with **Modal** stderr for the same app id.
