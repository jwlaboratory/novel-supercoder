import argparse
import os
import re
from pathlib import Path

import modal
import pandas as pd

DEFAULT_INPUT_CSV = Path("data/codeforces_cpp_assembly.csv")
DEFAULT_OUTPUT_CSV = Path("data/codeforces_cpp_generated.csv")

DEFAULT_C_COLUMN = "accepted_cpp_solution"
DEFAULT_BASELINE_ASM_COLUMN = "assembly_o3"
DEFAULT_COMPILER_TARGET_COLUMN = "assembly_compiler_target"

DEFAULT_MAX_NEW_TOKENS = 1024
DEFAULT_TEMPERATURE = 0.0
DEFAULT_TOP_P = 1.0
DEFAULT_BATCH_SIZE = 32
DEFAULT_MAX_C_CHARS = 12000
DEFAULT_MAX_BASELINE_ASM_CHARS = 12000
OVERLONG_POLICIES = {"skip", "truncate"}

MODEL_ALIASES = {
    "gemma4": "google/gemma-4-26b-a4b-it",
    "qwen2.5-coder-7b": "Qwen/Qwen2.5-Coder-7B-Instruct",
}

PROMPT_TEMPLATE = """Given the following C code and assembly code, your task is to generate highly optimized linux/arm64	g++ (GCC) 13.4.0	aarch64-linux-gnu assembly code.

C Code: {c_code}

Assembly Code: {baseline_asm}

Only output the optimized assembly code. Do not include any other text. Do not write any comments in the assembly code. Wrap the assembly code in assembly tags.

Optimized Assembly Code:"""



app = modal.App("novel-supercoder-generate-w-base")
hf_secret = modal.Secret.from_name("huggingface")

image = (
    modal.Image.debian_slim(python_version="3.11")
    .pip_install(
        "pandas>=2.2.0",
        "vllm>=0.8.5",
        "transformers>=4.51.0",
        "torch>=2.6.0",
    )
)


def iter_batches(items: list[str], batch_size: int) -> list[list[str]]:
    return [items[start : start + batch_size] for start in range(0, len(items), batch_size)]


def parse_models(raw_models: list[str]) -> list[str]:
    resolved: list[str] = []
    for model in raw_models:
        model = model.strip()
        if not model:
            continue
        resolved.append(MODEL_ALIASES.get(model, model))
    if not resolved:
        raise ValueError("No valid models resolved from --models.")
    return resolved


def output_key_from_model_name(model_name: str) -> str:
    safe = re.sub(r"[^a-zA-Z0-9]+", "_", model_name).strip("_").lower()
    return safe or "model"


def baseline_looks_arm64(target: str) -> bool:
    lowered = target.lower()
    return any(token in lowered for token in ("aarch64", "arm64", "armv8"))


def build_prompt(c_code: str, baseline_asm: str, append_arm_note: bool) -> str:
    prompt = PROMPT_TEMPLATE.format(c_code=c_code, baseline_asm=baseline_asm)

    return prompt


def trim_text(value: str, max_chars: int, label: str) -> str:
    if max_chars <= 0 or len(value) <= max_chars:
        return value
    marker = f"\n\n[{label} truncated for context length]\n"
    keep = max(0, max_chars - len(marker))
    return value[:keep] + marker


def extract_assembly_only(text: str) -> str:
    match = re.search(r"<assembly>(.*?)</assembly>", text, flags=re.IGNORECASE | re.DOTALL)
    if match:
        return match.group(1).strip()
    return text.strip()


@app.cls(
    image=image,
    gpu="H100:1",
    timeout=60 * 60 * 12,
    scaledown_window=15 * 60,
    secrets=[hf_secret],
)
class VLLMGenerator:
    model_name: str = modal.parameter()
    max_model_len: int = modal.parameter(default=8192)
    gpu_memory_utilization = 0.92
    llm = None

    @modal.enter()
    def _load_model(self) -> None:
        from vllm import LLM  # pyright: ignore[reportMissingImports]

        token = os.environ.get("HF_TOKEN", "")
        if token:
            # Make token visible to HF clients used by vLLM/transformers.
            os.environ.setdefault("HUGGING_FACE_HUB_TOKEN", token)
            os.environ.setdefault("HF_TOKEN", token)

        self.llm = LLM(
            model=self.model_name,
            trust_remote_code=True,
            max_model_len=self.max_model_len,
            gpu_memory_utilization=self.gpu_memory_utilization,
        )

    @modal.method()
    def count_prompt_tokens(self, prompts: list[str]) -> list[int]:
        if self.llm is None:
            raise RuntimeError("LLM is not initialized.")
        tokenizer = self.llm.get_tokenizer()
        return [len(tokenizer.encode(prompt, add_special_tokens=False)) for prompt in prompts]

    @modal.method()
    def model_context_length(self) -> int:
        return int(self.max_model_len)

    @modal.method()
    def generate_batch(
        self,
        prompts: list[str],
        max_new_tokens: int,
        temperature: float,
        top_p: float,
    ) -> list[str]:
        if self.llm is None:
            raise RuntimeError("LLM is not initialized.")

        from vllm import SamplingParams  # pyright: ignore[reportMissingImports]

        sampling = SamplingParams(
            max_tokens=max_new_tokens,
            temperature=temperature,
            top_p=top_p,
        )
        try:
            outputs = self.llm.generate(prompts, sampling_params=sampling)
        except Exception as exc:
            # Re-raise as a stdlib error so Modal can deserialize it locally.
            raise RuntimeError(f"Remote generation failed: {exc}") from None
        return [output.outputs[0].text for output in outputs]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Generate optimized x86-64 assembly with Modal H100 using dataset rows "
            "(C code + baseline assembly_o3)."
        )
    )
    parser.add_argument(
        "--input-csv",
        type=Path,
        default=DEFAULT_INPUT_CSV,
        help="Input CSV produced by dataset builder.",
    )
    parser.add_argument(
        "--output-csv",
        type=Path,
        default=DEFAULT_OUTPUT_CSV,
        help="Output CSV path for model generations.",
    )
    parser.add_argument(
        "--c-column",
        default=DEFAULT_C_COLUMN,
        help="Column name containing C code.",
    )
    parser.add_argument(
        "--baseline-asm-column",
        default=DEFAULT_BASELINE_ASM_COLUMN,
        help="Column name containing baseline assembly (gcc -O3).",
    )
    parser.add_argument(
        "--compiler-target-column",
        default=DEFAULT_COMPILER_TARGET_COLUMN,
        help="Column name used to detect ARM baseline and adjust prompt.",
    )
    parser.add_argument(
        "--models",
        nargs="+",
        default=["gemma4", "qwen2.5-coder-7b"],
        help=(
            "Models to run. Supports aliases: gemma4 -> google/gemma-3-4b-it, "
            "qwen2.5-coder-7b -> Qwen/Qwen2.5-Coder-7B-Instruct."
        ),
    )
    parser.add_argument("--limit", type=int, default=None, help="Optional max rows to process.")
    parser.add_argument(
        "--batch-size",
        type=int,
        default=DEFAULT_BATCH_SIZE,
        help="Prompts per remote generation call.",
    )
    parser.add_argument("--max-new-tokens", type=int, default=DEFAULT_MAX_NEW_TOKENS)
    parser.add_argument("--temperature", type=float, default=DEFAULT_TEMPERATURE)
    parser.add_argument("--top-p", type=float, default=DEFAULT_TOP_P)
    parser.add_argument(
        "--append-arm-note",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="Append an extra instruction when baseline appears ARM64.",
    )
    return parser.parse_args()


@app.local_entrypoint()
def main(
    input_csv: str = str(DEFAULT_INPUT_CSV),
    output_csv: str = str(DEFAULT_OUTPUT_CSV),
    c_column: str = DEFAULT_C_COLUMN,
    baseline_asm_column: str = DEFAULT_BASELINE_ASM_COLUMN,
    compiler_target_column: str = DEFAULT_COMPILER_TARGET_COLUMN,
    models: str = "gemma4,qwen2.5-coder-7b",
    limit: int = -1,
    batch_size: int = DEFAULT_BATCH_SIZE,
    max_new_tokens: int = DEFAULT_MAX_NEW_TOKENS,
    temperature: float = DEFAULT_TEMPERATURE,
    top_p: float = DEFAULT_TOP_P,
    append_arm_note: bool = True,
    max_c_chars: int = DEFAULT_MAX_C_CHARS,
    max_baseline_asm_chars: int = DEFAULT_MAX_BASELINE_ASM_CHARS,
    overlong_policy: str = "skip",
) -> None:
    args = argparse.Namespace(
        input_csv=Path(input_csv),
        output_csv=Path(output_csv),
        c_column=c_column,
        baseline_asm_column=baseline_asm_column,
        compiler_target_column=compiler_target_column,
        models=[m.strip() for m in models.split(",") if m.strip()],
        limit=None if limit < 0 else limit,
        batch_size=batch_size,
        max_new_tokens=max_new_tokens,
        temperature=temperature,
        top_p=top_p,
        append_arm_note=append_arm_note,
        max_c_chars=max_c_chars,
        max_baseline_asm_chars=max_baseline_asm_chars,
        overlong_policy=overlong_policy,
    )

    if batch_size <= 0:
        raise ValueError("--batch-size must be > 0.")

    if not args.input_csv.exists():
        raise FileNotFoundError(f"Input CSV not found: {args.input_csv}")

    dataframe = pd.read_csv(args.input_csv, keep_default_na=False)

    for required_col in (args.c_column, args.baseline_asm_column):
        if required_col not in dataframe.columns:
            raise ValueError(f"Missing required column in input CSV: {required_col}")

    if args.limit is not None:
        dataframe = dataframe.head(args.limit).copy()
    else:
        dataframe = dataframe.copy()

    if args.overlong_policy not in OVERLONG_POLICIES:
        raise ValueError(
            f"--overlong-policy must be one of {sorted(OVERLONG_POLICIES)}. "
            f"Got: {args.overlong_policy}"
        )

    for model_name in parse_models(args.models):
        model_key = output_key_from_model_name(model_name)
        raw_col = f"generated_{model_key}_raw"
        asm_col = f"generated_{model_key}_assembly"
        prompt_col = f"prompt_{model_key}"
        error_col = f"error_{model_key}"
        dataframe[raw_col] = ""
        dataframe[asm_col] = ""
        dataframe[prompt_col] = ""
        dataframe[error_col] = ""

        try:
            generator = VLLMGenerator(model_name=model_name)

            prompts: list[str] = []
            for _, row in dataframe.iterrows():
                c_code = str(row[args.c_column])
                baseline_asm = str(row[args.baseline_asm_column])
                if args.overlong_policy == "truncate":
                    c_code = trim_text(c_code, args.max_c_chars, "C code")
                    baseline_asm = trim_text(
                        baseline_asm,
                        args.max_baseline_asm_chars,
                        "Assembly baseline",
                    )
                compiler_target = ""
                if args.compiler_target_column in dataframe.columns:
                    compiler_target = str(row[args.compiler_target_column])
                append_arm_note = args.append_arm_note and baseline_looks_arm64(compiler_target)
                prompts.append(
                    build_prompt(
                        c_code=c_code,
                        baseline_asm=baseline_asm,
                        append_arm_note=append_arm_note,
                    )
                )

            generations: list[str] = []
            output_by_row: dict[int, str] = {}
            row_indices = list(dataframe.index)
            prompt_batches = iter_batches(prompts, args.batch_size)
            index_batches = iter_batches(row_indices, args.batch_size)
            model_ctx = generator.model_context_length.remote()
            max_input_tokens = model_ctx - args.max_new_tokens
            if max_input_tokens <= 0:
                raise ValueError(
                    f"max_new_tokens={args.max_new_tokens} is >= model context length {model_ctx} "
                    f"for model {model_name}."
                )

            for batch_idx, (prompt_batch, index_batch) in enumerate(
                zip(prompt_batches, index_batches, strict=True), start=1
            ):
                print(
                    f"[{model_name}] Generating batch {batch_idx}/{len(prompt_batches)} "
                    f"({len(prompt_batch)} prompts)"
                )
                token_counts = generator.count_prompt_tokens.remote(prompt_batch)

                kept_prompts: list[str] = []
                kept_indices: list[int] = []
                for local_idx, token_count in enumerate(token_counts):
                    row_idx = index_batch[local_idx]
                    if token_count > max_input_tokens:
                        dataframe.at[row_idx, error_col] = (
                            f"skipped_overlong_prompt: input_tokens={token_count} "
                            f"> max_input_tokens={max_input_tokens}"
                        )
                        continue
                    kept_prompts.append(prompt_batch[local_idx])
                    kept_indices.append(row_idx)

                if not kept_prompts:
                    continue

                batch_outputs = generator.generate_batch.remote(
                    prompts=kept_prompts,
                    max_new_tokens=args.max_new_tokens,
                    temperature=args.temperature,
                    top_p=args.top_p,
                )

                for row_idx, output in zip(kept_indices, batch_outputs, strict=True):
                    output_by_row[row_idx] = output
                    generations.append(output)

            for row_idx in dataframe.index:
                if row_idx in output_by_row:
                    dataframe.at[row_idx, raw_col] = output_by_row[row_idx]
                    dataframe.at[row_idx, asm_col] = extract_assembly_only(output_by_row[row_idx])
            dataframe[prompt_col] = prompts
        except Exception as exc:
            err_text = str(exc)
            print(f"[{model_name}] Failed: {err_text}")
            dataframe[error_col] = err_text

    args.output_csv.parent.mkdir(parents=True, exist_ok=True)
    dataframe.to_csv(args.output_csv, index=False)
    print(f"Saved generations to: {args.output_csv}")