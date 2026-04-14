#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_DIR=""
LIMIT="${LIMIT:-100}"
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
  run_all_autonomous.sh [options]

Options:
  --run-dir <path>        Output run directory (default: ./results/<timestamp>)
  --limit <n>             Number of rows from split (default: 100)
  --split <name>          Dataset split (default: val)
  --model-name <name>     Model id for generation and labels
  --modal-workers <n>     Modal workers
  --batch-size <n>        Modal batch size
  --num-fs <n>            Few-shot examples from dataset fewshot split
  --num-workers <n>       SuperCoder benchmark workers
  --runs <n>              hyperfine-bench runs
  --warmup <n>            hyperfine warmup
  --prompt-key <key>      main | c_only
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir) RUN_DIR="${2:-}"; shift 2 ;;
    --limit) LIMIT="${2:-100}"; shift 2 ;;
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

if [[ -z "$RUN_DIR" ]]; then
  RUN_DIR="$ROOT_DIR/results/$(date +%Y%m%d_%H%M%S)"
fi

echo "Run dir: $RUN_DIR"

"$ROOT_DIR/1_prepare_supercoder_run.sh" \
  --run-dir "$RUN_DIR" \
  --split "$SPLIT" \
  --limit "$LIMIT"

"$ROOT_DIR/2_generate_modal_supercoder_prompt.sh" \
  --run-dir "$RUN_DIR" \
  --modal-model "$MODEL_NAME" \
  --modal-workers "$MODAL_WORKERS" \
  --batch-size "$BATCH_SIZE" \
  --prompt-key "$PROMPT_KEY" \
  --num-fs "$NUM_FS"

"$ROOT_DIR/3_run_supercoder_benchmark.sh" \
  --run-dir "$RUN_DIR" \
  --model-name "$MODEL_NAME" \
  --num-workers "$NUM_WORKERS" \
  --limit "$LIMIT"

"$ROOT_DIR/4_run_our_benchmark.sh" \
  --run-dir "$RUN_DIR" \
  --runs "$RUNS" \
  --warmup "$WARMUP"

"$ROOT_DIR/5_compare_side_by_side.sh" \
  --run-dir "$RUN_DIR"

"$ROOT_DIR/6_export_requested_csv.sh" \
  --run-dir "$RUN_DIR" \
  --prompt-key "$PROMPT_KEY"

echo "Completed autonomous pipeline."
echo "Summary: $RUN_DIR/paper_vs_ours_summary.json"
echo "Requested CSV: $RUN_DIR/requested_report.csv"
