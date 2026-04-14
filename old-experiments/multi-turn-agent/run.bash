#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(cd "$ROOT/.." && pwd)"

SPLIT="both"
EXTENDED=false

usage() {
  echo "usage: $0 [--split=train|val|both] [--extended] --N | --N,M,..." >&2
  echo "  $0 --0                         # stage 0: download both" >&2
  echo "  $0 --1                         # stage 1: one-shot SuperCoder PPO" >&2
  echo "  $0 --2                         # stage 2: one-shot Qwen2.5 instruct" >&2
  echo "  $0 --3                         # stage 3: infer improvements (Qwen instruct)" >&2
  echo "  $0 --0,1,2                     # download then run both one-shots" >&2
  echo "  $0 --split=val --1             # stage 1: val only" >&2
  echo "  $0 --0 --extended              # download both + KrishPS extended" >&2
}

# Parse optional flags before the stage selector
for arg in "$@"; do
  case "$arg" in
    --split=*) SPLIT="${arg#--split=}"; shift ;;
    --extended) EXTENDED=true; shift ;;
  esac
done

if [[ $# -ne 1 ]] || [[ "$1" != --* ]]; then
  usage
  exit 1
fi

if [[ "$SPLIT" != "train" && "$SPLIT" != "val" && "$SPLIT" != "both" ]]; then
  echo "error: --split must be train, val, or both" >&2
  exit 1
fi

TAG="${1#--}"
IFS=',' read -ra STAGES <<< "$TAG"

run_download() {
  local split="$1"
  local extended_flag=""
  if [[ "$EXTENDED" == true ]]; then
    extended_flag="--extended"
  fi
  (cd "$REPO" && uv run python "$ROOT/0-download-data/download_paper_supercoder_hf.py" --split "$split" --out-dir "$ROOT" $extended_flag)
}

run_oneshot_supercoder() {
  local split="$1"
  local extra_args=""
  if [[ "$split" == "train" ]]; then
    extra_args="--batch-size 64 --workers 2"
  fi
  (cd "$ROOT/1-stage1-oneshot-supercoder" && modal run run_supercoder_oneshot.py --split "$split" $extra_args)
}

run_oneshot_qwen() {
  local split="$1"
  local extra_args=""
  if [[ "$split" == "train" ]]; then
    extra_args="--batch-size 64 --workers 2"
  fi
  (cd "$ROOT/2-stage2-oneshot-qwen" && modal run run_qwen_oneshot.py --split "$split" $extra_args)
}

run_infer_improvements() {
  local split="$1"
  local extra_args=""
  if [[ "$split" == "train" ]]; then
    extra_args="--batch-size 64 --workers 2"
  fi
  (cd "$ROOT/3-stage3-infer-improvements" && modal run run_qwen_inference.py --split "$split" $extra_args)
}

for s in "${STAGES[@]}"; do
  s="${s//[[:space:]]/}"
  [[ -z "$s" ]] && continue
  echo "=== stage $s ==="
  case "$s" in
    0)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 0: download val ---"
        run_download val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 0: download train ---"
        run_download train
      fi
      ;;
    1)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 1: one-shot SuperCoder PPO (val) ---"
        run_oneshot_supercoder val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 1: one-shot SuperCoder PPO (train) ---"
        run_oneshot_supercoder train
      fi
      ;;
    2)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 2: one-shot Qwen2.5 instruct (val) ---"
        run_oneshot_qwen val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 2: one-shot Qwen2.5 instruct (train) ---"
        run_oneshot_qwen train
      fi
      ;;
    3)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 3: infer improvements (val) ---"
        run_infer_improvements val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 3: infer improvements (train) ---"
        run_infer_improvements train
      fi
      ;;
    4)
      echo "(stage 4: not implemented yet)" >&2
      ;;
    *)
      echo "unknown stage: $s" >&2
      exit 1
      ;;
  esac
done
