#!/usr/bin/env bash
# Isolated experiment: KPS rows stratified by C length → paper-identical Modal gen → Docker simple bench.
# Shared helpers live only in ../run-kps-like-paper-exactly (prepare + bench).
#
# Default: 5 buckets × 200 rows = 1000 total (character-length bins on `code` after shuffle).
#   Buckets: [0,500), [500,1500), [1500,4000), [4000,10000), [10000,inf)
# Override bins with BUCKET_EDGES — use K comma-separated numbers for K+1 buckets.
#
# Requires: Docker image supercoder-x86-bench, Modal, HF cache for KrishPS.
#
# Env tunables:
#   PER_BUCKET, BUCKET_EDGES, SHUFFLE_SEED, MODEL_NAME, MODAL_WORKERS, BATCH_SIZE, RUN_DIR, DOCKER_IMAGE
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KPS_SHARED="$SCRIPT_DIR/../run-kps-like-paper-exactly"
PAPER_EXACT_DIR="$SCRIPT_DIR/../run-their-paper-exactly"
JWLABS="${JWLABS:-$(cd "$SCRIPT_DIR/../../../.." && pwd)}"

RUN_DIR="${RUN_DIR:-$SCRIPT_DIR/results/$(date +%Y%m%d_%H%M%S)_kps_longctx}"
PER_BUCKET="${PER_BUCKET:-200}"
BUCKET_EDGES="${BUCKET_EDGES:-500,1500,4000,10000}"
SHUFFLE_SEED="${SHUFFLE_SEED:-42}"
MODEL_NAME="${MODEL_NAME:-Qwen/Qwen2.5-Coder-7B-Instruct}"
MODAL_WORKERS="${MODAL_WORKERS:-4}"
BATCH_SIZE="${BATCH_SIZE:-32}"
NUM_FS="${NUM_FS:-0}"
PROMPT_KEY="${PROMPT_KEY:-main}"
DOCKER_IMAGE="${DOCKER_IMAGE:-supercoder-x86-bench}"

echo "Experiment dir: $SCRIPT_DIR"
echo "Host run dir: $RUN_DIR"
echo "JWLABS (mount root): $JWLABS"
echo "Length stratify: $PER_BUCKET rows per bucket; edges=$BUCKET_EDGES"

mkdir -p "$RUN_DIR"
exec > >(tee -a "$RUN_DIR/experiment_stdout.log") 2>&1
echo "Logging to $RUN_DIR/experiment_stdout.log"

uv run --with datasets python "$KPS_SHARED/prepare_kps_supercoder_run.py" \
  --run-dir "$RUN_DIR" \
  --ds-name KrishPS/codenet-accepted-c \
  --split train \
  --shuffle-seed "$SHUFFLE_SEED" \
  --length-stratify-per-bucket "$PER_BUCKET" \
  --length-bucket-edges "$BUCKET_EDGES" \
  --jwlabs-root "$JWLABS" \
  --compile-o0-docker \
  --docker-image "$DOCKER_IMAGE"

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
PER_ROW="$DOCKER_RUN_DIR/supercoder_bench/per_row_bench.jsonl"
SUMMARY_JSON="$DOCKER_RUN_DIR/supercoder_bench/simple_io_summary.json"

mkdir -p "$RUN_DIR/supercoder_bench"

docker run --rm --platform linux/amd64 \
  -v "$JWLABS:/workspace" \
  -w "/workspace/SuperCoder" \
  "$DOCKER_IMAGE" \
  bash -lc "python3 \"$SIMPLE_BENCH\" \
    --run-dir \"$DOCKER_RUN_DIR\" \
    --max-tests 10 \
    --model-name \"$MODEL_NAME\" \
    --write-summary \"$SUMMARY_JSON\" \
    --write-per-row \"$PER_ROW\""

( cd "$SCRIPT_DIR/../../.." && uv run python "$SCRIPT_DIR/analyze_long_context_buckets.py" --run-dir "$RUN_DIR" )

echo "Done. See $RUN_DIR/supercoder_bench/length_bucket_analysis.json"
