#!/usr/bin/env bash
# Thin wrapper — training runs on Modal GPUs via modal_train.py.
#
# Usage:
#   bash run_rl.sh --qwen-debug
#   bash run_rl.sh --qwen-supercoder-debug
#   bash run_rl.sh --qwen-debug-supercoder    # prints TO BE IMPLEMENTED
#
# GPU override:
#   MODAL_TRAIN_GPU="h100:4" bash run_rl.sh --qwen-debug

set -e

MODE=""
for arg in "$@"; do
    case "$arg" in
        --qwen-debug)             MODE="qwen-debug" ;;
        --qwen-supercoder-debug)  MODE="qwen-supercoder-debug" ;;
        --qwen-debug-supercoder)  MODE="qwen-debug-supercoder" ;;
    esac
done

if [ -z "$MODE" ]; then
    echo "Usage: bash run_rl.sh --qwen-debug | --qwen-supercoder-debug | --qwen-debug-supercoder"
    exit 1
fi

modal run modal_train.py --mode "$MODE"
