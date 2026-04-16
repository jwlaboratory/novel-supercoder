#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(cd "$ROOT/../.." && pwd)"

SPLIT="both"
DOCKER_IMAGE="${DOCKER_IMAGE:-supercoder-x86-bench}"

usage() {
  echo "usage: $0 [--split=train|val|both] --N | --N,M,..." >&2
  echo "  $0 --1                         # stage 1: download dataset" >&2
  echo "  $0 --2                         # stage 2: run Qwen inference" >&2
  echo "  $0 --3                         # stage 3: identify fails, build debug CSV" >&2
  echo "  $0 --4                         # stage 4: backfill test_cases into all CSVs" >&2
  echo "  $0 --5                         # stage 5: add unoptimized_assembly + unoptimized_compiled_b64" >&2
  echo "  $0 --1,2,3,4,5                 # full pipeline" >&2
  echo "  $0 --split=val --2             # stage 2: val only" >&2
  echo "" >&2
  echo "env:  DOCKER_IMAGE  (default: supercoder-x86-bench)" >&2
}

for arg in "$@"; do
  case "$arg" in
    --split=*) SPLIT="${arg#--split=}"; shift ;;
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
  (cd "$REPO" && uv run python "$ROOT/1-download-supercoder-dataset.py" --split "$split" --out-dir "$ROOT")
}

run_inference() {
  local split="$1"
  local extra_args=""
  if [[ "$split" == "train" ]]; then
    extra_args="--batch-size 64 --workers 2"
  fi
  (cd "$ROOT" && modal run 2-run-inference.py --split "$split" $extra_args)
}

run_identify_fails() {
  local split="$1"
  (cd "$REPO" && uv run python "$ROOT/3-identify-fails.py" --split "$split" --docker-image "$DOCKER_IMAGE")
}

run_add_io_test_cases() {
  local split="$1"
  (cd "$REPO" && uv run python "$ROOT/4-add-io-test-cases.py" --split "$split" --csv-dir "$ROOT")
}

run_add_unoptimized_compiled() {
  local split="$1"
  (cd "$REPO" && uv run python "$ROOT/5-add-unoptimized-compiled.py" --split "$split" --csv-dir "$ROOT")
}

for s in "${STAGES[@]}"; do
  s="${s//[[:space:]]/}"
  [[ -z "$s" ]] && continue
  echo "=== stage $s ==="
  case "$s" in
    1)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 1: download val ---"
        run_download val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 1: download train ---"
        run_download train
      fi
      ;;
    2)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 2: Qwen assembly inference (val) ---"
        run_inference val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 2: Qwen assembly inference (train) ---"
        run_inference train
      fi
      ;;
    3)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 3: identify fails + build debug CSV (val) ---"
        run_identify_fails val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 3: identify fails + build debug CSV (train) ---"
        run_identify_fails train
      fi
      ;;
    4)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 4: backfill test_cases into CSVs (val) ---"
        run_add_io_test_cases val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 4: backfill test_cases into CSVs (train) ---"
        run_add_io_test_cases train
      fi
      ;;
    5)
      if [[ "$SPLIT" == "val" || "$SPLIT" == "both" ]]; then
        echo "--- stage 5: add unoptimized_compiled (val) ---"
        run_add_unoptimized_compiled val
      fi
      if [[ "$SPLIT" == "train" || "$SPLIT" == "both" ]]; then
        echo "--- stage 5: add unoptimized_compiled (train) ---"
        run_add_unoptimized_compiled train
      fi
      ;;
    *)
      echo "unknown stage: $s" >&2
      exit 1
      ;;
  esac
done
