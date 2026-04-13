#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$(cd "$ROOT/.." && pwd)"

usage() {
  echo "usage: $0 --N | --N,M,..." >&2
  echo "  $0 --0          # stage 0 only" >&2
  echo "  $0 --1          # stage 1 only" >&2
  echo "  $0 --0,1        # stages 0 then 1" >&2
}

if [[ $# -ne 1 ]] || [[ "$1" != --* ]]; then
  usage
  exit 1
fi

TAG="${1#--}"
IFS=',' read -ra STAGES <<< "$TAG"

for s in "${STAGES[@]}"; do
  s="${s//[[:space:]]/}"
  [[ -z "$s" ]] && continue
  echo "=== stage $s ==="
  case "$s" in
    0)
      (cd "$REPO" && uv run python "$ROOT/0-download-data/download_paper_supercoder_hf.py" --out-dir "$ROOT")
      ;;
    1)
      echo "(stage 1: no script under multi-turn-agent yet)" >&2
      ;;
    2)
      echo "(stage 2: no script under multi-turn-agent yet)" >&2
      ;;
    3)
      echo "(stage 3: no script under multi-turn-agent yet)" >&2
      ;;
    4)
      echo "(stage 4: no script under multi-turn-agent yet)" >&2
      ;;
    *)
      echo "unknown stage: $s" >&2
      exit 1
      ;;
  esac
done
