#!/usr/bin/env bash
# Run SuperCoder's paper evaluation (evaluate.py -> test_benchmark.py + hyperfine).
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# novel-supercoder/src/experiments/experiment-copying-paper -> jwlabs/SuperCoder
DEFAULT_SUPER_CODER_ROOT="$(cd "$ROOT_DIR/../../../../SuperCoder" && pwd)"
SUPER_CODER_ROOT="${SUPER_CODER_ROOT:-$DEFAULT_SUPER_CODER_ROOT}"

MODEL_NAME=""
SPLIT="val"
EXTRA=()

usage() {
  cat <<'EOF'
Usage:
  run_supercoder_paper_eval.sh [--model_name <hf_id>] [--split val|train|...] [--] [extra evaluate.py args]

Environment:
  SUPER_CODER_ROOT   Path to SuperCoder checkout (default: jwlabs/SuperCoder next to novel-supercoder)

Examples:
  run_supercoder_paper_eval.sh --model_name Qwen/Qwen2.5-Coder-7B-Instruct
  run_supercoder_paper_eval.sh --model_name Qwen/Qwen2.5-Coder-7B-Instruct -- --num_workers 4
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --model_name)
      MODEL_NAME="${2:-}"
      shift 2
      ;;
    --split)
      SPLIT="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      EXTRA+=("$@")
      break
      ;;
    *)
      EXTRA+=("$1")
      shift
      ;;
  esac
done

if [[ ! -d "$SUPER_CODER_ROOT" ]]; then
  echo "SuperCoder repo not found: $SUPER_CODER_ROOT" >&2
  echo "Set SUPER_CODER_ROOT to your checkout." >&2
  exit 1
fi

if [[ ! -f "$SUPER_CODER_ROOT/src/evaluate.py" ]]; then
  echo "Missing evaluate.py under $SUPER_CODER_ROOT/src" >&2
  exit 1
fi

if ! command -v hyperfine >/dev/null 2>&1; then
  echo "warning: hyperfine not on PATH; SuperCoder test_benchmark.py needs it for timing." >&2
fi

if [[ -z "$MODEL_NAME" ]]; then
  echo "error: --model_name is required (HF model id served by your inference_engine)." >&2
  usage
  exit 1
fi

cd "$SUPER_CODER_ROOT"
exec python src/evaluate.py \
  --ds_name random1123anonymized/supercoder \
  --split "$SPLIT" \
  --model_name "$MODEL_NAME" \
  --temperature 0.0 \
  --max_new_tokens 2000 \
  --inference_engine sglang \
  "${EXTRA[@]}"
