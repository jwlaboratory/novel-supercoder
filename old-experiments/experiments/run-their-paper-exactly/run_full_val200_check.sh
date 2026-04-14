#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPERIMENT_COPYING_PAPER_DIR="$ROOT_DIR/../experiment-copying-paper"
JWLABS="${JWLABS:-$(cd "$ROOT_DIR/../../../.." && pwd)}"
RUN_DIR="${RUN_DIR:-$ROOT_DIR/results/$(date +%Y%m%d_%H%M%S)_val200_exactcheck}"
MODEL_NAME="${MODEL_NAME:-Qwen/Qwen2.5-Coder-7B-Instruct}"
MODAL_WORKERS="${MODAL_WORKERS:-4}"
BATCH_SIZE="${BATCH_SIZE:-32}"
NUM_FS="${NUM_FS:-0}"

REL_RUN="${RUN_DIR#$JWLABS/}"
DOCKER_RUN_DIR="/workspace/$REL_RUN"

echo "Run dir (host): $RUN_DIR"
echo "Run dir (container): $DOCKER_RUN_DIR"

# 1) Prepare full paper validation split (200 rows), no shuffle.
uv run --with datasets python "$EXPERIMENT_COPYING_PAPER_DIR/prepare_supercoder_run.py" \
  --run-dir "$RUN_DIR" \
  --ds-name random1123anonymized/supercoder \
  --split val \
  --offset 0 \
  --limit 0

# 2) Generate with SGLang-compatible prompting path on Modal (must use `modal run` for the local entrypoint).
uv run --with modal --with datasets modal run "$ROOT_DIR/modal_generate_supercoder_prompt_sglang_style.py" \
  --manifest "$RUN_DIR/manifest.jsonl" \
  --summary "$RUN_DIR/modal_summary.jsonl" \
  --workers "$MODAL_WORKERS" \
  --batch-size "$BATCH_SIZE" \
  --write-mode overwrite \
  --prompt-key main \
  --ds-name random1123anonymized/supercoder \
  --num-fs "$NUM_FS" \
  --model-name "$MODEL_NAME"

# 3) Run their benchmark in Linux x86 docker toolchain.
docker run --rm --platform linux/amd64 \
  -v "$JWLABS:/workspace" \
  -w "/workspace/SuperCoder" \
  supercoder-x86-bench \
  bash -lc "pip3 install --no-cache-dir datasets==4.3.0 numpy requests tqdm psutil >/tmp/pip_install_bench.log 2>&1 && \
  python3 /workspace/novel-supercoder/src/experiments/experiment-copying-paper/run_supercoder_benchmark_from_modal.py \
    --run-dir \"$DOCKER_RUN_DIR\" \
    --supercoder-root /workspace/SuperCoder \
    --ds-name random1123anonymized/supercoder \
    --split val \
    --offset 0 \
    --limit 0 \
    --model-name \"$MODEL_NAME\" \
    --num-workers 4"

echo "Completed run: $RUN_DIR"
echo "Summary file: $RUN_DIR/supercoder_bench/problem_results.json"
