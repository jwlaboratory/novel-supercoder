#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_SUPERCODER_ROOT="$(cd "$ROOT_DIR/../../../../SuperCoder" && pwd)"
SUPERCODER_ROOT="${SUPERCODER_ROOT:-$DEFAULT_SUPERCODER_ROOT}"
DEST="$ROOT_DIR/vendor/SuperCoder"

if [[ ! -d "$SUPERCODER_ROOT" ]]; then
  echo "SuperCoder repo not found: $SUPERCODER_ROOT" >&2
  exit 1
fi

mkdir -p "$DEST/verl/examples/ppo_trainer" "$DEST/verl/verl/utils/reward_score"

rsync -a --delete "$SUPERCODER_ROOT/src/" "$DEST/src/"
rsync -a --delete "$SUPERCODER_ROOT/scripts/" "$DEST/scripts/"
rsync -a "$SUPERCODER_ROOT/verl/examples/ppo_trainer/run_qwen2.57_superopt.sh" \
  "$DEST/verl/examples/ppo_trainer/run_qwen2.57_superopt.sh"
rsync -a "$SUPERCODER_ROOT/verl/verl/utils/reward_score/speedup_assembly_design2.py" \
  "$DEST/verl/verl/utils/reward_score/speedup_assembly_design2.py"

echo "Synced SuperCoder snapshot into: $DEST"
