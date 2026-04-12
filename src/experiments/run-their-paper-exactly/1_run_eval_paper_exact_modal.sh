#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXISTING_PIPELINE_DIR="$ROOT_DIR/../experiment-copying-paper"
RUN_DIR=""
LIMIT="${LIMIT:-200}"
SPLIT="${SPLIT:-val}"
MODEL_NAME="${MODEL_NAME:-Qwen/Qwen2.5-Coder-7B-Instruct}"
MODAL_WORKERS="${MODAL_WORKERS:-4}"
BATCH_SIZE="${BATCH_SIZE:-32}"
NUM_FS="${NUM_FS:-0}"
NUM_WORKERS="${NUM_WORKERS:-4}"
RUNS="${RUNS:-10}"
WARMUP="${WARMUP:-3}"
PROMPT_KEY="${PROMPT_KEY:-main}"

usage() {
  cat <<'EOF'
Usage:
  1_run_eval_paper_exact_modal.sh [options]

Options:
  --run-dir <path>        Output run directory (default: ./results/<timestamp>)
  --limit <n>             Number of rows from split (default: 200)
  --split <name>          Dataset split (default: val)
  --model-name <name>     Model id (default: Qwen/Qwen2.5-Coder-7B-Instruct)
  --modal-workers <n>     Modal workers (default: 4)
  --batch-size <n>        Modal batch size (default: 32)
  --num-fs <n>            Few-shot examples (default: 0)
  --num-workers <n>       SuperCoder benchmark workers (default: 4)
  --runs <n>              hyperfine runs (default: 10)
  --warmup <n>            hyperfine warmup (default: 3)
  --prompt-key <key>      main | c_only (default: main)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir) RUN_DIR="${2:-}"; shift 2 ;;
    --limit) LIMIT="${2:-200}"; shift 2 ;;
    --split) SPLIT="${2:-val}"; shift 2 ;;
    --model-name) MODEL_NAME="${2:-}"; shift 2 ;;
    --modal-workers) MODAL_WORKERS="${2:-4}"; shift 2 ;;
    --batch-size) BATCH_SIZE="${2:-32}"; shift 2 ;;
    --num-fs) NUM_FS="${2:-0}"; shift 2 ;;
    --num-workers) NUM_WORKERS="${2:-4}"; shift 2 ;;
    --runs) RUNS="${2:-10}"; shift 2 ;;
    --warmup) WARMUP="${2:-3}"; shift 2 ;;
    --prompt-key) PROMPT_KEY="${2:-main}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ ! -d "$EXISTING_PIPELINE_DIR" ]]; then
  echo "Missing dependency directory: $EXISTING_PIPELINE_DIR" >&2
  exit 1
fi

if [[ -z "$RUN_DIR" ]]; then
  RUN_DIR="$ROOT_DIR/results/$(date +%Y%m%d_%H%M%S)"
fi

"$EXISTING_PIPELINE_DIR/run_all_autonomous.sh" \
  --run-dir "$RUN_DIR" \
  --limit "$LIMIT" \
  --split "$SPLIT" \
  --model-name "$MODEL_NAME" \
  --modal-workers "$MODAL_WORKERS" \
  --batch-size "$BATCH_SIZE" \
  --num-fs "$NUM_FS" \
  --num-workers "$NUM_WORKERS" \
  --runs "$RUNS" \
  --warmup "$WARMUP" \
  --prompt-key "$PROMPT_KEY"

echo "Eval pipeline complete."
echo "Run dir: $RUN_DIR"
