#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(cd "$ROOT/.." && pwd)"

SPLIT="both"
EXTENDED=false

usage() {
  echo "usage: $0 [--split=train|val|both] [--extended] --N | --N,M,..." >&2
  echo "  $0 --0                         # stage 0: download both" >&2
  echo "  $0 --split=val --1             # stage 1: val only" >&2
  echo "  $0 --split=train --1           # stage 1: train only" >&2
  echo "  $0 --1                         # stage 1: both" >&2
  echo "  $0 --0,1                       # stages 0 then 1" >&2
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

run_infer() {
  local split="$1"
  local extra_args=""
  if [[ "$split" == "train" ]]; then
    extra_args="--batch-size 64 --workers 2"
  fi
  (cd "$ROOT/1-stage1-infer-improvements" && modal run run_qwen_inference.py --split "$split" $extra_args)
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
        echo "--- stage 1: infer improvements (val) ---"
        run_infer val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 1: infer improvements (train) ---"
        run_infer train
      fi
      ;;
    2)
      echo "(stage 2: not implemented yet)" >&2
      ;;
    3)
      echo "(stage 3: not implemented yet)" >&2
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
