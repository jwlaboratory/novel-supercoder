# SuperCoder replication experiments: what differs and why results diverged

This guide compares several folders under `novel-supercoder/src/experiments` that all touch “Qwen on Modal + assembly + benchmarking,” but are **not** interchangeable. The headline: **low compile rates were usually an environment or pipeline mismatch**, not proof that the base model is useless. The **`run-their-paper-exactly`** track is the one that finally matched the paper’s reported **compile / test-pass** ballpark (~79% / ~61% on the full `val` split of 200).

The folder **`paper-hf-aligned-control`** is a **named positive control**: it runs the **same** pipeline on **`random1123anonymized/supercoder` `val`** only, so **both** the corpus and the toolchain match the paper. A fresh subset run (**n = 40**) reproduced **high compile and high test-pass** in the same range as full `val` (see [§ `paper-hf-aligned-control`](#paper-hf-aligned-control)).

A separate folder, **`compare-datasets`**, only compares **Hugging Face corpora** (schema, size, and whether KPS submissions match paper `c_code` strings). It does not run Modal or the benchmark.

**`run-kps-like-paper-exactly`** reuses the **same** Modal generator and SuperCoder Docker benchmark as `run-their-paper-exactly`, but builds rows from **`KrishPS/codenet-accepted-c`** (KPS): accepted C submissions, tests parsed from `test_cases`, and **`-O0` assembly** produced in-container with `gcc -S -O0` so prompts match the paper’s “C + unopt asm → optimized asm” template. **`run_autonomous.sh` now defaults `SHUFFLE_SEED=42`** before taking `LIMIT` rows—raw HF `train` order clusters many rows from the **same** `problem_id` at the start (often tiny “two loop” solutions), which is **not** a representative KPS sample.

---

## Quick comparison


| Aspect                             | `experiment-qwen-coder-modal-100-dataset`                                    | `experiment-copying-paper`                                                                                              | `run-their-paper-exactly`                                                                                           |
| ---------------------------------- | ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Data source**                    | Local `data.csv` (e.g. 100 sampled rows with `answer`, `test_cases`)         | Hugging Face `random1123anonymized/supercoder` via `prepare_supercoder_run.py`                                          | Same HF dataset; can use full `val` (200) or other limits                                                           |
| **Prompt**                         | Custom English template: C + `gcc -O3` asm in fences, “output optimized asm” | Paper-style prompts from the dataset, saved as `prompt_supercoder_main.txt` (same text as `extra_info.question`)        | Same paper prompts as copying-paper                                                                                 |
| **Generation**                     | Modal + vLLM, **single user message** (`llm.chat`)                           | Modal + vLLM, **chat messages** (optional few-shot + user content)                                                      | Modal + vLLM, `**AutoTokenizer.apply_chat_template` → single string → `llm.generate`** (“SGLang-style” formatting)  |
| **Primary benchmark**              | `**hyperfine-bench`** in Docker (`gcc:13`, `linux/amd64`)                    | `**run_supercoder_benchmark_from_modal.py**` → SuperCoder `test_benchmark.py` (often run on **host Python / host gcc**) | SuperCoder benchmark run inside `**supercoder-x86-bench`** Docker image with **container paths** (`/workspace/...`) |
| **What “worked” for paper parity** | Different goal (CSV pipeline + our bench tool)                               | Right data + prompts, but easy to get **0%** on SuperCoder bench if the **host OS/arch/toolchain** is wrong             | Fixes generation formatting + **Linux x86-64 gcc** bench + correct **mount paths** inside Docker                    |


**`run-kps-like-paper-exactly`** (see dedicated section below) is the same stack as **`run-their-paper-exactly`**, but problems come from **KPS** with docker-built **`-O0`** asm in the prompt and **`--from-manifest-only`** for the benchmark.

---

## `paper-hf-aligned-control`

**Intent:** Package an explicit **paper-dataset + paper-pipeline** run in one place so you can cite it next to the **KPS swap** experiment. It mirrors `run-their-paper-exactly/run_full_val200_check.sh`: `prepare_supercoder_run.py` on **`random1123anonymized/supercoder`** `val` → **`modal run`** on `modal_generate_supercoder_prompt_sglang_style.py` → **`run_supercoder_benchmark_from_modal.py`** inside **`supercoder-x86-bench`** with container **`--run-dir`** and HF **`--split val`** / **`--limit N_ROWS`**.

**Results (compile + strict SuperCoder I/O pass rate)**

| Citation (artifact) | Data | n | Compile rate | Accuracy (test-pass) |
| ------------------- | ---- | --- | ------------ | -------------------- |
| [`run-their-paper-exactly/results/20260411_211823_val200_exactcheck/supercoder_bench/problem_results.json`](run-their-paper-exactly/results/20260411_211823_val200_exactcheck/supercoder_bench/problem_results.json) | Paper HF `val` | **200** | **79.0%** (158/200) | **61.5%** (123/200) |
| [`paper-hf-aligned-control/results/20260411_231652_paper_hf_control_n40/experiment_record.json`](paper-hf-aligned-control/results/20260411_231652_paper_hf_control_n40/experiment_record.json) | Paper HF `val` (first rows) | **40** | **85.0%** (34/40) | **62.5%** (25/40) |
| [`.../20260411_223718.../simple_io_summary.json`](run-kps-like-paper-exactly/results/20260411_223718_kps_like_paper/supercoder_bench/simple_io_summary.json) | KPS `train` **sequential** rows 0–199 (**1** unique `problem_id` — biased) | **200** | **96.5%** (193/200) | **1.0%** (2/200) |
| [`.../20260411_233124.../simple_io_summary.json`](run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/supercoder_bench/simple_io_summary.json) | KPS `train` **`shuffle_seed=42`** before limit (**149** unique `problem_id`) | **200** | **62.0%** (124/200) | **22.5%** (45/200) — `bench_correctness_simple.py`; default `run_autonomous.sh` |

**Takeaway:** With **paper data + paper stack**, **both** link-time compile rate and **I/O correctness** stay in the paper’s ballpark (subset and full `val` agree in order of magnitude). The table’s **sequential KPS row** is **one problem × 200 submissions** (not a difficulty sample). The **shuffled** KPS row matches **broader** problem mix (**149** distinct `problem_id`): **compile** drops toward paper-like levels (**~62%** vs paper **~79%**) and **I/O accuracy** rises to **~22.5%** (still below paper **~61%** on curated `val`, but not the misleading **~1%** from the sequential head).

**Reproduce**

```bash
cd novel-supercoder/src/experiments/paper-hf-aligned-control
N_ROWS=40 JWLABS=/path/to/jwlabs ./run_autonomous.sh   # fast control
N_ROWS=200 JWLABS=/path/to/jwlabs ./run_autonomous.sh  # full val (long Modal job)
```

Each run writes `results/<timestamp>_paper_hf_control_n<N>/experiment_record.json` next to `supercoder_bench/problem_results.json`.

---

## `experiment-qwen-coder-modal-100-dataset`

**Intent:** End-to-end “our” pipeline: take rows from a CSV, generate `-O3` reference asm in a shared container, ask Qwen (Modal) for better asm, then score with `**hyperfine-bench`**.

**Why results looked terrible (e.g. ~0% compile in notes):**

1. **Not the paper’s task wording.** The model sees a *different* prompt (C + O3 asm + custom instructions) than SuperCoder’s official `extra_info.question`. That alone changes behavior a lot.
2. **Different scorer.** `hyperfine-bench` is not SuperCoder’s `test_benchmark.py` + `metrics.py`. Pass/fail and “compile” semantics can disagree with the paper.
3. **Sampling.** Rows come from `data.csv`, not necessarily the same index set or split as the paper’s `val` evaluation.

**Takeaway:** This folder is a valid **internal** benchmark (CSV + Modal + Dockerized gcc). It is **not** a direct read on whether the SuperCoder paper’s numbers are honest.

---

## `experiment-copying-paper`

**Intent:** Reuse **their** dataset text, **their** assembly extraction rules, and **their** benchmark code, while still running Modal for GPUs and optionally comparing against `hyperfine-bench`.

**Why SuperCoder numbers could still collapse (e.g. `paper_compilation_rate_pct: 0` in a 100-row run while “our” Docker bench showed ~28% compile):**

1. **Where `3_run_supercoder_benchmark.sh` runs.** It invokes `run_supercoder_benchmark_from_modal.py` with `**uv run` on the host**. On macOS (especially Apple Silicon), **host `gcc` is not the same as Linux x86-64 `gcc`**. The model emits **x86-64 GNU assembler** (often with `@PLT`, `.section`, etc.). That can fail to assemble or link on the wrong toolchain, producing **artifact 0% compile** even when the `.s` files are fine on Linux.
2. **Inference formatting.** The Modal script here uses `**vllm.LLM.chat(...)`** with message lists. That is usually close to the instruct model’s chat template, but can differ slightly from servers that apply the template exactly the way SGLang / the original code path did.
3. **Path bugs when using Docker manually.** Any benchmark that receives a **host absolute path** (e.g. `/Users/.../run`) inside a container that only mounts `/workspace/...` will silently **not find** `rows/.../out/*.s`, yielding empty inputs and **0% compile** for the wrong reason.

**Takeaway:** `experiment-copying-paper` is structurally “paper-faithful,” but **the benchmark must run in a Linux x86-64 gcc environment** (or Modal Linux runner) with **paths visible inside that environment**. Without that, results are easy to misread.

---

## `run-their-paper-exactly`

**Intent:** Same as above, but explicitly optimized for **reproduction**: vendor-pinned SuperCoder code, Modal for GPUs, Docker image `docker/x86_64-benchmark.Dockerfile` (`supercoder-x86-bench`), and scripts that avoid the worst foot-guns.

**What changed vs the earlier folders (why it “finally worked”):**

1. **Chat template explicitly.** `modal_generate_supercoder_prompt_sglang_style.py` builds prompts with `**transformers.AutoTokenizer.apply_chat_template`** and calls `**generate**` on the rendered string—closer to how chat-templated inference is often done in the paper’s stack than a bare `chat()` loop (subtle but can matter at the margin).
2. **Benchmark in Linux x86 Docker** with `**python3`** and deps installed in-container, and `**--run-dir` set to the in-container path** (e.g. `/workspace/novel-supercoder/...`), not `/Users/...`.
3. **Full paper `val` slice (200 rows)** for the check that matched ~**79% compile / ~61.5% test pass**—aligned with the paper’s ~77.9% / ~61.4%.

**Caveats that remain:**

- **Speedup / hyperfine:** The pinned `hyperfine` in the image may not support every CLI flag their code expects (`--input`), so **speedup metrics** can be wrong or default to `1.0x` until hyperfine is version-matched to their exact invocation.
- **Modal vs local SGLang** is still a deliberate deviation for GPUs; compile/correctness were still close once Linux gcc + paths + prompting were fixed.

---

## Mental model: five different questions

1. `**experiment-qwen-coder-modal-100-dataset`:** “How does Qwen do on **our** CSV task with **hyperfine-bench**?”
2. `**experiment-copying-paper`:** “Can we drive **SuperCoder’s** benchmark on **their** prompts from HF?” (Yes, if the **runtime** is Linux x86 gcc and paths are correct.)
3. `**run-their-paper-exactly`:** “Do we get **paper-like** compile and test-pass rates when we align toolchain, paths, and prompting?” (For the base model on `val`, **yes—roughly**.)
4. **`run-kps-like-paper-exactly`:** “If we **don’t** change the generator or benchmark—only the **problems** (KPS instead of the paper split)—what compile / test-pass do we get?” (Empirical; use **shuffled** `train` slices—the cited **200-row** artifact was **sequential** and **not** representative.)
5. **`paper-hf-aligned-control`:** “If we hold the **paper pipeline** fixed and only use **paper `val` data**, do we still see **high compile and high accuracy**?” (**Yes**—see table in that section.)

---

## Practical advice

- If you want numbers comparable to the **SuperCoder paper**, use `**run-their-paper-exactly`** (or `experiment-copying-paper` **only** if you run the SuperCoder benchmark in **Linux x86-64 Docker** with correct mounted paths).
- If you see **0% compile** with plausible-looking `.s` files, check **(a)** OS/arch of `gcc`, **(b)** whether the benchmark process can **see** the files, **(c)** whether the “paper” column is actually SuperCoder’s code or a different tool.
- Treat `**experiment-qwen-coder-modal-100-dataset`** as a **separate experiment**; do not use it to validate or falsify the paper’s table.

---

## HF dataset comparison: KrishPS (KPS) vs paper SuperCoder

**What we compared:** [KrishPS/codenet-accepted-c](https://huggingface.co/datasets/KrishPS/codenet-accepted-c) (“KPS” in repo docs—the CodeNet accepted-C mirror used for sampling / `data.csv` style pipelines) versus [random1123anonymized/supercoder](https://huggingface.co/datasets/random1123anonymized/supercoder) (authors’ SuperCoder release consumed by `prepare_supercoder_run.py`).


| Aspect                       | KrishPS/codenet-accepted-c                                                              | random1123anonymized/supercoder                                                                                                                                                                                                                              |
| ---------------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Splits**                   | Single split `train`, **313,360** rows                                                  | `train` **7,872** rows, `val` **200** rows                                                                                                                                                                                                                   |
| **Row meaning**              | One **accepted submission** per row (`problem_id`, `submission_id`)                     | One **superoptimization benchmark** instance with RL-style top-level fields                                                                                                                                                                                  |
| **Top-level columns**        | `problem_id`, `submission_id`, `code`, `test_cases` (JSON **string**), `num_test_cases` | `data_source`, `prompt`, `ability`, `reward_model`, `extra_info`                                                                                                                                                                                             |
| **Task payload**             | C source in `code`; tests in `test_cases`                                               | C in `extra_info.c_code`; tests as parallel `**inputs` / `outputs` lists**; paper prompts in `question` / `c_only_question`; `**-O0` / `-O3` assembly** in `unoptimized_assembly` and assembly extracted from a fenced `assembly` code block inside `answer` |
| **Stable id**                | `problem_id` (e.g. `p00000`)                                                            | Integer `extra_info.index` **within the HF split** (0…N−1), **not** a CodeNet problem id                                                                                                                                                                     |
| **Overlap with KPS `train`** | —                                                                                       | **0** KPS rows whose `code` equals any paper `extra_info.c_code`, both **byte-identical** and **whitespace-collapsed** (checked for all of `val`+`train` vs full KPS `train`)                                                                                |


**Interpretation:** The two datasets serve different jobs. KPS is a large pool of accepted solutions (multiple submissions per problem). The paper dataset is a curated SuperCoder benchmark with **fixed prompts, assembly context, and evaluation hooks**. The lack of exact `c_code` matches does **not** by itself rule out distant shared CodeNet lineage (e.g. different normalization or a non–KPS export path); it **does** mean you cannot treat a KPS row and a paper row as the same record without your own join key.

**C size (lines of code) and tests:** Paper `val` (200) has **~23 lines** of `c_code` median (**~65** max). KPS **depends on how you slice** `train`: the **first 200 rows** are **not representative**—they skew to **very short** C (**~12** lines median) and **one** `test_cases` entry each (**and are often the same `problem_id` repeated**). A **random 200** (`shuffle(seed=42)`) looks **longer on average** (**~32** mean, **~22.5** median, **475** max) with **~103** tests per row in the JSON—similar ballpark to the paper’s stored I/O count. The **sequential** 200-row KPS bench artifact (`20260411_223718`) matches that tiny-C head; the **shuffled** 200-row run (`20260411_233124`) matches the broader LOC/test profile. Unoptimized **assembly** in the paper set is large (**~126 lines** median) because it is full `gcc -O0` output for those programs.

**Other gaps beyond LOC:** (1) **Curation**—paper problems are chosen for superoptimization; KPS rows are **any** accepted style for a contest problem. (2) **Prompting**—paper `extra_info.question` is tuned to their template; we approximate with the same English template + `gcc -S -O0` on **that row’s** C. (3) **Semantics**—a submission can be judge-correct yet **fragile** under a different codegen path (VLAs, UB, I/O quirks). (4) **Evaluation**—strict **byte-identical** stdout vs expected strings. (5) **Multiple submissions per problem** in KPS vs one row per benchmark in paper.

Machine-readable LOC/test stats: `compare-datasets/results/loc_and_tests_kps_vs_paper.json`.

**Reproduce / refresh:** From `novel-supercoder`:

```bash
uv run python src/experiments/compare-datasets/compare_hf_datasets.py
```

Machine-readable output: `compare-datasets/results/kps_vs_paper_supercoder.json` (includes column lists, row counts, overlap counts, and UTC timestamp).

---

## `run-kps-like-paper-exactly`

**Intent:** Hold the **paper’s inference + evaluation stack** fixed (Modal `modal run` on `modal_generate_supercoder_prompt_sglang_style.py`, SuperCoder `test_benchmark.py` inside `supercoder-x86-bench`) and only replace the **dataset** with **[KrishPS/codenet-accepted-c](https://huggingface.co/datasets/KrishPS/codenet-accepted-c)**.

**How it works**

1. `**prepare_kps_supercoder_run.py`** — Writes the same per-row layout as the paper prepare step (`inputC.c`, `input_tests.json`, `manifest.jsonl`, `prompt_supercoder_*.txt`, …). Tests come from KPS `test_cases` JSON (capped at 10, like the benchmark). `**--compile-o0-docker**` runs `gcc -S -O0` per row **inside** `supercoder-x86-bench` so `prompt_supercoder_main.txt` includes real `**-O0`** assembly (same wording as the paper prompts). The run directory **must live under** your `JWLABS` root so Docker can see it at `/workspace/...`.
2. `**run_autonomous.sh`** — Prepare (with O0) → **Modal** generation (`modal run …`, `PROMPT_KEY` default `main`) → Docker benchmark with `**--from-manifest-only`** so problems are read from the run dir (not HF), avoiding index skew versus KPS.
3. `**experiment-copying-paper/run_supercoder_benchmark_from_modal.py**` — Gained `**--from-manifest-only**` and a fix so `**manifest.jsonl` host paths** that do not exist inside Linux Docker fall back to `run_dir/rows/row_XXXXX/` (otherwise `input_tests.json` / `inputo0.s` were silently empty and metrics were nonsense).

**Recorded results (not paper replication)**


| Run | Rows | Model | Compile rate | Test-pass (accuracy) | How scored |
| --- | --- | --- | --- | --- | --- |
| `20260411_222009_kps_like_paper` | 10 | Qwen2.5-Coder-7B-Instruct | **90%** (9/10) | **0%** | SuperCoder `problem_results.json` (full bench) |
| `20260411_223718_kps_like_paper` | **200** (KPS `train`, **sequential** — **1** unique `problem_id`) | same | **96.5%** (193/200) | **1.0%** (2/200) | `bench_correctness_simple.py` |
| `20260411_233124_kps_like_paper` | **200** (KPS `train`, **`shuffle_seed=42`** — **149** unique `problem_id`) | same | **62.0%** (124/200) | **22.5%** (45/200) | `bench_correctness_simple.py` (default `BENCH_MODE=simple`) |

**200-row sequential artifact (historical / biased):** `20260411_223718` used **`shuffle_seed: null`**. That slice is **200 rows from a single `problem_id`**—**do not** treat it as KPS difficulty. **`run_autonomous.sh` defaults `SHUFFLE_SEED=42`** unless `SHUFFLE_SEED=off`.

**200-row shuffled artifact:** `20260411_233124` — full pipeline logged in `experiment_stdout.log` in that run dir. Default scoring uses **`bench_correctness_simple.py`** because the stock **`run_supercoder_benchmark_from_modal.py`** path (thread pool + hyperfine) can hit **SIGKILL (137)** on large KPS runs; set **`BENCH_MODE=full`** to attempt the full SuperCoder bench when the Docker host has enough RAM.

**Smaller smoke runs** (`20260411_222009` n=10, `20260411_221648` n=1) also used **sequential** `train` head—same bias warning.

Interpretation: With a **representative** KPS slice (shuffled), **compile** and **accuracy** move into the same **order of magnitude** as paper `val` under the **same** scorer—still lower than curated SuperCoder `val` because KPS rows are **not** the paper benchmark set. The old **sequential** 200-row run inflated compile (tiny repeated programs) and **collapsed** accuracy (one hard problem × 200).

**Reproduce**

```bash
cd novel-supercoder/src/experiments/run-kps-like-paper-exactly
# Representative KPS slice (default SHUFFLE_SEED=42):
JWLABS=/path/to/jwlabs LIMIT=200 ./run_autonomous.sh
# Reproduce old sequential-head behavior only if intentional:
SHUFFLE_SEED=off JWLABS=/path/to/jwlabs LIMIT=200 ./run_autonomous.sh
```

(`JWLABS` defaults to four parents above this folder, i.e. the repo root that contains `novel-supercoder` and `SuperCoder`.)

---

## FAQ: “200 rows” vs “200 questions” vs `unique problem_id`

**What we always score:** **200 dataset rows** — i.e. **200** independent passes through prepare → Modal → compile/I/O check. Each row is one **KPS record**: one **accepted submission** (`submission_id`) for some contest **problem** (`problem_id`). So you always get **200** generations and **200** scores.

**What `unique problem_id` means:** It counts **how many distinct contest problems** appear among those 200 rows. It does **not** mean “we only ran the benchmark once.”

- **Sequential `train` head (`20260411_223718`):** Hugging Face row order puts many submissions for the **same** problem together. The first **200** rows in that order were **200 different submissions** but all for **one** `problem_id`. So: **200 evaluations**, **1** underlying programming task (with tiny C, mostly one stored test in that slice — see LOC stats below). Accuracy **~1%** is “the model almost never matched that one task’s tests across 200 tries,” not “KPS has 1% accuracy in general.”

- **Shuffled slice (`20260411_233124`):** We **`shuffle(seed=42)` the full KPS `train` split**, then take the **first 200** rows of that permutation. That is a **deterministic pseudo-random** sample, not “uniform over all CodeNet,” but it **breaks** the HF clustering. Those **200** rows contained **149** distinct `problem_id` values — the other **51** rows are **repeat problems** (second or third accepted submission for a problem that appeared again in the draw). So you still have **200** scored rows, but they cover **149** different tasks (plus duplicates).

**In short:** “200” = **200 scored submissions**. “1 unique `problem_id`” = those 200 submissions were almost all **the same contest problem** (sequential artifact). “149 unique” = a **much broader** mix of problems (shuffled artifact).

---

## Hypothesis → reasoning → experiment → citations → results → takeaways (KPS vs paper `val`)

This block ties together **sampling**, **dataset design**, and **measured numbers** so the comparison to the paper is harder to misread.

### Hypotheses

1. **H1 (sequential head is a confound):** Taking the **first** 200 KPS `train` rows measures **repeated submissions for a tiny set of problems** (in the recorded artifact, a **single** `problem_id`), so compile/accuracy on that slice **do not** estimate “KPS vs paper benchmark” difficulty.

2. **H2 (curation gap):** [random1123anonymized/supercoder](https://huggingface.co/datasets/random1123anonymized/supercoder) `val` is a **curated superoptimization benchmark** (fixed prompts, intended task distribution). [KrishPS/codenet-accepted-c](https://huggingface.co/datasets/KrishPS/codenet-accepted-c) is a large pool of **judge-accepted** solutions with **many submissions per problem**. Even with the **same** codegen + bench stack, **pass rate on a shuffled KPS draw should not be expected to match** `val`.

3. **H3 (program shape / tests):** The sequential KPS head has **much shorter C** and **far fewer stored tests** in the JSON than paper `val` or a shuffled-200 slice — so **difficulty and evaluation signal** differ by slice before the model is invoked.

4. **H4 (no row-level identity with paper):** There is **no** exact `c_code` ↔ KPS `code` match between paper HF rows and KPS `train` (see dataset comparison JSON). So “lower than paper” is **not** “same problems, worse model”; it is **different problems** plus different curation.

### Reasoning

- KPS rows are **submissions**, not “one row per benchmark” like paper `val`. HF order can list **hundreds of rows per problem** before moving on, so **`LIMIT=200` without shuffle** can be **one problem × 200 submissions** — which is exactly what `manifest.jsonl` shows for `20260411_223718` (**1** unique `problem_id`).

- A **shuffle-then-slice** fixes **representativeness of the HF ordering**; it does **not** turn KPS into the paper’s `val` split. Curated benchmarks tend to **select** problems where superoptimization is meaningful and evaluation is stable; accepted contest code can be **correct for the judge** yet **fragile** for strict I/O or gcc-assembled pipelines.

- **Lines of code and stored I/O counts** (cheap proxies for “how big / how heavily tested is this row?”) already differ sharply between sequential KPS head, shuffled KPS-200, and paper `val` — see machine-readable stats below.

### Experiment runs (what we actually did)

| Label | Data | Sampling | Pipeline | Scoring |
| ----- | ---- | -------- | -------- | ------- |
| Paper `val` 200 | `random1123anonymized/supercoder` `val` | Official **200** validation rows | `run-their-paper-exactly` (Modal SGLang-style gen + Linux Docker) | Full SuperCoder path → `problem_results.json` |
| KPS sequential 200 | `KrishPS/codenet-accepted-c` `train` | First **200** HF rows (no shuffle) | `run-kps-like-paper-exactly` (same Modal script; KPS prepare + `-O0` in Docker) | `bench_correctness_simple.py` (I/O, ≤10 tests; no hyperfine) |
| KPS shuffled 200 | same | **`shuffle(seed=42)`** then first **200** rows | same | same (`BENCH_MODE=simple`) |

**Note on comparators:** Paper `val` numbers below use the **official** SuperCoder aggregation in `problem_results.json`. KPS numbers use **`bench_correctness_simple.py`** (lighter; avoids SIGKILL on large runs). Both check **gcc** of generated `.s` and **strict stdout** vs expected on stored tests (KPS caps at **10** tests per row in prepare). So the KPS vs paper gap is **conservative** for “task difficulty / curation” conclusions, but the **absolute** percentages are not identical metrics down to hyperfine and thread pool behavior.

### Citations (artifacts in this repo)

| Artifact | What it is |
| -------- | ---------- |
| [`run-their-paper-exactly/results/20260411_211823_val200_exactcheck/supercoder_bench/problem_results.json`](run-their-paper-exactly/results/20260411_211823_val200_exactcheck/supercoder_bench/problem_results.json) | Paper `val` n=200, full bench |
| [`run-kps-like-paper-exactly/results/20260411_223718_kps_like_paper/supercoder_bench/simple_io_summary.json`](run-kps-like-paper-exactly/results/20260411_223718_kps_like_paper/supercoder_bench/simple_io_summary.json) | KPS sequential 200-row summary |
| [`run-kps-like-paper-exactly/results/20260411_223718_kps_like_paper/manifest.jsonl`](run-kps-like-paper-exactly/results/20260411_223718_kps_like_paper/manifest.jsonl) | Per-row `kps_problem_id` (used to count uniqueness) |
| [`run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/supercoder_bench/simple_io_summary.json`](run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/supercoder_bench/simple_io_summary.json) | KPS shuffled 200-row summary |
| [`run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/manifest.jsonl`](run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/manifest.jsonl) | Shuffled run manifest |
| [`run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/experiment_stdout.log`](run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/experiment_stdout.log) | End-to-end log for shuffled run |
| [`compare-datasets/results/loc_and_tests_kps_vs_paper.json`](compare-datasets/results/loc_and_tests_kps_vs_paper.json) | LOC + stored test-count statistics (KPS slices vs paper `val`) |
| [`compare-datasets/results/kps_vs_paper_supercoder.json`](compare-datasets/results/kps_vs_paper_supercoder.json) | Schema / size / **zero** exact `c_code` overlap |

### Results

**End-to-end compile / I/O pass (as recorded):**

| Run | Scored rows | Unique `problem_id` | Compile | I/O accuracy |
| --- | ----------- | ------------------- | ------- | ------------ |
| Paper `val` | 200 | 200 distinct benchmarks (by construction) | **79.0%** (158/200) | **61.5%** (123/200) |
| KPS sequential | 200 | **1** | **96.5%** (193/200) | **1.0%** (2/200) |
| KPS `shuffle_seed=42` | 200 | **149** | **62.0%** (124/200) | **22.5%** (45/200) |

**Dataset shape (proxy stats from `loc_and_tests_kps_vs_paper.json`):**

| Slice | C lines median (n=200) | Stored tests in JSON (median) |
| ----- | ---------------------- | ------------------------------ |
| Paper `val` | **22** | **103** I/O pairs (mean ~90) |
| KPS sequential rows 0–199 | **12** | **1** test object per row |
| KPS shuffle(seed=42) n=200 | **22.5** | **103** test objects per row (mean ~85) |

So the **shuffled** KPS 200-row draw is **much closer to paper `val`** on these proxies than the **sequential** head; the sequential head is **not** comparable to “200 paper problems.”

### Takeaways

1. **Always report how KPS rows were sampled.** `LIMIT=200` without shuffle can be **one problem repeated**; `shuffle_seed=42` (default in `run_autonomous.sh`) is the right default for a **broad** KPS slice.

2. **`unique problem_id` summarizes problem diversity**, not how many times the pipeline ran. **200 rows ⇒ 200 scores.**

3. **Lower shuffled KPS accuracy vs paper `val` is expected** from **curation** (paper benchmark vs accepted submissions) and **zero exact program overlap** with paper HF rows — not automatically a regression in the toolchain.

4. **Compile rate** on shuffled KPS (**~62%**) is **closer** to paper (**~79%**) than the sequential artifact suggested (**~96.5%** on tiny repeated programs), which aligns with **harder / more varied** programs after shuffle.

5. For **stricter** alignment to the paper’s scorer on KPS, use **`BENCH_MODE=full`** when the Docker host can sustain the full SuperCoder benchmark (see `run-kps-like-paper-exactly/run_autonomous.sh`).

---

## Artifact pointers (examples in-repo)

- `experiment-copying-paper/results/20260411_201420/paper_vs_ours_summary.json` — illustrates **0%** SuperCoder compile on host vs **non-zero** alternate bench on the same run.
- `run-their-paper-exactly/results/20260411_211823_val200_exactcheck/supercoder_bench/problem_results.json` — **~79% compile, ~61.5% accuracy** on 200 `val` rows after the fixes above.
- `run-their-paper-exactly/results/20260411_211823_val200_exactcheck/supercoder_bench/failure_analysis/FAILURES_REVIEW.md` — **human-readable failure forensics** (compile vs I/O buckets, `gcc` stderr, C snippets); regenerate with `analyze_val200_failures_docker.sh`.
- `paper-hf-aligned-control/results/20260411_231652_paper_hf_control_n40/experiment_record.json` — **fresh positive control** (paper HF `val`, **n = 40**): **85% compile, 62.5% accuracy**; script: `paper-hf-aligned-control/run_autonomous.sh`.
- `compare-datasets/results/kps_vs_paper_supercoder.json` — HF schema/size/overlap report for KPS vs paper SuperCoder (see section above).
- `compare-datasets/results/loc_and_tests_kps_vs_paper.json` — C line counts, stored test counts, asm line stats (KPS vs paper).
- `run-kps-like-paper-exactly/results/20260411_222009_kps_like_paper/supercoder_bench/problem_results.json` — KPS **sequential** `train` head (10 rows), **~90% compile / 0% accuracy** — biased slice (see section).
- `run-kps-like-paper-exactly/results/20260411_223718_kps_like_paper/supercoder_bench/simple_io_summary.json` — KPS **sequential** (**200**, **1** `problem_id`), **~96.5% compile / ~1%**.
- `run-kps-like-paper-exactly/results/20260411_233124_kps_like_paper/supercoder_bench/simple_io_summary.json` — KPS **`shuffle_seed=42`** (**200**, **149** `problem_id`), **~62% compile / ~22.5%**; `experiment_stdout.log` in the same dir.

