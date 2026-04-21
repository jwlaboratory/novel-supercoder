## Experiment 2: ‘A Debug Stage’

As we hypothesized in Experiment 1 (`old-experiments/multi-turn-agent/EXPERIMENT_THINKING_STAGE_README.md`), models are much better at **fixing or writing** assembly than at predicting what to improve — likely because training data (Stack Overflow, compiler bug threads, etc.) looks like "here is broken code and the error message, here is the fix," not "here is already-optimal `-O3` assembly, narrate flaws."

So we scrap the up-front "thinking" stage. Instead we add a **stage 3 debug agent**: if SuperCoder's output fails to compile or fails tests, hand the broken assembly + the compiler/test error back to a dedicated model and let it patch it.

Pipeline becomes:

```text
C + unoptimized asm  ──(SuperCoder)──►  optimized asm
                                        │
                                        ▼
                                 [compile + run tests]
                                        │
                              fail ◄────┴────► pass → done
                                │
                                ▼
             (broken asm + error + C) ──(Debug agent)──► fixed asm
```

**Data** (`2-rl-model/data/supercoder_{train,val}_fails.csv` → `debug_{train,val}.parquet`):


| Split         | Rows      | Source                                                                                         |
| ------------- | --------- | ---------------------------------------------------------------------------------------------- |
| `debug_train` | **4,139** | Qwen2.5-Coder-7B-Instruct generations on SuperCoder train that failed to compile or pass tests |
| `debug_val`   | **74**    | Same, on SuperCoder val                                                                        |


Each row has `c_code`, `unoptimized_assembly`, the broken `qwen_assembly`, `test_cases`, and the captured `error` (compile stderr or wrong-output diff), plus a ready `debug_prompt`.

Here's an example prompt (`debug_prompt` for row 0 of `supercoder_val_fails.csv`, the exact string sent to the model as a single-turn user message in both Exp 1 and Exp 2; built in `shared/debug_to_parquet.py`):

```text
You are an expert x86-64 assembly programmer. Fix the following incorrectly optimized assembly code for x86-64 Linux (compiled with gcc, linked with -lm). The assembly must compile with `gcc <file>.s -o <file> -lm` and produce correct output for all test cases. Output ONLY the corrected x86-64 assembly code — no explanations, no markdown fences, no additional text.

The error is:
Compile error:
/work/row_7/gen.s: Assembler messages:
/work/row_7/gen.s: Warning: end of file not at end of a line; newline inserted
/work/row_7/gen.s: Error: open CFI at the end of file; missing .cfi_endproc directive


The correct C code is:
```c
#include <stdio.h>
#include <strings.h>
int main() {
    int a,b;
    char s[15],t[15],u[15];
    scanf("%s %s", &s, &t);
    scanf("%d %d", &a, &b);
    scanf("%s", &u);
    if(strcmp(s,u) == 0) { --a; }
    else if(strcmp(t,u) == 0) { --b; }
    printf("%d %d\n", a, b);
    return 0;
}
```

The incorrectly optimized assembly is:
.file	"temp.c"
	.text
	... (broken asm body, ~70 lines; note missing .cfi_endproc at EOF) ...

Generated, correct but still optimized assembly:

```

Reward is computed on the model's continuation after "Generated, correct but still optimized assembly:" (see `reward.py` / `reward_debug.py`).

---

### Experiment 1: Debug RL from Qwen with the SuperCoder speedup reward (`debug1` / `exp3-qwen-debug`)

Base model **`Qwen/Qwen2.5-Coder-7B-Instruct`**, reward is the **exact same** speedup reward as SuperCoder (`shared/reward.py`): `0` if compile fails, `0` if any test fails, else `avg_speedup` vs the unoptimized reference.

Code: `2-rl-model/3-train-qwen-debug/modal_train.py`. 4× H100, 3 epochs configured, crashed at 256 steps (WandB run `tijo44v7`).

Results (from WandB run `tijo44v7`, sampled at `test_freq=100`):

| Step | Train `critic/rewards/mean` | Train `critic/rewards/max` | **Val `reward/mean@1`** | `response_length/mean` |
|------|:-:|:-:|:-:|:-:|
| 100  | 0.137 | 1.11 | **0.0288** | 1280 |
| 200  | 0.068 | 1.09 | **0.0291** | 1108 |
| (crashed at 256) | — | — | — | — |

**Analysis: didn't learn shit.** Val reward is **effectively flat at ≈0.029 across 200 steps**. The speedup reward stacks three hurdles in series — (1) fix the compile error, (2) pass all tests, (3) beat GCC's timing — and from a cold Qwen init it almost never clears even hurdle 1. The occasional `max=1.1` sample shows it *can* luck into a fast correct fix, but because the other 15 samples in the batch return exactly `0`, the `mean` is near zero and **drops** (0.137 → 0.068) as the policy drifts. This matches the story in Experiment 1 where over-constrained signals collapse the model; here it doesn't abstain, it just never gets any learning signal through the three AND-gates.

---

### Experiment 2: Debug RL from Qwen with denser reward + more epochs (`debug2` / `exp5-debug-betterRL`)

Same base model. Three changes vs Experiment 1:

| Setting | `exp3` (debug1) | `exp5` (debug2) |
|---------|-----------------|-----------------|
| Reward | `avg_speedup if all_pass else 0` | **`passed / total`** ∈ [0, 1] |
| Epochs | 1 (configured 3, crashed at 256) | **5** |
| GPU | h100:4 | a100-80gb:4 (cheaper) |
| hyperfine in reward | yes (timing) | no (compile + correctness only) |
| Training data | 4,139 fails | 4,139 fails (same, but we actually get through more epochs) |

Reward code: `2-rl-model/5-train-debug-betterRL/reward_debug.py`. The key line:

```python
# reward_debug.py
return passed / len(inputs)   # 0.0 → 1.0
```

A model that fixes 3/5 test cases now gets `0.6` instead of `0`. We deliberately drop the speedup term — the hypothesis is that learning *"produce compilable, correct assembly from a broken one + error"* and learning *"make it faster than `-O3`"* are **two separate skills**, and stacking them on one reward is why `exp3` stalled. Speedup comes back later as a downstream SuperCoder step.

Training went through. WandB runs `qjtrecgf` (first leg, crashed at 379) + `y8fs4hty` (continuation, 701 steps), stitched:


| Step | Train `critic/rewards/mean` | **Val `reward/mean@1*`* | `response_length/mean` |
| ---- | --------------------------- | ----------------------- | ---------------------- |
| 100  | 0.419                       | **0.105**               | 1202                   |
| 200  | 0.188                       | **0.221**               | 1090                   |
| 300  | 0.475                       | **0.215**               | 1062                   |
| 400  | 0.119                       | **0.297**               | 994                    |
| 500  | 0.425                       | **0.105**               | 1138                   |
| 600  | 0.344                       | **0.284**               | 977                    |
| 700  | 0.416                       | **0.297**               | 1068                   |


Val climbs **~10× from 0.029 (exp3 flat) → ~0.30 (exp5 peak)**. Train oscillates between 0.1 and 0.5 (partial-credit reward is inherently noisy at batch size 16), but `critic/rewards/max` is pinned at **1.0** throughout — the model reliably lands full fixes on some samples, which the sparse speedup reward would never have let it exploit. Response length hovers ~1.0 k tokens (no collapse into empty/length-10 degeneracies like exp4 exhibited).

#### Training curves (WandB)

All runs in project `[qwen-debug-rl](https://wandb.ai/shreybirmiwal-university-of-texas-at-austin/qwen-debug-rl)`. To tell the "didn't learn / did learn" story cleanly, overlay these four panels with both runs on the same x-axis (`training/global_step`):


| Panel                            | Y-axis (key)                 | What it shows                                                    | Exp3 (`tijo44v7`)                                   | Exp5 (`qjtrecgf` + `y8fs4hty`)                                |
| -------------------------------- | ---------------------------- | ---------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------- |
| **1. Val reward (the headline)** | `val-core/val/reward/mean@1` | end-to-end "is the model getting better on held-out debug data?" | **Flat ≈ 0.029** at step 100 and 200                | **0.10 → 0.22 → 0.22 → 0.30** (noisy up)                      |
| **2. Train mean reward**         | `critic/rewards/mean`        | does the reward signal propagate at all?                         | 0.137 → 0.068 (**drifting down**)                   | oscillates 0.12–0.48, no collapse                             |
| **3. Train max reward**          | `critic/rewards/max`         | can the policy ever hit full credit?                             | ~1.1 occasional (speedup reward goes >1) but sparse | **Consistently = 1.0** (full all-pass samples in every batch) |
| **4. Response length**           | `response_length/mean`       | sanity — is the model collapsing to empty output?                | 1100–1500 tokens (noisy but long)                   | ~1000 tokens (stable)                                         |


That four-panel grid alone carries the whole narrative: **flat val + drifting train reward = no learning** (Exp 1 / exp3) vs **rising val + stable-max train + healthy response length = real learning** (Exp 2 / exp5). In WandB use "Group: displayName" with the run IDs above and panel `x-axis = training/global_step`.

Additional panels worth attaching if you want to go deeper (same two runs):

- `actor/entropy_loss` — exp3 entropy collapses early (0.0053 → 0.0006) while stuck at zero reward, i.e. the model *locks in* a bad policy with no signal to escape; exp5 stays low too (reward shape is also peaky) but does not co-occur with a reward plateau.reward
- `actor/pg_loss` and `actor/grad_norm` — confirm the optimizer is actually stepping in both runs (it is), so "didn't learn" is a **reward** problem, not an **optimization** problem.
- `critic/advantages/mean` + `critic/vf_explained_var` — in exp3 advantages are ~0 because rewards are ~0; the value head has nothing to explain. Directly visualizes *why* nothing propagates.
- `perf/total_num_tokens` or `_runtime` — rough "compute used" for the cost-vs-lift discussion later.
- (Reference) `exp1-train-supercoder` (`cggdj2ax`) **val reward** oscillating **0.78–1.22** — good control to show that "val is trivially flat" is specific to exp3, not the project.

---

### Experiment 3: Evaluation — does debug2 actually help as a 2nd stage?

We ran four models on the same 74-sample debug validation split (broken-Qwen assembly + error + C → fix it). See `3-validation-benchmarks/inference-debug/infer.py`, `plot.py`, and `infer_comparison.png` for the full chart; `infer_summary.csv` for the numbers:


| Model                                   | Compile rate | All-tests pass rate | Mean correctness (−1…1) | Mean speedup (ALL_PASS only) |
| --------------------------------------- | ------------ | ------------------- | ----------------------- | ---------------------------- |
| Qwen-base (`Qwen2.5-Coder-7B-Instruct`) | 0.446        | **0.027** (2/74)    | −0.570                  | —                            |
| SuperCoder (`exp1`, optimize-asm RL)    | 0.446        | **0.027** (2/74)    | −0.546                  | —                            |
| Debug1 (`exp3`, bad reward)             | 0.473        | **0.027** (2/74)    | −0.526                  | —                            |
| **Debug2 (`exp5`, better reward)**      | **0.622**    | **0.189** (14/74)   | **−0.188**              | **2.81×** (n=1)              |


So **compile rate ~+18pp**, **all-pass rate ~~+16pp (~~7×)**, and mean correctness swings from a deep negative toward zero. On this benchmark, only `debug2` actually learned the debug task — `debug1` moves compile rate by a nudge but does not help more tests pass, and SuperCoder is no better than Qwen-base at fixing broken asm (it was never trained to).

See `3-validation-benchmarks/inference-debug/infer_comparison.png` for the 9-panel breakdown (compile rate, all-pass rate, mean correctness, status stacked bars, correctness distributions, and the single ALL_PASS speedup sample).

---

### Does this actually help SuperCoder in production though?

Debug val is Qwen-generated failures. The real question is: does chaining **SuperCoder → Debug2** on SuperCoder's *own* failures recover extra correctness?

We ran the SuperCoder checkpoint over the full `sc_val` split and dumped everything that failed into `3-validation-benchmarks/inference-error-check/supercoder_errors_sc_val.csv`.


| Metric                                                  | Value               |
| ------------------------------------------------------- | ------------------- |
| SuperCoder failures on `sc_val` (rows in the error CSV) | **9**               |
| Of those: `status` = `COMPILE_FAIL`                     | **9 (100%)**        |
| `status` = `RUNTIME_ERR` / `PARTIAL_`*                  | **0**               |
| `error_kind`                                            | `compile` for all 9 |


So SuperCoder only makes **9 mistakes**, and **all 9 are compile errors** — a narrow, very specific failure mode (e.g. malformed directives, missing `.cfi_endproc`, label typos, truncated output near the token limit).

Result: **it lowk didn't help with shit.** The debug agent we trained is *technically* good at fixing assembly, but not at fixing **these** assemblies.

---

### Why it didn't transfer

**1. Data distribution mismatch.** `debug2` was trained on **4,139 Qwen-Instruct failures** — which skew toward broad-base errors (wrong registers, wrong calling conventions, confused ABI, etc.). SuperCoder was already RL-trained to emit valid x86-64, so its residual errors are narrower: it mostly fails at the tail of the context window or on obscure directive corner cases. The debug model was never shown SuperCoder's failure *shape*, so Stage-3 sees inputs it wasn't trained on. Data distribution dominates.

**2. Only 9 errors to fix.** Even a perfect Stage-3 caps the end-to-end improvement at `9 / 200 ≈ 4.5pp` on `sc_val` all-pass rate. The ROI is small by construction.

**3. Compute.** A second model means a second forward pass per failing sample (plus a compile + test to decide whether to even invoke Stage-3). Training `debug2` was its own ~670-step RL run (A100-80GB × 4, several hours wall). For a +0pp real-world lift, that's a bad trade.

---

### Final takeaways

- The hypothesis *"LLMs are better at fixing than at critiquing"* held up: `debug2` **actually learned** the debug task (val 0.029 → 0.284, all-pass rate 2.7% → 18.9%). That's a genuinely stronger signal than anything we saw in Experiment 1's "thinking" stage.
- The sparse speedup reward from SuperCoder is wrong for this task — it AND-gates three hard things. The fractional `passed/total` reward gave dense per-step gradient and that's what made the difference, not just more epochs.
- But a debug agent only helps if it sees **your own pipeline's failures** during training. Training on Qwen-base failures and deploying after SuperCoder is the RL equivalent of buying the wrong replacement parts — the symptoms don't match.
- On `sc_val`, SuperCoder already fails very rarely (9/200) and the failures are concentrated in one mode (`COMPILE_FAIL`). A useful next iteration would target **that** mode specifically: build a debug set from **SuperCoder's** own failures (not Qwen's), and/or narrow the task to *"fix this compile error in this asm given this stderr"* rather than the general broken-assembly-to-fixed-assembly framing.
- Added cost: second model forward pass + training compute. Only worth it if the targeted failure mode is genuinely expensive (e.g. the 9 compile fails cost real speedup samples downstream in RL), or if we scale to a regime where SuperCoder fails more often.

Possible directions (not implemented):

- **Rebuild `debug_train` from SuperCoder failures** (`sc_train_fails_from_supercoder.csv`) — same pipeline, new source — and retrain `debug2`. Expected to actually transfer.
- **Targeted compile-fail fixer**: a much smaller RL task conditioned on GCC/clang `stderr`, since that's 100% of the residual failure mode on `sc_val`. Dynamic-error debugging is the regime LLMs are strongest at (stack traces → fixes).
- **Loop-cap multi-turn fixing** (3–5 retries max) to avoid whack-a-mole regressions where fixing one error breaks another.
- **Skip Stage-3 entirely at inference** when SuperCoder's output passes compile + tests, so the extra compute only fires on the small failing tail.

