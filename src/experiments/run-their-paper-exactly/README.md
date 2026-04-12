# run-their-paper-exactly

This folder reproduces the `SuperCoder` paper pipeline as closely as possible, with one intentional change:
- **GPU jobs run on Modal** instead of local GPUs.

Everything else follows the paper/repo defaults:
- Dataset: `random1123anonymized/supercoder`
- Prompt format: from dataset `extra_info.question` (or optional `c_only_question`)
- Base model: `Qwen/Qwen2.5-Coder-7B-Instruct`
- PPO training hyperparameters: copied from `SuperCoder/verl/examples/ppo_trainer/run_qwen2.57_superopt.sh`
- Benchmarking: SuperCoder benchmark logic (`src/test_benchmark.py` + `src/metrics.py`) with `hyperfine --warmup 3 --runs 10`
- Target ISA/toolchain: x86-64 assembly compiled with `gcc` (same as paper task definition)

## What is copied from `SuperCoder`

Use `0_sync_supercoder_code.sh` to copy core upstream code into `vendor/SuperCoder`:
- `src/` (evaluation + benchmark modules)
- `scripts/`
- `verl/examples/ppo_trainer/run_qwen2.57_superopt.sh`
- `verl/verl/utils/reward_score/speedup_assembly_design2.py`

This keeps your experiment pinned to the upstream implementation.

## Quick start (evaluation reproduction)

```bash
# 0) (optional but recommended) copy upstream code snapshot into this folder
./0_sync_supercoder_code.sh

# 1) Run paper-style eval pipeline (Modal generation + SuperCoder benchmark replay)
./1_run_eval_paper_exact_modal.sh \
  --limit 200 \
  --split val \
  --model-name Qwen/Qwen2.5-Coder-7B-Instruct \
  --modal-workers 4 \
  --batch-size 32
```

Outputs are written under `results/<timestamp>/`:
- `modal_summary.jsonl`
- `supercoder_bench/problem_results.json`
- `supercoder_bench/row_summary.jsonl`
- `paper_vs_ours.csv`
- `paper_vs_ours_summary.json`
- `requested_report.csv`

## PPO training reproduction on Modal (4xA100)

```bash
./2_run_train_ppo_modal.sh \
  --train-parquet llm_superoptimizer_ds_train.parquet \
  --val-parquet llm_superoptimizer_ds_val.parquet \
  --reward-path verl/verl/utils/reward_score/speedup_assembly_design2.py \
  --experiment-name qwen25_supercoder_ppo_exact_modal
```

Notes:
- This launches one Modal container with **4x A100** and runs the same PPO command structure as upstream.
- It expects parquet files and training code to be available in the mounted workspace path.

## Optional: Dockerized x86 benchmark environment

If you want a clean benchmark runtime that mirrors an isolated Linux x86-64 toolchain:

```bash
docker build -f docker/x86_64-benchmark.Dockerfile -t supercoder-x86-bench .
docker run --rm -it -v "$PWD:/workspace" supercoder-x86-bench bash
```

