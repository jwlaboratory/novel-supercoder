# SuperCoder replication experiments: what differs and why results diverged

This guide compares three folders under `novel-supercoder/src/experiments` that all touch “Qwen on Modal + assembly + benchmarking,” but are **not** interchangeable. The headline: **low compile rates were usually an environment or pipeline mismatch**, not proof that the base model is useless. The **`run-their-paper-exactly`** track is the one that finally matched the paper’s reported **compile / test-pass** ballpark (~79% / ~61% on the full `val` split of 200).

---

## Quick comparison

| Aspect | `experiment-qwen-coder-modal-100-dataset` | `experiment-copying-paper` | `run-their-paper-exactly` |
|--------|-------------------------------------------|----------------------------|---------------------------|
| **Data source** | Local `data.csv` (e.g. 100 sampled rows with `answer`, `test_cases`) | Hugging Face `random1123anonymized/supercoder` via `prepare_supercoder_run.py` | Same HF dataset; can use full `val` (200) or other limits |
| **Prompt** | Custom English template: C + `gcc -O3` asm in fences, “output optimized asm” | Paper-style prompts from the dataset, saved as `prompt_supercoder_main.txt` (same text as `extra_info.question`) | Same paper prompts as copying-paper |
| **Generation** | Modal + vLLM, **single user message** (`llm.chat`) | Modal + vLLM, **chat messages** (optional few-shot + user content) | Modal + vLLM, **`AutoTokenizer.apply_chat_template` → single string → `llm.generate`** (“SGLang-style” formatting) |
| **Primary benchmark** | **`hyperfine-bench`** in Docker (`gcc:13`, `linux/amd64`) | **`run_supercoder_benchmark_from_modal.py`** → SuperCoder `test_benchmark.py` (often run on **host Python / host gcc**) | SuperCoder benchmark run inside **`supercoder-x86-bench`** Docker image with **container paths** (`/workspace/...`) |
| **What “worked” for paper parity** | Different goal (CSV pipeline + our bench tool) | Right data + prompts, but easy to get **0%** on SuperCoder bench if the **host OS/arch/toolchain** is wrong | Fixes generation formatting + **Linux x86-64 gcc** bench + correct **mount paths** inside Docker |

---

## `experiment-qwen-coder-modal-100-dataset`

**Intent:** End-to-end “our” pipeline: take rows from a CSV, generate `-O3` reference asm in a shared container, ask Qwen (Modal) for better asm, then score with **`hyperfine-bench`**.

**Why results looked terrible (e.g. ~0% compile in notes):**

1. **Not the paper’s task wording.** The model sees a *different* prompt (C + O3 asm + custom instructions) than SuperCoder’s official `extra_info.question`. That alone changes behavior a lot.
2. **Different scorer.** `hyperfine-bench` is not SuperCoder’s `test_benchmark.py` + `metrics.py`. Pass/fail and “compile” semantics can disagree with the paper.
3. **Sampling.** Rows come from `data.csv`, not necessarily the same index set or split as the paper’s `val` evaluation.

**Takeaway:** This folder is a valid **internal** benchmark (CSV + Modal + Dockerized gcc). It is **not** a direct read on whether the SuperCoder paper’s numbers are honest.

---

## `experiment-copying-paper`

**Intent:** Reuse **their** dataset text, **their** assembly extraction rules, and **their** benchmark code, while still running Modal for GPUs and optionally comparing against `hyperfine-bench`.

**Why SuperCoder numbers could still collapse (e.g. `paper_compilation_rate_pct: 0` in a 100-row run while “our” Docker bench showed ~28% compile):**

1. **Where `3_run_supercoder_benchmark.sh` runs.** It invokes `run_supercoder_benchmark_from_modal.py` with **`uv run` on the host**. On macOS (especially Apple Silicon), **host `gcc` is not the same as Linux x86-64 `gcc`**. The model emits **x86-64 GNU assembler** (often with `@PLT`, `.section`, etc.). That can fail to assemble or link on the wrong toolchain, producing **artifact 0% compile** even when the `.s` files are fine on Linux.
2. **Inference formatting.** The Modal script here uses **`vllm.LLM.chat(...)`** with message lists. That is usually close to the instruct model’s chat template, but can differ slightly from servers that apply the template exactly the way SGLang / the original code path did.
3. **Path bugs when using Docker manually.** Any benchmark that receives a **host absolute path** (e.g. `/Users/.../run`) inside a container that only mounts `/workspace/...` will silently **not find** `rows/.../out/*.s`, yielding empty inputs and **0% compile** for the wrong reason.

**Takeaway:** `experiment-copying-paper` is structurally “paper-faithful,” but **the benchmark must run in a Linux x86-64 gcc environment** (or Modal Linux runner) with **paths visible inside that environment**. Without that, results are easy to misread.

---

## `run-their-paper-exactly`

**Intent:** Same as above, but explicitly optimized for **reproduction**: vendor-pinned SuperCoder code, Modal for GPUs, Docker image `docker/x86_64-benchmark.Dockerfile` (`supercoder-x86-bench`), and scripts that avoid the worst foot-guns.

**What changed vs the earlier folders (why it “finally worked”):**

1. **Chat template explicitly.** `modal_generate_supercoder_prompt_sglang_style.py` builds prompts with **`transformers.AutoTokenizer.apply_chat_template`** and calls **`generate`** on the rendered string—closer to how chat-templated inference is often done in the paper’s stack than a bare `chat()` loop (subtle but can matter at the margin).
2. **Benchmark in Linux x86 Docker** with **`python3`** and deps installed in-container, and **`--run-dir` set to the in-container path** (e.g. `/workspace/novel-supercoder/...`), not `/Users/...`.
3. **Full paper `val` slice (200 rows)** for the check that matched ~**79% compile / ~61.5% test pass**—aligned with the paper’s ~77.9% / ~61.4%.

**Caveats that remain:**

- **Speedup / hyperfine:** The pinned `hyperfine` in the image may not support every CLI flag their code expects (`--input`), so **speedup metrics** can be wrong or default to `1.0x` until hyperfine is version-matched to their exact invocation.
- **Modal vs local SGLang** is still a deliberate deviation for GPUs; compile/correctness were still close once Linux gcc + paths + prompting were fixed.

---

## Mental model: three different questions

1. **`experiment-qwen-coder-modal-100-dataset`:** “How does Qwen do on **our** CSV task with **hyperfine-bench**?”
2. **`experiment-copying-paper`:** “Can we drive **SuperCoder’s** benchmark on **their** prompts from HF?” (Yes, if the **runtime** is Linux x86 gcc and paths are correct.)
3. **`run-their-paper-exactly`:** “Do we get **paper-like** compile and test-pass rates when we align toolchain, paths, and prompting?” (For the base model on `val`, **yes—roughly**.)

---

## Practical advice

- If you want numbers comparable to the **SuperCoder paper**, use **`run-their-paper-exactly`** (or `experiment-copying-paper` **only** if you run the SuperCoder benchmark in **Linux x86-64 Docker** with correct mounted paths).
- If you see **0% compile** with plausible-looking `.s` files, check **(a)** OS/arch of `gcc`, **(b)** whether the benchmark process can **see** the files, **(c)** whether the “paper” column is actually SuperCoder’s code or a different tool.
- Treat **`experiment-qwen-coder-modal-100-dataset`** as a **separate experiment**; do not use it to validate or falsify the paper’s table.

---

## Artifact pointers (examples in-repo)

- `experiment-copying-paper/results/20260411_201420/paper_vs_ours_summary.json` — illustrates **0%** SuperCoder compile on host vs **non-zero** alternate bench on the same run.
- `run-their-paper-exactly/results/20260411_211823_val200_exactcheck/supercoder_bench/problem_results.json` — **~79% compile, ~61.5% accuracy** on 200 `val` rows after the fixes above.
