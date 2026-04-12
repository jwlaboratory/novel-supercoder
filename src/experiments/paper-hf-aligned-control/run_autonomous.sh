#!/usr/bin/env bash
# Control: paper Hugging Face dataset (random1123anonymized/supercoder) + same pipeline as
# run-their-paper-exactly (prepare → modal run SGLang-style → SuperCoder bench in Docker).
# Proves high compile + high test-pass when BOTH data and toolchain match the paper setup.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PAPER_EXACT_DIR="$ROOT_DIR/../run-their-paper-exactly"
COPYING_PAPER_DIR="$ROOT_DIR/../experiment-copying-paper"
JWLABS="${JWLABS:-$(cd "$ROOT_DIR/../../../.." && pwd)}"

# Number of val rows (200 = full SuperCoder val split).
N_ROWS="${N_ROWS:-200}"
RUN_DIR="${RUN_DIR:-$ROOT_DIR/results/$(date +%Y%m%d_%H%M%S)_paper_hf_control_n${N_ROWS}}"
MODEL_NAME="${MODEL_NAME:-Qwen/Qwen2.5-Coder-7B-Instruct}"
MODAL_WORKERS="${MODAL_WORKERS:-4}"
BATCH_SIZE="${BATCH_SIZE:-32}"
NUM_FS="${NUM_FS:-0}"

REL_RUN="${RUN_DIR#$JWLABS/}"
DOCKER_RUN_DIR="/workspace/$REL_RUN"

echo "Experiment: paper-hf-aligned-control"
echo "Dataset: random1123anonymized/supercoder split=val first N_ROWS=$N_ROWS"
echo "Host run dir: $RUN_DIR"
echo "Container run dir: $DOCKER_RUN_DIR"

mkdir -p "$RUN_DIR"

uv run --with datasets python "$COPYING_PAPER_DIR/prepare_supercoder_run.py" \
  --run-dir "$RUN_DIR" \
  --ds-name random1123anonymized/supercoder \
  --split val \
  --offset 0 \
  --limit "$N_ROWS"

uv run --with modal --with datasets modal run "$PAPER_EXACT_DIR/modal_generate_supercoder_prompt_sglang_style.py" \
  --manifest "$RUN_DIR/manifest.jsonl" \
  --summary "$RUN_DIR/modal_summary.jsonl" \
  --workers "$MODAL_WORKERS" \
  --batch-size "$BATCH_SIZE" \
  --write-mode overwrite \
  --prompt-key main \
  --ds-name random1123anonymized/supercoder \
  --num-fs "$NUM_FS" \
  --model-name "$MODEL_NAME"

docker run --rm --platform linux/amd64 \
  -v "$JWLABS:/workspace" \
  -w "/workspace/SuperCoder" \
  "${DOCKER_IMAGE:-supercoder-x86-bench}" \
  bash -lc "pip3 install --no-cache-dir datasets==4.3.0 numpy requests tqdm psutil >/tmp/pip_install_bench.log 2>&1 && \
  python3 /workspace/novel-supercoder/src/experiments/experiment-copying-paper/run_supercoder_benchmark_from_modal.py \
    --run-dir \"$DOCKER_RUN_DIR\" \
    --supercoder-root /workspace/SuperCoder \
    --ds-name random1123anonymized/supercoder \
    --split val \
    --offset 0 \
    --limit \"$N_ROWS\" \
    --model-name \"$MODEL_NAME\" \
    --num-workers 4"

python3 - <<PY
import json
from pathlib import Path
run = Path("$RUN_DIR")
bench = run / "supercoder_bench" / "problem_results.json"
meta = {
    "experiment": "paper-hf-aligned-control",
    "dataset": "random1123anonymized/supercoder",
    "split": "val",
    "n_rows": int("$N_ROWS"),
    "model": "$MODEL_NAME",
    "run_dir": str(run),
    "problem_results_json": str(bench),
}
if bench.exists():
    summary = json.loads(bench.read_text(encoding="utf-8")).get("summary", {})
    meta["compilation_rate_pct"] = summary.get("compilation_rate")
    meta["accuracy_pct"] = summary.get("accuracy")
    meta["compiled_problems"] = summary.get("compiled_problems")
    meta["correct_problems"] = summary.get("correct_problems")
(run / "experiment_record.json").write_text(json.dumps(meta, indent=2), encoding="utf-8")
print("Wrote", run / "experiment_record.json")
PY

echo "Done: $RUN_DIR"
