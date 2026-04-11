#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_CSV="$ROOT_DIR/data.csv"
RUN_DIR=""
O3_CONTAINER_NAME=""

usage() {
  cat <<'EOF'
Usage:
  1_generate_o3_all.sh [options]

Options:
  --data-csv <path>   Input CSV with columns answer,test_cases (default: ./data.csv)
  --run-dir <path>    Output run directory (default: ./results/<timestamp>)
  -h, --help          Show this help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --data-csv)
      DATA_CSV="${2:-}"
      shift 2
      ;;
    --run-dir)
      RUN_DIR="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

for cmd in docker jq python3; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done

abs_path() {
  python3 -c 'import os,sys; print(os.path.abspath(sys.argv[1]))' "$1"
}

DATA_CSV_ABS="$(abs_path "$DATA_CSV")"
if [[ ! -f "$DATA_CSV_ABS" ]]; then
  echo "Input CSV not found: $DATA_CSV_ABS" >&2
  exit 1
fi

if [[ -z "$RUN_DIR" ]]; then
  RUN_ID="$(date +%Y%m%d_%H%M%S)"
  RUN_DIR="$ROOT_DIR/results/$RUN_ID"
fi
RUN_DIR="$(abs_path "$RUN_DIR")"
ROWS_DIR="$RUN_DIR/rows"
MANIFEST="$RUN_DIR/manifest.jsonl"
META_JSON="$RUN_DIR/meta.json"
O3_SUMMARY="$RUN_DIR/o3_summary.jsonl"
mkdir -p "$RUN_DIR" "$ROWS_DIR"
: > "$MANIFEST"
: > "$O3_SUMMARY"

python3 - "$DATA_CSV_ABS" "$MANIFEST" "$ROWS_DIR" "$META_JSON" <<'PY'
import csv
import json
import sys
from pathlib import Path

data_csv = Path(sys.argv[1])
manifest = Path(sys.argv[2])
rows_dir = Path(sys.argv[3])
meta_json = Path(sys.argv[4])

limit = sys.maxsize
while True:
    try:
        csv.field_size_limit(limit)
        break
    except OverflowError:
        limit //= 10

with data_csv.open("r", encoding="utf-8", newline="") as f:
    reader = csv.DictReader(f)
    if not reader.fieldnames or "answer" not in reader.fieldnames or "test_cases" not in reader.fieldnames:
        raise SystemExit("CSV must contain columns: answer,test_cases")

    total = 0
    with manifest.open("w", encoding="utf-8") as out:
        for row_idx, row in enumerate(reader, start=1):
            row_dir = rows_dir / f"row_{row_idx:05d}"
            row_dir.mkdir(parents=True, exist_ok=True)

            c_src = row.get("answer", "") or ""
            tests_raw = row.get("test_cases", "")
            tests = []
            if isinstance(tests_raw, str) and tests_raw.strip():
                try:
                    parsed = json.loads(tests_raw)
                    if isinstance(parsed, list):
                        tests = parsed
                except json.JSONDecodeError:
                    tests = []

            (row_dir / "inputC.c").write_text(c_src, encoding="utf-8")
            (row_dir / "input_tests.json").write_text(
                json.dumps(tests, ensure_ascii=False, indent=2), encoding="utf-8"
            )

            out.write(
                json.dumps(
                    {
                        "row_index": row_idx,
                        "row_dir": str(row_dir),
                        "has_tests": 1 if len(tests) > 0 else 0,
                    },
                    ensure_ascii=False,
                )
                + "\n"
            )
            total += 1

meta_json.write_text(
    json.dumps({"data_csv": str(data_csv), "total_rows": total}, ensure_ascii=False, indent=2),
    encoding="utf-8",
)
print(total)
PY

TOTAL_ROWS="$(jq -r '.total_rows' "$META_JSON")"
echo "Prepared $TOTAL_ROWS rows under $RUN_DIR"

O3_CONTAINER_NAME="qwen-bench-o3-$(basename "$RUN_DIR")-$$"
cleanup() { docker rm -f "$O3_CONTAINER_NAME" >/dev/null 2>&1 || true; }
trap cleanup EXIT INT TERM

echo "Starting shared x86_64 container ..."
docker run -d --rm --platform linux/amd64 \
  --name "$O3_CONTAINER_NAME" \
  -v "$ROWS_DIR":/work/rows \
  -w /work \
  gcc:13 sleep infinity >/dev/null

echo "Generating O3 assembly for all rows ..."
while IFS= read -r rec; do
  row_index="$(jq -r '.row_index' <<<"$rec")"
  row_dir="$(jq -r '.row_dir' <<<"$rec")"
  row_subdir="$(basename "$row_dir")"
  echo "[$row_index/$TOTAL_ROWS] O3 -> $row_subdir"
  set +e
  docker exec "$O3_CONTAINER_NAME" gcc -S -O3 -std=c17 \
    -o "/work/rows/${row_subdir}/inputo3.s" \
    "/work/rows/${row_subdir}/inputC.c"
  rc=$?
  set -e
  if [[ "$rc" -eq 0 ]]; then
    jq -cn --argjson row_index "$row_index" --arg status "ok" --arg o3_file "$row_dir/inputo3.s" \
      '{row_index:$row_index,status:$status,o3_file:$o3_file}' >> "$O3_SUMMARY"
  else
    jq -cn --argjson row_index "$row_index" --arg status "o3_error" --arg o3_file "$row_dir/inputo3.s" \
      '{row_index:$row_index,status:$status,o3_file:$o3_file}' >> "$O3_SUMMARY"
  fi
done < "$MANIFEST"

echo "Done phase 1."
echo "Run dir:     $RUN_DIR"
echo "Manifest:    $MANIFEST"
echo "O3 summary:  $O3_SUMMARY"
