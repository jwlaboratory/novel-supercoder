# Qwen Debug RL Experiments

## Experiment Matrix


| #   | Base Model                  | Stage 1 Training | Stage 2 Training | Eval Mode          | Intuition                                            |
| --- | --------------------------- | ---------------- | ---------------- | ------------------ | ---------------------------------------------------- |
| 1   | `Qwen2.5-Coder-7B-Instruct` | RL(debug)        | —                | debug only         | Can a stock Qwen learn to fix broken asm?            |
| 2   | `supercoder-7b`             | RL(debug)        | —                | debug + generation | Does knowing how to optimize first help debugging?   |
| 3   | `Qwen2.5-Coder-7B-Instruct` | RL(debug)        | RL(supercoder)   | debug + generation | Does debugging first help optimization? (curriculum) |


## Evaluation Modes


| Mode               | Task                | Input                       | Metric                                 |
| ------------------ | ------------------- | --------------------------- | -------------------------------------- |
| Debug eval         | Fix broken assembly | Broken asm + error + C code | Test case pass rate                    |
| Generation eval    | Optimize assembly   | C code + unoptimized asm    | Speedup (hyperfine) + correctness rate |
| Oneshot generation | Both in one pass    | C code + unoptimized asm    | Speedup + correctness                  |


## Experiment 1 Results — Qwen debug RL (all-or-nothing reward)

**Config:**

- Base model: `Qwen/Qwen2.5-Coder-7B-Instruct`
- Task: given broken assembly + error + C code → output fixed assembly
- Reward: `{-1.0 compile fail, -0.5 runtime error, 0.0 wrong output, 1.0 all tests pass}` (all-or-nothing)
- Hardware: 4× A100-80GB on Modal
- Steps run: 258 (1 epoch)
- Batch size: 16

**Training curve (mean reward per step):**

```
Steps 1–50:   avg reward = -0.232   (dominated by compile/runtime failures)
Steps 50–200: avg reward ≈ -0.20    (flat, no clear learning)
Steps 200–258: avg reward = +0.016  (barely crossed zero, very noisy)

Notable peaks: step 234 → 0.500, step 249 → 0.406
Notable lows:  step 2 → -0.594, step 15 → -0.531
```

**Verdict: did not learn meaningfully.**

The reward started at -0.469 and after 258 steps barely averaged above 0. The curve shows almost no trend — reward is essentially flat noise around -0.2 for the first 200 steps, with weak improvement in the last 50.

**Likely reasons for failure:**


| Cause                        | Evidence                                                                                                     | Fix                                          |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ | -------------------------------------------- |
| Sparse all-or-nothing reward | Model gets 0 even when it partially fixes the asm — no gradient for partial progress                         | Switch to fraction-based: `passed/total`     |
| Data too hard for base Qwen  | Broken asm from SuperCoder failures; base Qwen may not understand assembly well enough to fix systematically | Start from supercoder-7b (exp 2)             |
| Short run (258 steps)        | SuperCoder paper trains for much longer                                                                      | Run more epochs / more steps                 |
| Reward magnitude too small   | Max reward is 1.0; SuperCoder uses `avg_speedup` (2–5×) giving much larger gradient signal                   | Use continuous speedup reward even for debug |


---

## Reward Function Options


| Variant                     | On partial pass | On full pass                       | Notes                                                       |
| --------------------------- | --------------- | ---------------------------------- | ----------------------------------------------------------- |
| All-or-nothing              | 0.0             | 1.0                                | Sparse signal; what we use now for debug                    |
| Gradient (fraction)         | passed/total    | 1.0                                | Softer signal; helps early in training                      |
| Speedup-weighted            | 0.0             | avg_speedup (e.g. 2.5x)            | What SuperCoder uses; continuous, stronger gradient         |
| Correctness + speedup bonus | 0.0             | 1.0 + bonus if speedup > threshold | Prevents reward hacking (passing tests but regressing perf) |


**Current recommendation:** Use gradient (fraction) for debug training — the all-or-nothing reward likely explains why experiment 1 didn't learn. SuperCoder uses fraction internally (`check_correctness` returns `passed/total`) before the speedup step.

## Why Debug May Not Have Learned (Analysis)

Our `reward_score.py` diverges from `speedup_assembly_design2.py` in one key way:

- **Ours:** all-or-nothing → returns `1.0` if all tests pass, `0.0` otherwise
- **SuperCoder design2:** `check_correctness` returns `passed/total` as a soft signal; then if all pass, returns `avg_speedup` (continuous, unbounded above 1.0)

The sparse `{0, 1}` reward gives the policy almost no gradient when it's partially fixing things. Switch to fraction-based for debug.

## Reward Hacking Note

> dont want to reward hack for it to pass the test cases, want it to reward for maintaining speedup and passing test cases

For experiment 3 (supercoder stage), reward should be:

- `0` if any test fails
- `avg_speedup` if all tests pass AND speedup >= 1.0 (i.e. don't regress performance)
- This is exactly what `speedup_assembly_design2.py` does — copy it 1:1

## Implementation Status


| Component                                              | Status |
| ------------------------------------------------------ | ------ |
| `reward_score.py` (debug, all-or-nothing)              | Done   |
| `convert_to_parquet.py` (debug data)                   | Done   |
| `modal_train.py` modes 1 & 2                           | Done   |
| `supercoder_reward.py` (copy of design2)               | TODO   |
| `supercoder_to_parquet.py` (HF dataset → verl parquet) | TODO   |
| `modal_train.py` mode 3 (chained)                      | TODO   |
| Modal image: add `hyperfine`                           | TODO   |


## Todo

1. fix reward fn for debug to use gradient (fraction) not all-or-nothing
2. create `supercoder_reward.py` (1:1 copy of speedup_assembly_design2.py)
3. create `supercoder_to_parquet.py` (load `random1123anonymized/supercoder` HF dataset → parquet)
4. extend `modal_train.py` with mode 3 (run debug first, chain into supercoder RL from checkpoint)
5. add `hyperfine` to Modal image
6. benchmark all 3 experiments on val set
7. long context (sambit)
8. flag optimize (avi, shashank, vedant)

## Notes

- SuperCoder GPU: reward fn runs hyperfine inline during PPO rollout — this is slow (~30-60s per test case). Consider offloading to a separate CPU worker pool or reducing `--runs` in hyperfine to speed up training.
- Experiment 3 checkpoint chaining: after debug RL completes, read latest checkpoint from Modal volume and use it as `actor_rollout_ref.model.path` + `critic.model.path` for the supercoder RL run.





┌─────┬────────────┬────────┬────────────┬──────────────┬──────────────┐

  │ Exp │ Base Model │  Task  │ prompt_len │ response_len │ stop_token_i │

  │     │            │        │    gth     │     gth      │      ds      │

  ├─────┼────────────┼────────┼────────────┼──────────────┼──────────────┤

  │ exp │            │ optimi │            │              │ — (matches   │

  │ 1   │ Qwen2.5-7B │ ze asm │ 2000       │ 2000         │ paper        │

  │     │            │        │            │              │ exactly)     │

  ├─────┼────────────┼────────┼────────────┼──────────────┼──────────────┤

  │ exp │ supercoder │ fix    │            │              │ [151643,1516 │

  │ 2   │ -7b        │ broken │ 3000       │ 4096         │ 45]          │

  │     │            │  asm   │            │              │              │

  ├─────┼────────────┼────────┼────────────┼──────────────┼──────────────┤

  │ exp │            │ fix    │            │              │ [151643,1516 │

  │ 3   │ Qwen2.5-7B │ broken │ 3000       │ 4096         │ 45]          │

  │     │            │  asm   │            │              │              │

  ├─────┼────────────┼────────┼────────────┼──────────────┼──────────────┤

  │ exp │ exp3       │ optimi │ 3000       │ 4096         │ [151643,1516 │

  │ 4   │ checkpoint │ ze asm │            │              │ 45]          │

  └─────┴────────────┴────────┴────────────┴──────────────┴──────────────┘