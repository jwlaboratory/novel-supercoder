#!/usr/bin/env bash
set -euo pipefail

MANUAL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

RUNS=10
WARMUP=3
DATA_CSV="$MANUAL_DIR/data.csv"
OUTPUT_CSV=""
MODAL_MODEL="${MODAL_MODEL:-Qwen/Qwen2.5-Coder-7B-Instruct}"
MODAL_GPU="${MODAL_GPU:-L4}"
MODEL_SLUG="qwen25_coder_7b_instruct"

usage() {
  cat <<'EOF'
Usage:
  run_openrouter_bench.sh [options]

Options:
  --data-csv <path>        Input CSV. Must contain columns: answer,test_cases.
                           Default: ./data.csv (next to this script)
  --output-csv <path>      Output CSV with benchmark columns appended.
                           Default: ./results/<timestamp>/data_with_bench.csv
  --modal-model <name>     Modal HF model name. Default: Qwen/Qwen2.5-Coder-7B-Instruct
  --modal-gpu <name>       Modal GPU type (default: L4)
  --runs <n>          Hyperfine runs per model (default: 10)
  --warmup <n>        Hyperfine warmup runs (default: 3)
  -h, --help          Show this help

Env:
  Modal auth must be configured locally (e.g. modal token set).
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --data-csv)
      DATA_CSV="${2:-}"
      shift 2
      ;;
    --output-csv)
      OUTPUT_CSV="${2:-}"
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
    --modal-model)
      MODAL_MODEL="${2:-}"
      shift 2
      ;;
    --modal-gpu)
      MODAL_GPU="${2:-}"
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

if [[ -f "$MANUAL_DIR/.env" ]]; then
  set -a
  # shellcheck disable=SC1091
  source "$MANUAL_DIR/.env"
  set +a
fi

for cmd in docker jq python3 hyperfine-bench; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done
if ! python3 - <<'PY' >/dev/null 2>&1
import modal  # noqa: F401
PY
then
  echo "Python package 'modal' is required. Install with: pip install modal" >&2
  exit 1
fi

abs_path() {
  python3 -c 'import os,sys; print(os.path.abspath(sys.argv[1]))' "$1"
}

sanitize_assembly() {
  local in_file="$1"
  local out_file="$2"
  python3 - "$in_file" "$out_file" <<'PY'
import re
import sys
from pathlib import Path

raw = Path(sys.argv[1]).read_text(encoding="utf-8", errors="replace")
out_path = Path(sys.argv[2])

fenced = re.findall(r"```(?:[a-zA-Z0-9_+-]*)\n(.*?)```", raw, flags=re.S)
text = max(fenced, key=len) if fenced else raw

cleaned = []
for line in text.splitlines():
    s = line.strip()
    if s.startswith("```"):
        continue
    if s.startswith("# ") or s.startswith("## "):
        continue
    if s.startswith("- "):
        continue
    if s.lower().startswith(("here is", "explanation", "note:", "output:")):
        continue
    cleaned.append(line.rstrip())

start = 0
asm_re = re.compile(r'^\s*(\.|[A-Za-z_.$][\w.$]*:|\t[a-z]|[a-z]{2,}\s)')
for i, line in enumerate(cleaned):
    if asm_re.match(line):
        start = i
        break

final = "\n".join(cleaned[start:]).strip() + "\n"
out_path.write_text(final, encoding="utf-8")
PY
}

RUN_ID="$(date +%Y%m%d_%H%M%S)"
BATCH_DIR="$MANUAL_DIR/results/$RUN_ID"
mkdir -p "$BATCH_DIR"
ROWS_DIR="$BATCH_DIR/rows"
mkdir -p "$ROWS_DIR"
O3_CONTAINER_NAME="qwen-bench-o3-${RUN_ID}-$$"
MASTER_SUMMARY="$BATCH_DIR/summary.jsonl"
O3_SUMMARY="$BATCH_DIR/o3_summary.jsonl"
MODAL_SUMMARY="$BATCH_DIR/modal_summary.jsonl"
BENCH_SUMMARY="$BATCH_DIR/bench_summary.jsonl"
MANIFEST="$BATCH_DIR/manifest.jsonl"
: > "$MASTER_SUMMARY"
MODAL_RUNNER="$BATCH_DIR/modal_generate_batch.py"
 : > "$O3_SUMMARY"
 : > "$MODAL_SUMMARY"
 : > "$BENCH_SUMMARY"

cat > "$MODAL_RUNNER" <<'PY'
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

import modal

parser = argparse.ArgumentParser()
parser.add_argument("--manifest", required=True)
parser.add_argument("--model", required=True)
parser.add_argument("--gpu", required=True)
parser.add_argument("--summary", required=True)
args = parser.parse_args()

app = modal.App("qwen-coder-bench-generate-one")
image = (
    modal.Image.debian_slim(python_version="3.11")
    .apt_install("git")
    .pip_install("torch", "transformers", "accelerate", "sentencepiece")
)


@app.function(image=image, gpu=args.gpu, timeout=30 * 60)
def generate(prompt: str, model_name_or_path: str) -> str:
    import torch
    from transformers import AutoModelForCausalLM, AutoTokenizer

    tokenizer = AutoTokenizer.from_pretrained(model_name_or_path)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    model = AutoModelForCausalLM.from_pretrained(
        model_name_or_path,
        torch_dtype=torch.float16 if torch.cuda.is_available() else torch.float32,
    )
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.eval()

    inputs = tokenizer(prompt, return_tensors="pt", truncation=True, max_length=4096)
    inputs = {k: v.to(device) for k, v in inputs.items()}

    with torch.no_grad():
        output_ids = model.generate(
            **inputs,
            do_sample=True,
            temperature=0.2,
            top_p=0.95,
            max_new_tokens=2048,
            pad_token_id=tokenizer.pad_token_id,
            eos_token_id=tokenizer.eos_token_id,
        )

    prompt_len = inputs["input_ids"].shape[1]
    generated = tokenizer.decode(output_ids[0][prompt_len:], skip_special_tokens=True)
    return generated


def sanitize_assembly_text(raw: str) -> str:
    fenced = re.findall(r"```(?:[a-zA-Z0-9_+-]*)\n(.*?)```", raw, flags=re.S)
    text = max(fenced, key=len) if fenced else raw
    cleaned = []
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("```"):
            continue
        if s.startswith("# ") or s.startswith("## "):
            continue
        if s.startswith("- "):
            continue
        if s.lower().startswith(("here is", "explanation", "note:", "output:")):
            continue
        cleaned.append(line.rstrip())
    start = 0
    asm_re = re.compile(r'^\s*(\.|[A-Za-z_.$][\w.$]*:|\t[a-z]|[a-z]{2,}\s)')
    for i, line in enumerate(cleaned):
        if asm_re.match(line):
            start = i
            break
    return ("\n".join(cleaned[start:]).strip() + "\n")


def main() -> None:
    manifest_path = Path(args.manifest)
    summary_path = Path(args.summary)
    records = []
    with manifest_path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            records.append(json.loads(line))

    rows = []
    for rec in records:
        row_dir = Path(rec["row_dir"])
        out_dir = row_dir / "out"
        out_dir.mkdir(parents=True, exist_ok=True)
        raw_text = out_dir / "qwen25_coder_7b_instruct.raw.txt"
        asm_file = out_dir / "qwen25_coder_7b_instruct.s"
        prompt_file = row_dir / "prompt.txt"
        c_content = (row_dir / "inputC.c").read_text(encoding="utf-8", errors="replace")
        o3_content = (row_dir / "inputo3.s").read_text(encoding="utf-8", errors="replace")
        prompt = (
            "Given the following C code and O3 optimized code, edit the code to make it run faster.\n\n"
            "Output requirements:\n"
            "- Output only Linux x86_64 GNU assembly that assembles with gcc/as in docker image gcc:13 on --platform linux/amd64.\n"
            "- Include a visible entry point for linking, e.g. .globl main for main.\n"
            "- Do not use Apple/macOS assembly directives.\n"
            "- Do not output any explanation. Only output the new .s file content.\n\n"
            "--- C source (inputC.c) ---\n"
            f"{c_content}\n\n"
            "--- O3 baseline assembly (inputo3.s) ---\n"
            f"{o3_content}\n"
        )
        prompt_file.write_text(prompt, encoding="utf-8")
        rows.append((rec, prompt, raw_text, asm_file))

    results = []
    with app.run():
        for rec, prompt, raw_text_path, asm_file_path in rows:
            try:
                raw = generate.remote(prompt, args.model)
                raw_text_path.write_text(raw, encoding="utf-8")
                asm_file_path.write_text(sanitize_assembly_text(raw), encoding="utf-8")
                results.append(
                    {
                        "row_index": rec["row_index"],
                        "model": args.model,
                        "status": "ok",
                        "raw_file": str(raw_text_path),
                        "asm_file": str(asm_file_path),
                    }
                )
            except Exception as exc:  # noqa: BLE001
                results.append(
                    {
                        "row_index": rec["row_index"],
                        "model": args.model,
                        "status": "modal_error",
                        "error": str(exc),
                        "raw_file": str(raw_text_path),
                        "asm_file": str(asm_file_path),
                    }
                )

    with summary_path.open("w", encoding="utf-8") as f:
        for rec in results:
            f.write(json.dumps(rec, ensure_ascii=False) + "\n")


if __name__ == "__main__":
    main()
PY

DATA_CSV_ABS="$(abs_path "$DATA_CSV")"
if [[ ! -f "$DATA_CSV_ABS" ]]; then
  echo "Input CSV not found: $DATA_CSV_ABS" >&2
  exit 1
fi

python3 - "$DATA_CSV_ABS" "$MANIFEST" "$ROWS_DIR" <<'PY'
import csv
import json
import sys
from pathlib import Path

data_csv = Path(sys.argv[1])
manifest_path = Path(sys.argv[2])
rows_dir = Path(sys.argv[3])
rows_dir.mkdir(parents=True, exist_ok=True)

# Some rows contain very large source/test fields; lift CSV parser limit safely.
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

    with manifest_path.open("w", encoding="utf-8") as out:
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

            c_path = row_dir / "inputC.c"
            tests_path = row_dir / "input_tests.json"
            c_path.write_text(c_src, encoding="utf-8")
            tests_path.write_text(json.dumps(tests, ensure_ascii=False, indent=2), encoding="utf-8")

            rec = {
                "row_index": row_idx,
                "row_dir": str(row_dir),
                "c_path": str(c_path),
                "tests_path": str(tests_path),
                "has_tests": 1 if len(tests) > 0 else 0,
            }
            out.write(json.dumps(rec, ensure_ascii=False) + "\n")
PY

TOTAL_ROWS="$(python3 - "$MANIFEST" <<'PY'
import sys
from pathlib import Path
p = Path(sys.argv[1])
print(sum(1 for _ in p.open("r", encoding="utf-8")))
PY
)"

start_o3_container() {
  echo "Starting shared Linux x86_64 gcc container for O3 baseline generation ..."
  docker run -d --rm --platform linux/amd64 \
    --name "$O3_CONTAINER_NAME" \
    -v "$ROWS_DIR":/work/rows \
    -w /work \
    gcc:13 sleep infinity >/dev/null
}

stop_o3_container() {
  docker rm -f "$O3_CONTAINER_NAME" >/dev/null 2>&1 || true
}

trap stop_o3_container EXIT INT TERM
start_o3_container

echo "Processing $TOTAL_ROWS row(s) from $DATA_CSV_ABS"

echo
echo "=== Phase 1/3: Generate O3 baselines (shared Docker container) ==="
while IFS= read -r rec; do
  row_index="$(jq -r '.row_index' <<<"$rec")"
  row_dir="$(jq -r '.row_dir' <<<"$rec")"
  echo "[$row_index/$TOTAL_ROWS] O3 -> row_$row_index"
  row_subdir="$(basename "$row_dir")"
  set +e
  docker exec "$O3_CONTAINER_NAME" \
    gcc -S -O3 -std=c17 \
    -o "/work/rows/${row_subdir}/inputo3.s" \
    "/work/rows/${row_subdir}/inputC.c"
  o3_rc=$?
  set -e
  if [[ "$o3_rc" -eq 0 ]]; then
    jq -cn --argjson row_index "$row_index" --arg status "ok" --arg o3_file "$row_dir/inputo3.s" \
      '{row_index:$row_index,status:$status,o3_file:$o3_file}' >> "$O3_SUMMARY"
  else
    jq -cn --argjson row_index "$row_index" --arg status "o3_error" --arg o3_file "$row_dir/inputo3.s" \
      '{row_index:$row_index,status:$status,o3_file:$o3_file}' >> "$O3_SUMMARY"
  fi
done < "$MANIFEST"

echo
echo "=== Phase 2/3: Modal generation for all rows (single run context) ==="
set +e
python3 "$MODAL_RUNNER" \
  --manifest "$MANIFEST" \
  --summary "$MODAL_SUMMARY" \
  --model "$MODAL_MODEL" \
  --gpu "$MODAL_GPU"
modal_batch_rc=$?
set -e
if [[ "$modal_batch_rc" -ne 0 ]]; then
  echo "Modal batch generation failed. See partial outputs in $ROWS_DIR and $MODAL_SUMMARY" >&2
fi

echo
echo "=== Phase 3/3: Local benchmarking row-by-row ==="
while IFS= read -r rec; do
  row_index="$(jq -r '.row_index' <<<"$rec")"
  row_dir="$(jq -r '.row_dir' <<<"$rec")"
  has_tests="$(jq -r '.has_tests' <<<"$rec")"
  asm_file="$row_dir/out/${MODEL_SLUG}.s"
  bench_file="$row_dir/results/${MODEL_SLUG}.bench.json"
  mkdir -p "$row_dir/results"
  echo "[$row_index/$TOTAL_ROWS] Bench -> row_$row_index"

  if [[ ! -f "$asm_file" ]]; then
    jq -cn \
      --argjson row_index "$row_index" \
      --arg model "$MODAL_MODEL" \
      --arg status "missing_asm" \
      --arg bench_file "$bench_file" \
      --arg asm_file "$asm_file" \
      '{
        row_index:$row_index, model:$model, status:$status,
        asm_ok:false, all_passed:false, script_exit_code:-1,
        timing_enabled:false, best_by_mean_label:null, asm_mean_s:null,
        bench_file:$bench_file, asm_file:$asm_file
      }' >> "$BENCH_SUMMARY"
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
    bench_rc=$?
    set -e
    exit "$bench_rc"
  ) || true

  status_line="$(
    jq -c \
      --argjson row_index "$row_index" \
      --arg model "$MODAL_MODEL" \
      --arg bench_file "$bench_file" \
      --arg asm_file "$asm_file" '
        {
          row_index: $row_index,
          model: $model,
          status: "ok",
          asm_ok: (.compile.assembly.ok // false),
          all_passed: (.correctness.all_passed // false),
          script_exit_code: (.script_exit_code // -1),
          timing_enabled: (.timing.enabled // false),
          best_by_mean_label: (.timing_summary.best_by_mean_label // null),
          asm_mean_s: (
            .timing.asm.mean_s
            // .timing_summary.by_label.asm.mean_s
            // null
          ),
          bench_file: $bench_file,
          asm_file: $asm_file
        }' "$bench_file" 2>/dev/null || jq -cn \
          --argjson row_index "$row_index" \
          --arg model "$MODAL_MODEL" \
          --arg bench_file "$bench_file" \
          --arg asm_file "$asm_file" '
        {
          row_index:$row_index, model:$model, status:"bench_parse_error",
          asm_ok:false, all_passed:false, script_exit_code:-1,
          timing_enabled:false, best_by_mean_label:null, asm_mean_s:null,
          bench_file:$bench_file, asm_file:$asm_file
        }'
  )"
  echo "$status_line" >> "$BENCH_SUMMARY"
done < "$MANIFEST"

cat "$BENCH_SUMMARY" > "$MASTER_SUMMARY"

if [[ -z "$OUTPUT_CSV" ]]; then
  OUTPUT_CSV="$BATCH_DIR/data_with_bench.csv"
fi

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

def load_by_row(path: Path) -> dict[int, dict]:
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

o3_by_row = load_by_row(o3_jsonl)
modal_by_row = load_by_row(modal_jsonl)
bench_by_row = load_by_row(bench_jsonl)

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
    fieldnames = list(reader.fieldnames or [])
    for c in append_cols:
        if c not in fieldnames:
            fieldnames.append(c)

    with out_csv.open("w", encoding="utf-8", newline="") as fout:
        writer = csv.DictWriter(fout, fieldnames=fieldnames)
        writer.writeheader()
        for row_idx, row in enumerate(reader, start=1):
            o3 = o3_by_row.get(row_idx, {})
            modal = modal_by_row.get(row_idx, {})
            bench = bench_by_row.get(row_idx, {})

            row["o3_status"] = o3.get("status", "missing")
            row["o3_file"] = o3.get("o3_file", "")

            row["modal_model"] = modal.get("model", "")
            row["modal_status"] = modal.get("status", "missing")
            row["modal_raw_file"] = modal.get("raw_file", "")
            row["modal_asm_file"] = modal.get("asm_file", "")

            row["bench_status"] = bench.get("status", "missing")
            row["bench_asm_ok"] = bench.get("asm_ok", False)
            row["bench_all_passed"] = bench.get("all_passed", False)
            row["bench_script_exit_code"] = bench.get("script_exit_code", -1)
            row["bench_timing_enabled"] = bench.get("timing_enabled", False)
            row["bench_best_by_mean_label"] = bench.get("best_by_mean_label", "")
            row["bench_asm_mean_s"] = bench.get("asm_mean_s", "")
            row["bench_file"] = bench.get("bench_file", "")
            writer.writerow(row)
PY

echo "Done."
echo "Batch summary dir: $BATCH_DIR"
echo "Master summary:    $MASTER_SUMMARY"
echo "Output CSV:        $OUTPUT_CSV"
