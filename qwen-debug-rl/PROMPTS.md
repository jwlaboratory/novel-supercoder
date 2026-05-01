# Prompt Reference

Canonical prompts the models see during training, validation, and the
two-stage benchmark. Both are sent as a **single user message** with no system
prompt; the tokenizer's chat template is applied at inference time via
`tokenizer.apply_chat_template(..., tokenize=False, add_generation_prompt=True)`.

## 1. Normal SuperCoder Prompt (optimize unoptimized assembly)

Source: HF dataset `random1123anonymized/supercoder` → `extra_info.question`.
Forwarded verbatim into the parquet's `prompt[0].content` by
`shared/supercoder_to_parquet.py`.

```text
Given the following C code and assembly code, your task is to generate highly optimized x86-64 assembly code.
C Code:

```c
{c_code}
```

Assembly Code:

```assembly
{unoptimized_assembly}
```

Only output the optimized assembly code. Do not include any other text. Do not write any comments in the assembly code. Wrap the assembly code in ```assembly``` tags.
Optimized Assembly Code:
```

Used by:
- Training: `2-rl-supercoder-and-debug/1-train-supercoder/`,
  `4-train-debug-supercoder*`, `3-rl-train-combined/4-train-debug-supercoder*`
  (load `supercoder_train.parquet` / `supercoder_val.parquet`).
- Validation: `3-validation-benchmarks/inference-raw/infer.py`,
  `3-validation-benchmarks/inference-error-check/infer_supercoder_errors.py`,
  `3-validation-benchmarks/2-stage/infer.py` (stage 1).

## 2. Debug / Fix Prompt (repair broken optimized assembly)

Defined as `DEBUG_PROMPT_TEMPLATE` in
`1-gen-training-data/3-identify-fails.py` (canonical) and re-declared
identically in `3-validation-benchmarks/2-stage/infer.py`.

```text
You are an expert x86-64 assembly programmer. Fix the following incorrectly optimized assembly code for x86-64 Linux (compiled with gcc, linked with -lm). The assembly must compile with `gcc <file>.s -o <file> -lm` and produce correct output for all test cases. Output ONLY the corrected x86-64 assembly code — no explanations, no markdown fences, no additional text.

The error is:
{error}

The correct C code is:
{c_code}

The incorrectly optimized assembly is:
{bad_assembly}

Generated, correct but still optimized assembly:
```

Used by:
- Training: `2-rl-supercoder-and-debug/{2,3,5}-train-*`,
  `3-rl-train-combined/{2,5,6}-train-*` (load `train.parquet` / `val.parquet`).
- Validation: `3-validation-benchmarks/inference-debug/infer.py`,
  `3-validation-benchmarks/2-stage/infer.py` (stage 2).

## Verification

`/tmp/verify_prompts.py` enforces the following invariants. All 6 checks pass.

| Check | What |
| --- | --- |
| A | `DEBUG_PROMPT_TEMPLATE` byte-equal between `3-identify-fails.py` and `3-validation-benchmarks/2-stage/infer.py`. |
| B | Every row of `supercoder_train_fails.csv` (4139) and `supercoder_val_fails.csv` (74) has a `debug_prompt` that exactly equals `DEBUG_PROMPT_TEMPLATE.format(error=, c_code=, bad_assembly=)`. |
| C | The CSV duplicates in `2-rl-supercoder-and-debug/data/` and `3-rl-train-combined/data/` are byte-identical to the canonical CSVs in `1-gen-training-data/`. |
| D | The two `shared/{debug,supercoder}_to_parquet.py` copies are functionally identical (only differ by the new `--print-prompts` CLI flag). |
| E | All 4139 train + 74 val rows in `2-rl-supercoder-and-debug/data/{train,val}.parquet` have `prompt[0].content == csv['debug_prompt'].strip()`. The `.strip()` matches the converter's behaviour (`debug_to_parquet.py:68`). All 200 rows of `supercoder_val.parquet` contain both the opening line and `Optimized Assembly Code:` marker of the normal prompt. |
| F | All training / smoke / validation scripts apply the chat template with `tokenize=False, add_generation_prompt=True`. |

Run it any time:

```bash
uv run --with pyarrow python /tmp/verify_prompts.py
```

## Notes

- No system prompt is used anywhere; the chat is a single `user` turn.
- The converter `debug_to_parquet.py` calls `.strip()` on `debug_prompt`,
  which removes a single trailing newline relative to the CSV. This is
  intentional and consistent across both rl folders.
- Stage 2 of `3-validation-benchmarks/2-stage/infer.py` rebuilds the debug
  prompt at inference time using stage-1 output for `{bad_assembly}` and
  `_error_text_for_fix(...)` for `{error}`; the `c_code` is fetched from the
  HF dataset by matching the user message to `extra_info.question`.
