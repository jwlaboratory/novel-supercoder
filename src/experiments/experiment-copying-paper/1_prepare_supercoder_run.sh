#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_DIR=""
DS_NAME="${DS_NAME:-random1123anonymized/supercoder}"
SPLIT="${SPLIT:-val}"
OFFSET="${OFFSET:-0}"
LIMIT="${LIMIT:-0}"

usage() {
  cat <<'EOF'
Usage:
  1_prepare_supercoder_run.sh --run-dir <path> [options]

Options:
  --run-dir <path>    Output run directory
  --ds-name <name>    HF dataset (default: random1123anonymized/supercoder)
  --split <name>      Split (default: val)
  --offset <n>        Skip first n rows (default: 0)
  --limit <n>         Keep n rows (0=all) (default: 0)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir) RUN_DIR="${2:-}"; shift 2 ;;
    --ds-name) DS_NAME="${2:-}"; shift 2 ;;
    --split) SPLIT="${2:-}"; shift 2 ;;
    --offset) OFFSET="${2:-0}"; shift 2 ;;
    --limit) LIMIT="${2:-0}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ -z "$RUN_DIR" ]]; then
  RUN_ID="$(date +%Y%m%d_%H%M%S)"
  RUN_DIR="$ROOT_DIR/results/$RUN_ID"
fi

uv run --with datasets python "$ROOT_DIR/prepare_supercoder_run.py" \
  --run-dir "$RUN_DIR" \
  --ds-name "$DS_NAME" \
  --split "$SPLIT" \
  --offset "$OFFSET" \
  --limit "$LIMIT"
