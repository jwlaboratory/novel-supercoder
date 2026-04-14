#!/usr/bin/env bash
# Re-run gcc + build human-readable failure report for a finished val200 (or any) paper-exact run.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JWLABS="${JWLABS:-$(cd "$ROOT_DIR/../../../.." && pwd)}"
RUN_DIR="${RUN_DIR:-$ROOT_DIR/results/20260411_211823_val200_exactcheck}"
DOCKER_IMAGE="${DOCKER_IMAGE:-supercoder-x86-bench}"

REL="${RUN_DIR#$JWLABS/}"
if [[ "$REL" == "$RUN_DIR" ]]; then
  echo "error: RUN_DIR must be under JWLABS ($JWLABS)" >&2
  exit 1
fi
INNER="/workspace/$REL"

echo "JWLABS=$JWLABS"
echo "RUN_DIR=$RUN_DIR -> $INNER"

docker run --rm --platform linux/amd64 \
  -v "$JWLABS:/workspace" \
  -e "FAILURE_ANALYSIS_HOST_RUN_DIR=$RUN_DIR" \
  "$DOCKER_IMAGE" \
  bash -lc "python3 /workspace/novel-supercoder/src/experiments/run-their-paper-exactly/analyze_val200_failures.py --run-dir \"$INNER\""

echo "Open: $RUN_DIR/supercoder_bench/failure_analysis/FAILURES_REVIEW.md"
