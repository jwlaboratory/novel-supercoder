# SuperCoder error report (Modal)

Runs the **exp1 SuperCoder** merged HF checkpoint on a parquet split (default **`sc_val.parquet`** on the `debug-rl-data` Modal volume), then writes a **CSV** (and optional **XLSX**) with **only failing rows** by default: compile errors, runtime errors, and partial test passes.

## Prerequisites

Same as `inference-debug/`: Modal secrets (`huggingface`), volumes `debug-rl-data` and `debug-rl-checkpoints` with `sc_val.parquet` (or another split) and `exp1-train-supercoder` merged weights.

## Usage

```bash
cd qwen-debug-rl/3-validation-benchmarks/inference-error-check

# Full supercoder val split (all rows), errors-only spreadsheet
modal run infer_supercoder_errors.py

# Random subset (faster smoke test)
modal run infer_supercoder_errors.py --n-samples 50

# Explicit checkpoint inside the volume
modal run infer_supercoder_errors.py \
  --supercoder-ckpt /checkpoints/exp1-train-supercoder/global_step_420/hf_model

# Other parquet on the volume (e.g. debug failures)
modal run infer_supercoder_errors.py --parquet debug_val --n-samples 100

# Excel + include passing rows in the export
modal run infer_supercoder_errors.py --xlsx --include-passing

# Optional speedup column (hyperfine vs unoptimized binary; only for ALL_PASS)
modal run infer_supercoder_errors.py --do-speedup
```

## Output (local directory)

- `supercoder_errors_<parquet>.csv` — main artifact; open in Excel, Numbers, or pandas.
- `supercoder_errors_<parquet>.xlsx` — if `--xlsx` (long fields truncated per Excel cell limits).

### Columns

| Column | Meaning |
|--------|--------|
| `status` | `COMPILE_FAIL`, `RUNTIME_ERR`, `PARTIAL_*`, or `ALL_PASS` (latter omitted unless `--include-passing`) |
| `error_kind` | `compile`, `runtime`, `wrong_output`, `none`, … |
| `compile_stderr` | `gcc` stderr (warnings + errors) |
| `first_error_explanation` | First runtime stderr, or first stdout mismatch summary |
| `generated_assembly` | Model output (markdown fences stripped) |
| `unoptimized_assembly` | Reference slow asm from the dataset |
| `user_prompt` | User message from the chat prompt |
| `raw_response` | Full raw model text |
| `tests_passed` / `tests_total` | After successful compile |
