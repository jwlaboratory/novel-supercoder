#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_DIR=""
SUPER_CODER_ROOT="${SUPER_CODER_ROOT:-$(cd "$ROOT_DIR/../../../../SuperCoder" && pwd)}"
DS_NAME="${DS_NAME:-random1123anonymized/supercoder}"
SPLIT="${SPLIT:-val}"
OFFSET="${OFFSET:-0}"
LIMIT="${LIMIT:-0}"
MODEL_NAME="${MODEL_NAME:-Qwen/Qwen2.5-Coder-7B-Instruct}"
NUM_WORKERS="${NUM_WORKERS:-4}"

usage() {
  cat <<'EOF'
Usage:
  3_run_supercoder_benchmark.sh --run-dir <path> [options]

Options:
  --run-dir <path>         Run directory
  --supercoder-root <path> SuperCoder root (default: ../../../../SuperCoder)
  --ds-name <name>         HF dataset
  --split <name>           HF split
  --offset <n>             Offset applied in phase 1
  --limit <n>              Limit applied in phase 1 (0=all)
  --model-name <name>      Model label in outputs
  --num-workers <n>        Benchmark worker threads
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir) RUN_DIR="${2:-}"; shift 2 ;;
    --supercoder-root) SUPER_CODER_ROOT="${2:-}"; shift 2 ;;
    --ds-name) DS_NAME="${2:-}"; shift 2 ;;
    --split) SPLIT="${2:-}"; shift 2 ;;
    --offset) OFFSET="${2:-0}"; shift 2 ;;
    --limit) LIMIT="${2:-0}"; shift 2 ;;
    --model-name) MODEL_NAME="${2:-}"; shift 2 ;;
    --num-workers) NUM_WORKERS="${2:-4}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ -z "$RUN_DIR" ]]; then
  echo "--run-dir is required" >&2
  exit 1
fi

uv run --with datasets --with numpy --with requests --with tqdm --with psutil python "$ROOT_DIR/run_supercoder_benchmark_from_modal.py" \
  --run-dir "$RUN_DIR" \
  --supercoder-root "$SUPER_CODER_ROOT" \
  --ds-name "$DS_NAME" \
  --split "$SPLIT" \
  --offset "$OFFSET" \
  --limit "$LIMIT" \
  --model-name "$MODEL_NAME" \
  --num-workers "$NUM_WORKERS"
