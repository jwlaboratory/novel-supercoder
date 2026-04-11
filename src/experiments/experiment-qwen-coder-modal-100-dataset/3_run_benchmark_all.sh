#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUN_DIR=""
RUNS=10
WARMUP=3
MODEL_SLUG="qwen25_coder_7b_instruct"
OUTPUT_CSV=""

usage() {
  cat <<'EOF'
Usage:
  3_run_benchmark_all.sh --run-dir <path> [options]

Options:
  --run-dir <path>      Run directory created by phase 1
  --runs <n>            Hyperfine runs (default: 10)
  --warmup <n>          Hyperfine warmup (default: 3)
  --output-csv <path>   Output merged CSV (default: <run-dir>/data_with_bench.csv)
  -h, --help            Show this help
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-dir)
      RUN_DIR="${2:-}"
      shift 2
      ;;
    --runs)
      RUNS="${2:-}"
      shift 2
      ;;
    --warmup)
      WARMUP="${2:-}"
      shift 2
      ;;
    --output-csv)
      OUTPUT_CSV="${2:-}"
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

if [[ -z "$RUN_DIR" ]]; then
  echo "--run-dir is required." >&2
  exit 1
fi

for cmd in jq python3 hyperfine-bench; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done

abs_path() {
  python3 -c 'import os,sys; print(os.path.abspath(sys.argv[1]))' "$1"
}

RUN_DIR="$(abs_path "$RUN_DIR")"
MANIFEST="$RUN_DIR/manifest.jsonl"
META_JSON="$RUN_DIR/meta.json"
O3_SUMMARY="$RUN_DIR/o3_summary.jsonl"
MODAL_SUMMARY="$RUN_DIR/modal_summary.jsonl"
BENCH_SUMMARY="$RUN_DIR/bench_summary.jsonl"

if [[ ! -f "$MANIFEST" ]]; then
  echo "Manifest not found: $MANIFEST" >&2
  exit 1
fi
if [[ ! -f "$META_JSON" ]]; then
  echo "Meta file not found: $META_JSON" >&2
  exit 1
fi

: > "$BENCH_SUMMARY"
TOTAL_ROWS="$(jq -r '.total_rows' "$META_JSON")"
DATA_CSV_ABS="$(jq -r '.data_csv' "$META_JSON")"
if [[ ! -f "$DATA_CSV_ABS" ]]; then
  echo "Original data CSV not found: $DATA_CSV_ABS" >&2
  exit 1
fi

echo "Running local benchmark for all rows ..."
while IFS= read -r rec; do
  row_index="$(jq -r '.row_index' <<<"$rec")"
  row_dir="$(jq -r '.row_dir' <<<"$rec")"
  has_tests="$(jq -r '.has_tests' <<<"$rec")"
  asm_file="$row_dir/out/${MODEL_SLUG}.s"
  bench_file="$row_dir/results/${MODEL_SLUG}.bench.json"
  mkdir -p "$row_dir/results"

  echo "[$row_index/$TOTAL_ROWS] Bench -> $(basename "$row_dir")"
  if [[ ! -f "$asm_file" ]]; then
    jq -cn --argjson row_index "$row_index" --arg status "missing_asm" --arg bench_file "$bench_file" --arg asm_file "$asm_file" \
      '{row_index:$row_index,status:$status,asm_ok:false,all_passed:false,script_exit_code:-1,timing_enabled:false,best_by_mean_label:null,asm_mean_s:null,bench_file:$bench_file,asm_file:$asm_file}' >> "$BENCH_SUMMARY"
    continue
  fi

  (
    cd "$row_dir"
    set +e
    bench_cmd=(hyperfine-bench "./out/${MODEL_SLUG}.s"
      --reference ./inputC.c
      --language c
      --use-docker
      --docker-image gcc:13
      --docker-platform linux/amd64
      --runs "$RUNS"
      --hyperfine-warmup "$WARMUP"
      --hyperfine-prepare "sync"
      --timing-summary
      --timing-chart
      --pretty
    )
    if [[ "$has_tests" == "1" ]]; then
      bench_cmd+=(--tests input_tests.json)
    fi
    "${bench_cmd[@]}" > "$bench_file"
    rc=$?
    set -e
    exit "$rc"
  ) || true

  jq -c --argjson row_index "$row_index" --arg bench_file "$bench_file" --arg asm_file "$asm_file" '
    {
      row_index: $row_index,
      status: "ok",
      asm_ok: (.compile.assembly.ok // false),
      all_passed: (.correctness.all_passed // false),
      script_exit_code: (.script_exit_code // -1),
      timing_enabled: (.timing.enabled // false),
      best_by_mean_label: (.timing_summary.best_by_mean_label // null),
      asm_mean_s: (.timing.asm.mean_s // .timing_summary.by_label.asm.mean_s // null),
      bench_file: $bench_file,
      asm_file: $asm_file
    }' "$bench_file" 2>/dev/null \
    || jq -cn --argjson row_index "$row_index" --arg status "bench_parse_error" --arg bench_file "$bench_file" --arg asm_file "$asm_file" \
      '{row_index:$row_index,status:$status,asm_ok:false,all_passed:false,script_exit_code:-1,timing_enabled:false,best_by_mean_label:null,asm_mean_s:null,bench_file:$bench_file,asm_file:$asm_file}' \
    >> "$BENCH_SUMMARY"
done < "$MANIFEST"

if [[ -z "$OUTPUT_CSV" ]]; then
  OUTPUT_CSV="$RUN_DIR/data_with_bench.csv"
fi
OUTPUT_CSV="$(abs_path "$OUTPUT_CSV")"

python3 - "$DATA_CSV_ABS" "$O3_SUMMARY" "$MODAL_SUMMARY" "$BENCH_SUMMARY" "$OUTPUT_CSV" <<'PY'
import csv
import json
import sys
from pathlib import Path

in_csv = Path(sys.argv[1])
o3_jsonl = Path(sys.argv[2])
modal_jsonl = Path(sys.argv[3])
bench_jsonl = Path(sys.argv[4])
out_csv = Path(sys.argv[5])
out_csv.parent.mkdir(parents=True, exist_ok=True)

limit = sys.maxsize
while True:
    try:
        csv.field_size_limit(limit)
        break
    except OverflowError:
        limit //= 10

def by_row(path: Path) -> dict[int, dict]:
    out = {}
    if not path.exists():
        return out
    with path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rec = json.loads(line)
            out[int(rec.get("row_index", -1))] = rec
    return out

o3 = by_row(o3_jsonl)
modal = by_row(modal_jsonl)
bench = by_row(bench_jsonl)

append_cols = [
    "o3_status",
    "o3_file",
    "modal_model",
    "modal_status",
    "modal_raw_file",
    "modal_asm_file",
    "bench_status",
    "bench_asm_ok",
    "bench_all_passed",
    "bench_script_exit_code",
    "bench_timing_enabled",
    "bench_best_by_mean_label",
    "bench_asm_mean_s",
    "bench_file",
]

with in_csv.open("r", encoding="utf-8", newline="") as fin:
    reader = csv.DictReader(fin)
    fields = list(reader.fieldnames or [])
    for c in append_cols:
        if c not in fields:
            fields.append(c)

    with out_csv.open("w", encoding="utf-8", newline="") as fout:
        writer = csv.DictWriter(fout, fieldnames=fields)
        writer.writeheader()
        for row_idx, row in enumerate(reader, start=1):
            o = o3.get(row_idx, {})
            m = modal.get(row_idx, {})
            b = bench.get(row_idx, {})

            row["o3_status"] = o.get("status", "missing")
            row["o3_file"] = o.get("o3_file", "")
            row["modal_model"] = m.get("model", "")
            row["modal_status"] = m.get("status", "missing")
            row["modal_raw_file"] = m.get("raw_file", "")
            row["modal_asm_file"] = m.get("asm_file", "")
            row["bench_status"] = b.get("status", "missing")
            row["bench_asm_ok"] = b.get("asm_ok", False)
            row["bench_all_passed"] = b.get("all_passed", False)
            row["bench_script_exit_code"] = b.get("script_exit_code", -1)
            row["bench_timing_enabled"] = b.get("timing_enabled", False)
            row["bench_best_by_mean_label"] = b.get("best_by_mean_label", "")
            row["bench_asm_mean_s"] = b.get("asm_mean_s", "")
            row["bench_file"] = b.get("bench_file", "")
            writer.writerow(row)
PY

echo "Done phase 3."
echo "Run dir:        $RUN_DIR"
echo "Bench summary:  $BENCH_SUMMARY"
echo "Output CSV:     $OUTPUT_CSV"
