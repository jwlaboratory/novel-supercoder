#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_DIR=""
MODAL_MODEL="${MODAL_MODEL:-Qwen/Qwen2.5-Coder-7B-Instruct}"
MODAL_WORKERS="${MODAL_WORKERS:-1}"
BATCH_SIZE="${BATCH_SIZE:-32}"
WRITE_MODE="${WRITE_MODE:-overwrite}"
PROMPT_KEY="${PROMPT_KEY:-main}"
DS_NAME="${DS_NAME:-random1123anonymized/supercoder}"
NUM_FS="${NUM_FS:-0}"

usage() {
  cat <<'EOF'
Usage:
  2_generate_modal_supercoder_prompt.sh --run-dir <path> [options]

Options:
  --run-dir <path>       Run directory from phase 1
  --modal-model <name>   Model id (default: Qwen/Qwen2.5-Coder-7B-Instruct)
  --modal-workers <n>    Worker replicas (default: 1)
  --batch-size <n>       Prompts per batch (default: 32)
  --write-mode <mode>    overwrite | skip
  --prompt-key <key>     main | c_only (default: main)
  --ds-name <name>       HF dataset for fewshot split
  --num-fs <n>           Number of fewshot examples (default: 0)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir) RUN_DIR="${2:-}"; shift 2 ;;
    --modal-model) MODAL_MODEL="${2:-}"; shift 2 ;;
    --modal-workers) MODAL_WORKERS="${2:-1}"; shift 2 ;;
    --batch-size) BATCH_SIZE="${2:-32}"; shift 2 ;;
    --write-mode) WRITE_MODE="${2:-overwrite}"; shift 2 ;;
    --prompt-key) PROMPT_KEY="${2:-main}"; shift 2 ;;
    --ds-name) DS_NAME="${2:-random1123anonymized/supercoder}"; shift 2 ;;
    --num-fs) NUM_FS="${2:-0}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ -z "$RUN_DIR" ]]; then
  echo "--run-dir is required" >&2
  exit 1
fi

uv run --with modal --with datasets python "$ROOT_DIR/modal_generate_supercoder_prompt.py" \
  --manifest "$RUN_DIR/manifest.jsonl" \
  --summary "$RUN_DIR/modal_summary.jsonl" \
  --workers "$MODAL_WORKERS" \
  --batch-size "$BATCH_SIZE" \
  --write-mode "$WRITE_MODE" \
  --prompt-key "$PROMPT_KEY" \
  --ds-name "$DS_NAME" \
  --num-fs "$NUM_FS" \
  --model-name "$MODAL_MODEL"
