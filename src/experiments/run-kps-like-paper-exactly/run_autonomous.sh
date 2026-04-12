#!/usr/bin/env bash
# Same toolchain as run-their-paper-exactly (Modal SGLang-style gen + SuperCoder bench in Docker),
# but rows come from KrishPS/codenet-accepted-c instead of random1123anonymized/supercoder.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JWLABS="${JWLABS:-$(cd "$ROOT_DIR/../../../.." && pwd)}"
PAPER_EXACT_DIR="$ROOT_DIR/../run-their-paper-exactly"
COPYING_PAPER_DIR="$ROOT_DIR/../experiment-copying-paper"

RUN_DIR="${RUN_DIR:-$ROOT_DIR/results/$(date +%Y%m%d_%H%M%S)_kps_like_paper}"
MODEL_NAME="${MODEL_NAME:-Qwen/Qwen2.5-Coder-7B-Instruct}"
MODAL_WORKERS="${MODAL_WORKERS:-4}"
BATCH_SIZE="${BATCH_SIZE:-32}"
NUM_FS="${NUM_FS:-0}"
LIMIT="${LIMIT:-200}"
OFFSET="${OFFSET:-0}"
# KPS `train` row order clusters many submissions for the same problem at the start (not representative).
# Default: shuffle before taking LIMIT. Use SHUFFLE_SEED=off for raw HF order (matches older experiments).
SHUFFLE_SEED="${SHUFFLE_SEED:-42}"
PROMPT_KEY="${PROMPT_KEY:-main}"
DOCKER_IMAGE="${DOCKER_IMAGE:-supercoder-x86-bench}"
# full = SuperCoder test_benchmark (OOM/SIGKILL on some 200-row KPS runs); simple = bench_correctness_simple.py
BENCH_MODE="${BENCH_MODE:-simple}"

echo "Host run dir: $RUN_DIR"
echo "JWLABS (mount root): $JWLABS"

mkdir -p "$RUN_DIR"
exec > >(tee -a "$RUN_DIR/experiment_stdout.log") 2>&1
echo "Logging stdout/stderr to $RUN_DIR/experiment_stdout.log"
echo "BENCH_MODE=$BENCH_MODE"

PREP_ARGS=(
  --run-dir "$RUN_DIR"
  --ds-name KrishPS/codenet-accepted-c
  --split train
  --offset "$OFFSET"
  --limit "$LIMIT"
  --jwlabs-root "$JWLABS"
  --compile-o0-docker
  --docker-image "$DOCKER_IMAGE"
)
if [[ "$SHUFFLE_SEED" == "off" || "$SHUFFLE_SEED" == "none" ]]; then
  echo "KPS prepare: sequential HF order (SHUFFLE_SEED=off) — train head often repeats one problem; not recommended."
else
  PREP_ARGS+=(--shuffle-seed "$SHUFFLE_SEED")
  echo "KPS prepare: --shuffle-seed $SHUFFLE_SEED"
fi

uv run --with datasets python "$ROOT_DIR/prepare_kps_supercoder_run.py" "${PREP_ARGS[@]}"

uv run --with modal --with datasets modal run "$PAPER_EXACT_DIR/modal_generate_supercoder_prompt_sglang_style.py" \
  --manifest "$RUN_DIR/manifest.jsonl" \
  --summary "$RUN_DIR/modal_summary.jsonl" \
  --workers "$MODAL_WORKERS" \
  --batch-size "$BATCH_SIZE" \
  --write-mode overwrite \
  --prompt-key "$PROMPT_KEY" \
  --ds-name random1123anonymized/supercoder \
  --num-fs "$NUM_FS" \
  --model-name "$MODEL_NAME"

REL_RUN="${RUN_DIR#$JWLABS/}"
DOCKER_RUN_DIR="/workspace/$REL_RUN"
SIMPLE_BENCH="/workspace/novel-supercoder/src/experiments/run-kps-like-paper-exactly/bench_correctness_simple.py"
SUMMARY_JSON="$RUN_DIR/supercoder_bench/simple_io_summary.json"

mkdir -p "$RUN_DIR/supercoder_bench"

if [[ "$BENCH_MODE" == "full" ]]; then
  docker run --rm --platform linux/amd64 \
    -v "$JWLABS:/workspace" \
    -w "/workspace/SuperCoder" \
    "$DOCKER_IMAGE" \
    bash -lc "pip3 install --no-cache-dir datasets==4.3.0 numpy requests tqdm psutil >/tmp/pip_install_bench.log 2>&1 && \
    python3 /workspace/novel-supercoder/src/experiments/experiment-copying-paper/run_supercoder_benchmark_from_modal.py \
      --run-dir \"$DOCKER_RUN_DIR\" \
      --supercoder-root /workspace/SuperCoder \
      --from-manifest-only \
      --ds-name KrishPS/codenet-accepted-c \
      --model-name \"$MODEL_NAME\" \
      --num-workers 4"
else
  docker run --rm --platform linux/amd64 \
    -v "$JWLABS:/workspace" \
    -w "/workspace/SuperCoder" \
    "$DOCKER_IMAGE" \
    bash -lc "python3 \"$SIMPLE_BENCH\" \
      --run-dir \"$DOCKER_RUN_DIR\" \
      --max-tests 10 \
      --model-name \"$MODEL_NAME\" \
      --write-summary \"$DOCKER_RUN_DIR/supercoder_bench/simple_io_summary.json\""
fi

echo "Completed KPS-like-paper run: $RUN_DIR"
if [[ "$BENCH_MODE" == "full" ]]; then
  echo "Summary: $RUN_DIR/supercoder_bench/problem_results.json"
else
  echo "Summary: $SUMMARY_JSON"
fi
