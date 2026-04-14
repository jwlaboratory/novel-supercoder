#!/usr/bin/env bash
set -euo pipefail

MANUAL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEFAULT_MODELS=(
  "deepseek/deepseek-chat-v3-0324"
  "qwen/qwen-2.5-72b-instruct"
  "mistralai/mistral-large-2411"
  "openai/gpt-4.1-mini"
)

RUNS=10
WARMUP=3
EXAMPLE_NAME=""
MODELS_CSV=""
C_FILE=""
TESTS_FILE=""
HF_RANDOM_N=0
HF_DATASET="KrishPS/codenet-accepted-c"
HF_SPLIT="train"
HF_SEED=42

usage() {
  cat <<'EOF'
Usage:
  run_openrouter_bench.sh --c-file <path/to/file.c> --tests <path/to/input_tests.json> [options]
  run_openrouter_bench.sh --hf-random <N> [options]

Options:
  --models <csv>      Comma-separated OpenRouter model IDs.
                      Default: deepseek/deepseek-chat-v3-0324,qwen/qwen-2.5-72b-instruct,mistralai/mistral-large-2411,openai/gpt-4.1-mini
  --name <exampleN>   Folder name under this directory. If omitted, auto-creates next example number.
  --runs <n>          Hyperfine runs per model (default: 10)
  --warmup <n>        Hyperfine warmup runs (default: 3)
  --hf-random <N>     Sample N random rows from HF dataset and run full pipeline for each.
  --hf-dataset <id>   HF dataset id for --hf-random (default: KrishPS/codenet-accepted-c)
  --hf-split <name>   HF split for --hf-random (default: train)
  --hf-seed <n>       RNG seed for --hf-random (default: 42)
  -h, --help          Show this help

Env:
  OPENROUTER_API_KEY must be set (or present in .env as OPENROUTER_API_KEY=...).
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --c-file)
      C_FILE="${2:-}"
      shift 2
      ;;
    --tests)
      TESTS_FILE="${2:-}"
      shift 2
      ;;
    --models)
      MODELS_CSV="${2:-}"
      shift 2
      ;;
    --name)
      EXAMPLE_NAME="${2:-}"
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
    --hf-random)
      HF_RANDOM_N="${2:-0}"
      shift 2
      ;;
    --hf-dataset)
      HF_DATASET="${2:-}"
      shift 2
      ;;
    --hf-split)
      HF_SPLIT="${2:-}"
      shift 2
      ;;
    --hf-seed)
      HF_SEED="${2:-42}"
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

if [[ "$HF_RANDOM_N" -gt 0 ]]; then
  if [[ -n "$C_FILE" || -n "$TESTS_FILE" ]]; then
    echo "Ignoring --c-file/--tests because --hf-random is set." >&2
  fi
else
  if [[ -z "$C_FILE" || -z "$TESTS_FILE" ]]; then
    echo "Either provide --c-file + --tests OR use --hf-random <N>." >&2
    usage
    exit 1
  fi
fi

if [[ -f "$MANUAL_DIR/.env" ]]; then
  set -a
  # shellcheck disable=SC1091
  source "$MANUAL_DIR/.env"
  set +a
fi

if [[ -z "${OPENROUTER_API_KEY:-}" ]]; then
  echo "OPENROUTER_API_KEY is not set. Put it in env or $MANUAL_DIR/.env." >&2
  exit 1
fi

for cmd in docker curl jq python3 hyperfine-bench; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done

abs_path() {
  python3 -c 'import os,sys; print(os.path.abspath(sys.argv[1]))' "$1"
}

next_example_name() {
  local max_n=0
  local d bn n
  shopt -s nullglob
  for d in "$MANUAL_DIR"/example*; do
    bn="$(basename "$d")"
    if [[ "$bn" =~ ^example([0-9]+)$ ]]; then
      n="${BASH_REMATCH[1]}"
      if (( n > max_n )); then
        max_n="$n"
      fi
    fi
  done
  shopt -u nullglob
  echo "example$((max_n + 1))"
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

slug_model() {
  echo "$1" | tr '/:.' '_' | tr -cd 'A-Za-z0-9_-'
}

if [[ -n "$MODELS_CSV" ]]; then
  IFS=',' read -r -a MODELS <<< "$MODELS_CSV"
else
  MODELS=("${DEFAULT_MODELS[@]}")
fi

if [[ ${#MODELS[@]} -eq 0 ]]; then
  echo "No models selected." >&2
  exit 1
fi

RUN_ID="$(date +%Y%m%d_%H%M%S)"
BATCH_DIR="$MANUAL_DIR/results/$RUN_ID"
mkdir -p "$BATCH_DIR"
MASTER_SUMMARY="$BATCH_DIR/summary.jsonl"
: > "$MASTER_SUMMARY"

process_example() {
  local example_name="$1"
  local c_src="$2"
  local tests_src="$3"
  local meta_problem_id="${4:-}"
  local meta_submission_id="${5:-}"

  local c_abs tests_abs example_dir out_dir results_dir prompt_file summary_json
  c_abs="$(abs_path "$c_src")"
  tests_abs="$(abs_path "$tests_src")"

  if [[ ! -f "$c_abs" ]]; then
    echo "C file not found: $c_abs" >&2
    return 1
  fi
  if [[ ! -f "$tests_abs" ]]; then
    echo "Tests file not found: $tests_abs" >&2
    return 1
  fi

  example_dir="$MANUAL_DIR/$example_name"
  out_dir="$example_dir/out"
  results_dir="$example_dir/results"
  prompt_file="$example_dir/prompt.txt"
  summary_json="$results_dir/summary.jsonl"

  mkdir -p "$out_dir" "$results_dir"
  cp "$c_abs" "$example_dir/inputC.c"
  cp "$tests_abs" "$example_dir/input_tests.json"

  if [[ -n "$meta_problem_id" || -n "$meta_submission_id" ]]; then
    jq -n \
      --arg problem_id "$meta_problem_id" \
      --arg submission_id "$meta_submission_id" \
      '{"problem_id":$problem_id,"submission_id":$submission_id}' > "$example_dir/source_row.json"
  fi

  echo "Created/updated: $example_dir"
  echo "Generating Linux aarch64 -O3 baseline inputo3.s ..."
  (
    cd "$example_dir"
    docker run --rm --platform linux/arm64 \
      -v "$(pwd)":/work -w /work \
      gcc:13 \
      gcc -S -O3 -std=c17 -o inputo3.s inputC.c
  )

  local c_content o3_content
  c_content="$(<"$example_dir/inputC.c")"
  o3_content="$(<"$example_dir/inputo3.s")"

  cat > "$prompt_file" <<EOF
Given the following C code and O3 optimized code, edit the code to make it run faster.

Output requirements:
- Output only Linux aarch64 GNU assembly that assembles with gcc/as in docker image gcc:13 on --platform linux/arm64.
- Do not use Apple/macOS assembly directives.
- Do not output any explanation. Only output the new .s file content.

--- C source (inputC.c) ---
$c_content

--- O3 baseline assembly (inputo3.s) ---
$o3_content
EOF

  : > "$summary_json"
  echo "Running OpenRouter on ${#MODELS[@]} model(s) ..."
  local model model_trimmed slug raw_resp raw_text asm_file bench_file req_payload http_code status_line
  for model in "${MODELS[@]}"; do
    model_trimmed="$(echo "$model" | xargs)"
    if [[ -z "$model_trimmed" ]]; then
      continue
    fi

    slug="$(slug_model "$model_trimmed")"
    raw_resp="$out_dir/${slug}.openrouter.json"
    raw_text="$out_dir/${slug}.raw.txt"
    asm_file="$out_dir/${slug}.s"
    bench_file="$results_dir/${slug}.bench.json"

    echo "→ Model: $model_trimmed"
    req_payload="$(jq -n \
      --arg model "$model_trimmed" \
      --arg prompt "$(<"$prompt_file")" \
      '{model:$model, messages:[{role:"user", content:$prompt}], temperature:0.2}')"

    http_code="$(
      curl -sS -o "$raw_resp" -w "%{http_code}" \
        -H "Authorization: Bearer ${OPENROUTER_API_KEY}" \
        -H "Content-Type: application/json" \
        https://openrouter.ai/api/v1/chat/completions \
        -d "$req_payload" || true
    )"

    if [[ "$http_code" != "200" ]]; then
      echo "  OpenRouter request failed (HTTP $http_code). See $raw_resp" >&2
      jq -cn \
        --arg example "$example_name" \
        --arg model "$model_trimmed" \
        --arg status "openrouter_error" \
        '{"example":$example,"model":$model,"status":$status}' | tee -a "$summary_json" >> "$MASTER_SUMMARY" >/dev/null
      continue
    fi

    jq -r '.choices[0].message.content // ""' "$raw_resp" > "$raw_text"
    sanitize_assembly "$raw_text" "$asm_file"

    (
      cd "$example_dir"
      set +e
      hyperfine-bench "./out/${slug}.s" \
        --reference ./inputC.c \
        --tests input_tests.json \
        --language c \
        --use-docker \
        --docker-image gcc:13 \
        --docker-platform linux/arm64 \
        --runs "$RUNS" \
        --hyperfine-warmup "$WARMUP" \
        --hyperfine-prepare "sync" \
        --timing-summary \
        --timing-chart \
        --pretty > "$bench_file"
      bench_rc=$?
      set -e
      exit "$bench_rc"
    ) || true

    status_line="$(
      jq -c \
        --arg example "$example_name" \
        --arg model "$model_trimmed" '
          {
            example: $example,
            model: $model,
            asm_ok: (.compile.assembly.ok // false),
            all_passed: (.correctness.all_passed // false),
            script_exit_code: (.script_exit_code // -1),
            bench_file: input_filename
          }' "$bench_file" 2>/dev/null || jq -cn --arg example "$example_name" --arg model "$model_trimmed" '{"example":$example,"model":$model,"asm_ok":false,"all_passed":false,"script_exit_code":-1}'
    )"
    echo "$status_line" | tee -a "$summary_json" >> "$MASTER_SUMMARY" >/dev/null
  done

  echo
  echo "Example done:   $example_name"
  echo "Prompt saved:   $prompt_file"
  echo "Outputs:        $out_dir"
  echo "Bench results:  $results_dir"
  echo
}

if [[ "$HF_RANDOM_N" -gt 0 ]]; then
  if ! python3 - <<'PY' >/dev/null 2>&1
import datasets  # noqa: F401
PY
  then
    echo "Python package 'datasets' is required for --hf-random. Install with: pip install datasets" >&2
    exit 1
  fi

  TMP_HF_DIR="$(mktemp -d)"
  HF_MANIFEST="$TMP_HF_DIR/manifest.jsonl"
  python3 - "$HF_RANDOM_N" "$HF_DATASET" "$HF_SPLIT" "$HF_SEED" "$TMP_HF_DIR" "$HF_MANIFEST" <<'PY'
import json
import random
import sys
from pathlib import Path
from datasets import load_dataset

n = int(sys.argv[1])
dataset_id = sys.argv[2]
split = sys.argv[3]
seed = int(sys.argv[4])
out_dir = Path(sys.argv[5])
manifest = Path(sys.argv[6])

ds = load_dataset(dataset_id, split=split)
if n > len(ds):
    raise SystemExit(f"Requested {n} rows but split has only {len(ds)} rows.")

rng = random.Random(seed)
indices = rng.sample(range(len(ds)), n)

with manifest.open("w", encoding="utf-8") as mf:
    for i, idx in enumerate(indices, start=1):
        row = ds[idx]
        code = row.get("code", "")
        tests = row.get("test_cases", [])
        if isinstance(tests, str):
            try:
                tests = json.loads(tests)
            except json.JSONDecodeError:
                tests = []
        if not isinstance(tests, list):
            tests = []

        c_path = out_dir / f"sample_{i}.c"
        t_path = out_dir / f"sample_{i}_tests.json"
        c_path.write_text(code, encoding="utf-8")
        t_path.write_text(json.dumps(tests, ensure_ascii=False, indent=2), encoding="utf-8")

        mf.write(json.dumps({
            "i": i,
            "row_index": idx,
            "problem_id": row.get("problem_id", ""),
            "submission_id": row.get("submission_id", ""),
            "c_path": str(c_path),
            "tests_path": str(t_path)
        }) + "\n")
PY

  echo "Sampled $HF_RANDOM_N row(s) from $HF_DATASET ($HF_SPLIT)."
  while IFS= read -r row; do
    i="$(jq -r '.i' <<<"$row")"
    c_path="$(jq -r '.c_path' <<<"$row")"
    tests_path="$(jq -r '.tests_path' <<<"$row")"
    problem_id="$(jq -r '.problem_id' <<<"$row")"
    submission_id="$(jq -r '.submission_id' <<<"$row")"

    if [[ -n "$EXAMPLE_NAME" && "$HF_RANDOM_N" -eq 1 ]]; then
      ex_name="$EXAMPLE_NAME"
    else
      ex_name="$(next_example_name)"
    fi
    echo
    echo "=== [$i/$HF_RANDOM_N] $ex_name (problem_id=$problem_id, submission_id=$submission_id) ==="
    process_example "$ex_name" "$c_path" "$tests_path" "$problem_id" "$submission_id"
  done < "$HF_MANIFEST"
else
  C_FILE_ABS="$(abs_path "$C_FILE")"
  TESTS_FILE_ABS="$(abs_path "$TESTS_FILE")"
  if [[ -z "$EXAMPLE_NAME" ]]; then
    EXAMPLE_NAME="$(next_example_name)"
  fi
  process_example "$EXAMPLE_NAME" "$C_FILE_ABS" "$TESTS_FILE_ABS"
fi

echo "Done."
echo "Batch summary dir: $BATCH_DIR"
echo "Master summary:    $MASTER_SUMMARY"
echo
echo "Summary:"
jq -s '.' "$MASTER_SUMMARY"
