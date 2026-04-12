#!/usr/bin/env bash
# Delegate to experiment-qwen-coder-modal-100-dataset phase-3 (hyperfine-bench on each row).
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PHASE3="$ROOT_DIR/../experiment-qwen-coder-modal-100-dataset/3_run_benchmark_all.sh"

if [[ ! -x "$PHASE3" ]] && [[ -f "$PHASE3" ]]; then
  chmod +x "$PHASE3" 2>/dev/null || true
fi

if [[ ! -f "$PHASE3" ]]; then
  echo "Missing benchmark script: $PHASE3" >&2
  exit 1
fi

exec "$PHASE3" "$@"
