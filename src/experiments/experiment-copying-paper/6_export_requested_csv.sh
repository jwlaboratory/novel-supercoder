#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_DIR=""
OUTPUT=""
PROMPT_KEY="main"

usage() {
  cat <<'EOF'
Usage:
  6_export_requested_csv.sh --run-dir <path> [options]

Options:
  --run-dir <path>     Run directory
  --output <path>      Output CSV path (default: <run-dir>/requested_report.csv)
  --prompt-key <key>   main | c_only (default: main)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir) RUN_DIR="${2:-}"; shift 2 ;;
    --output) OUTPUT="${2:-}"; shift 2 ;;
    --prompt-key) PROMPT_KEY="${2:-main}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ -z "$RUN_DIR" ]]; then
  echo "--run-dir is required" >&2
  exit 1
fi

CMD=(python "$ROOT_DIR/export_requested_csv.py" --run-dir "$RUN_DIR" --prompt-key "$PROMPT_KEY")
if [[ -n "$OUTPUT" ]]; then
  CMD+=(--output "$OUTPUT")
fi

uv run "${CMD[@]}"
