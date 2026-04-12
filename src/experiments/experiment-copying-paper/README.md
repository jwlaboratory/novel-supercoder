# experiment-copying-paper

This folder is an investigation harness to reproduce the paper pipeline as closely as possible while also running our benchmark on the exact same generated assembly.

## What is copied 1:1 vs adapted

- **Copied from paper flow**
  - Dataset: `random1123anonymized/supercoder`
  - Prompt text: `extra_info.question` (or `c_only_question`)
  - Few-shot behavior: optional `fewshot` split Q/A pairs inserted before user prompt
  - Output parsing: keep content after last ```assembly and trim at last ```
  - SuperCoder benchmark code: `SuperCoder/src/test_benchmark.py` + `SuperCoder/src/metrics.py`
- **Adapted for this experiment**
  - Generation backend is Modal + vLLM (instead of SGLang local server)
  - We emit a run directory compatible with `hyperfine-bench` so we can compare both benchmarks side by side

## Scripts

- `1_prepare_supercoder_run.sh`
  - Pulls HF dataset rows and creates run dir with `manifest.jsonl`, `meta.json`, `rows/row_*/inputC.c`, `input_tests.json`, and prompt files.
- `2_generate_modal_supercoder_prompt.sh`
  - Runs Qwen2.5-Coder-Instruct on Modal using SuperCoder prompt text and parsing rules.
- `3_run_supercoder_benchmark.sh`
  - Replays SuperCoder benchmark logic over generated `.s` files.
- `4_run_our_benchmark.sh`
  - Runs our `hyperfine-bench` (`experiment-qwen-coder-modal-100-dataset/3_run_benchmark_all.sh`) on the same run dir.
- `5_compare_side_by_side.sh`
  - Produces per-row and aggregate comparison artifacts.
- `6_export_requested_csv.sh`
  - Produces `requested_report.csv` with fields:
    - `Problem id, answer, test cases, o3 assembly, generated assembly, prompt to generate assembly, error in generation, err in assmebling, err when running, err passing test cases, benchmark score`
- `run_all_autonomous.sh`
  - Runs phases 1→6 in one command for unattended execution.

## End-to-end usage

From `experiment-copying-paper`:

```bash
# 1) Prepare rows from paper dataset (use --limit for faster smoke runs)
./1_prepare_supercoder_run.sh \
  --run-dir ./results/$(date +%Y%m%d_%H%M%S) \
  --split val \
  --limit 100

# 2) Modal generation with paper prompt
./2_generate_modal_supercoder_prompt.sh \
  --run-dir ./results/<run_id> \
  --modal-model Qwen/Qwen2.5-Coder-7B-Instruct \
  --modal-workers 4 \
  --batch-size 32 \
  --prompt-key main \
  --num-fs 0

# 3) Their benchmark code
./3_run_supercoder_benchmark.sh \
  --run-dir ./results/<run_id> \
  --model-name Qwen/Qwen2.5-Coder-7B-Instruct \
  --num-workers 4

# 4) Our benchmark code
./4_run_our_benchmark.sh \
  --run-dir ./results/<run_id> \
  --runs 10 \
  --warmup 3

# 5) Side-by-side comparison
./5_compare_side_by_side.sh --run-dir ./results/<run_id>

# 6) Requested debugging CSV schema
./6_export_requested_csv.sh --run-dir ./results/<run_id>
```

## Output artifacts

- `modal_summary.jsonl`: generation status per row
- `supercoder_bench/problem_results.json`: full output from SuperCoder metrics
- `supercoder_bench/row_summary.jsonl`: per-row paper benchmark summary
- `bench_summary.jsonl`: per-row our benchmark summary
- `paper_vs_ours.csv`: side-by-side row comparison
- `paper_vs_ours_summary.json`: aggregate compare metrics

## Notes for debugging poor results

- If **paper compile rate is high** but **our asm_ok is low**, suspect our benchmarking pipeline/config.
- If both compile rates are low, suspect generation/prompting/model behavior.
- If compile rates are similar but correctness diverges, inspect test harness assumptions (`input_tests.json` format, runtime env differences, docker image/toolchain).
