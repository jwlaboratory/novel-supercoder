#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PHASE3_SCRIPT="$ROOT_DIR/../experiment-qwen-coder-modal-100-dataset/3_run_benchmark_all.sh"

if [[ ! -f "$PHASE3_SCRIPT" ]]; then
  echo "Missing script: $PHASE3_SCRIPT" >&2
  exit 1
fi

exec "$PHASE3_SCRIPT" "$@"
