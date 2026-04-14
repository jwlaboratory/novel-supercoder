#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TRAIN_PARQUET="${TRAIN_PARQUET:-llm_superoptimizer_ds_train.parquet}"
VAL_PARQUET="${VAL_PARQUET:-llm_superoptimizer_ds_val.parquet}"
REWARD_PATH="${REWARD_PATH:-verl/verl/utils/reward_score/speedup_assembly_design2.py}"
EXPERIMENT_NAME="${EXPERIMENT_NAME:-qwen25_supercoder_ppo_exact_modal}"
PROJECT_NAME="${PROJECT_NAME:-supercoder_exact_modal}"
EXTRA_ARGS="${EXTRA_ARGS:-}"

usage() {
  cat <<'EOF'
Usage:
  2_run_train_ppo_modal.sh [options]

Options:
  --train-parquet <path>    Training parquet file path
  --val-parquet <path>      Validation parquet file path
  --reward-path <path>      Reward function file path
  --experiment-name <name>  Trainer experiment name
  --project-name <name>     Trainer project name
  --extra-args "<args>"     Extra hydra overrides passed through
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --train-parquet) TRAIN_PARQUET="${2:-}"; shift 2 ;;
    --val-parquet) VAL_PARQUET="${2:-}"; shift 2 ;;
    --reward-path) REWARD_PATH="${2:-}"; shift 2 ;;
    --experiment-name) EXPERIMENT_NAME="${2:-}"; shift 2 ;;
    --project-name) PROJECT_NAME="${2:-}"; shift 2 ;;
    --extra-args) EXTRA_ARGS="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

uv run --with modal python "$ROOT_DIR/modal_train_supercoder_ppo.py" \
  --train-parquet "$TRAIN_PARQUET" \
  --val-parquet "$VAL_PARQUET" \
  --reward-path "$REWARD_PATH" \
  --experiment-name "$EXPERIMENT_NAME" \
  --project-name "$PROJECT_NAME" \
  --extra-args "$EXTRA_ARGS"
