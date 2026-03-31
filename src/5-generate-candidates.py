from __future__ import annotations

import json
from dataclasses import asdict, dataclass
from pathlib import Path

import modal

REMOTE_PROJECT_ROOT = Path("/workspace")
_THIS_FILE = Path(__file__).resolve()
PROJECT_ROOT = _THIS_FILE.parents[2] if len(_THIS_FILE.parents) > 2 else REMOTE_PROJECT_ROOT
REMOTE_OUTPUT_ROOT = "/vol"

DEFAULT_CSV_PATH = PROJECT_ROOT / "src" / "codeforces-approach" / "data" / "codeforces_join.csv"
DEFAULT_SPLIT_COLUMN = "dataset_split"
DEFAULT_BASE_MODEL = "/vol/sft/qwen2.5-coder-0.5b"
DEFAULT_OUTPUT_SUBDIR = "rl/qwen2.5-coder-0.5b"

CONTEST_ID_COLUMN = "contest_id"
INDEX_COLUMN = "index"
TESTS_COLUMN = "official_tests"
SOURCE_COLUMN = "accepted_cpp_solution"
ASSEMBLY_O0_COLUMN = "assembly_o0"
ASSEMBLY_O3_COLUMN = "assembly_o3"

app = modal.App("codeforces-assembly-generate-candidates")
image = (
    modal.Image.debian_slim(python_version="3.11")
    .apt_install("bash", "build-essential")
    .pip_install(
        "pandas",
        "torch",
        "transformers",
    )
    .add_local_dir(str(PROJECT_ROOT), remote_path=str(REMOTE_PROJECT_ROOT), copy=True)
)
output_volume = modal.Volume.from_name("gen-optimize-assembly-artifacts", create_if_missing=True)


@dataclass
class GenerationConfig:
    csv_path: str
    split_column: str = DEFAULT_SPLIT_COLUMN
    model_name_or_path: str = DEFAULT_BASE_MODEL
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR
    max_rows: int = 0
    num_candidates_per_row: int = 4
    generation_max_new_tokens: int = 1024
    temperature: float = 0.8
    top_p: float = 0.95
    max_seq_length: int = 2048


def build_prompt(assembly_o0: str) -> str:
    return (
        "You are an expert compiler optimizer for Linux ARM64.\n"
        "Rewrite the given -O0 assembly into a more optimized version while preserving exact behavior.\n"
        "Return only assembly text for the same target toolchain.\n\n"
        "<INPUT_ASSEMBLY_O0>\n"
        f"{assembly_o0.strip()}\n"
        "</INPUT_ASSEMBLY_O0>\n\n"
        "<OPTIMIZED_ASSEMBLY>\n"
    )


def clean_candidate_assembly(text: str) -> str:
    cleaned = text.strip()
    if "<OPTIMIZED_ASSEMBLY>" in cleaned:
        cleaned = cleaned.split("<OPTIMIZED_ASSEMBLY>", 1)[1]
    if "</OPTIMIZED_ASSEMBLY>" in cleaned:
        cleaned = cleaned.split("</OPTIMIZED_ASSEMBLY>", 1)[0]
    cleaned = cleaned.strip()

    if cleaned.startswith("```"):
        lines = cleaned.splitlines()
        if lines and lines[0].startswith("```"):
            lines = lines[1:]
        if lines and lines[-1].strip().startswith("```"):
            lines = lines[:-1]
        cleaned = "\n".join(lines).strip()

    return cleaned


def map_local_path_to_remote(path_str: str) -> str:
    if path_str.startswith(f"{REMOTE_OUTPUT_ROOT}/"):
        return path_str

    path = Path(path_str).resolve()
    try:
        relative = path.relative_to(PROJECT_ROOT)
    except ValueError:
        return path_str
    return str(REMOTE_PROJECT_ROOT / relative)


@app.function(
    image=image,
    gpu="h100",
    timeout=24 * 60 * 60,
    volumes={REMOTE_OUTPUT_ROOT: output_volume},
)
def generate_candidates(config_dict: dict) -> dict:
    import pandas as pd
    import torch
    from transformers import AutoModelForCausalLM, AutoTokenizer

    config = GenerationConfig(**config_dict)
    usecols = [
        CONTEST_ID_COLUMN,
        INDEX_COLUMN,
        TESTS_COLUMN,
        SOURCE_COLUMN,
        ASSEMBLY_O0_COLUMN,
        ASSEMBLY_O3_COLUMN,
        config.split_column,
    ]
    dataframe = pd.read_csv(config.csv_path, keep_default_na=False, usecols=usecols)
    dataframe[config.split_column] = dataframe[config.split_column].astype(str).str.upper()

    rl_df = dataframe[dataframe[config.split_column] == "RL"].copy()
    rl_df = rl_df[
        rl_df[ASSEMBLY_O0_COLUMN].astype(str).str.strip().ne("")
        & rl_df[ASSEMBLY_O3_COLUMN].astype(str).str.strip().ne("")
        & rl_df[TESTS_COLUMN].astype(str).str.strip().ne("")
    ].reset_index(drop=True)

    if config.max_rows > 0:
        rl_df = rl_df.head(config.max_rows).copy()
    if rl_df.empty:
        raise RuntimeError("No usable RL rows were found. Run split and assembly generation first.")

    tokenizer = AutoTokenizer.from_pretrained(config.model_name_or_path)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    model = AutoModelForCausalLM.from_pretrained(config.model_name_or_path)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.eval()

    output_dir = Path(REMOTE_OUTPUT_ROOT) / config.output_subdir
    output_dir.mkdir(parents=True, exist_ok=True)
    candidates_path = output_dir / "generated_candidates.jsonl"

    records: list[dict] = []
    with torch.no_grad():
        for row_idx, row in enumerate(rl_df.itertuples(index=False)):
            prompt = build_prompt(getattr(row, ASSEMBLY_O0_COLUMN))
            encoded = tokenizer(prompt, return_tensors="pt", truncation=True, max_length=config.max_seq_length)
            encoded = {key: value.to(device) for key, value in encoded.items()}

            generated = model.generate(
                **encoded,
                do_sample=True,
                top_p=config.top_p,
                temperature=config.temperature,
                max_new_tokens=config.generation_max_new_tokens,
                num_return_sequences=config.num_candidates_per_row,
                pad_token_id=tokenizer.pad_token_id,
                eos_token_id=tokenizer.eos_token_id,
            )

            prompt_length = encoded["input_ids"].shape[1]
            seen_candidates: set[str] = set()
            for output_ids in generated:
                raw_candidate = tokenizer.decode(output_ids[prompt_length:], skip_special_tokens=True)
                candidate = clean_candidate_assembly(raw_candidate)
                if not candidate or candidate in seen_candidates:
                    continue
                seen_candidates.add(candidate)
                records.append(
                    {
                        "contest_id": getattr(row, CONTEST_ID_COLUMN),
                        "index": getattr(row, INDEX_COLUMN),
                        "row_id": f"{getattr(row, CONTEST_ID_COLUMN)}::{getattr(row, INDEX_COLUMN)}",
                        "official_tests": getattr(row, TESTS_COLUMN),
                        "accepted_cpp_solution": getattr(row, SOURCE_COLUMN),
                        "assembly_o0": getattr(row, ASSEMBLY_O0_COLUMN),
                        "assembly_o3": getattr(row, ASSEMBLY_O3_COLUMN),
                        "prompt": prompt,
                        "candidate_assembly": candidate,
                    }
                )

    with candidates_path.open("w", encoding="utf-8") as handle:
        for record in records:
            handle.write(json.dumps(record) + "\n")

    output_volume.commit()
    return {
        "output_dir": str(output_dir),
        "candidates_path": str(candidates_path),
        "rl_rows": int(len(rl_df)),
        "generated_candidates": len(records),
    }


@app.local_entrypoint()
def main(
    csv_path: str = str(DEFAULT_CSV_PATH),
    split_column: str = DEFAULT_SPLIT_COLUMN,
    model_name_or_path: str = DEFAULT_BASE_MODEL,
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR,
    max_rows: int = 0,
    num_candidates_per_row: int = 4,
    generation_max_new_tokens: int = 1024,
    temperature: float = 0.8,
    top_p: float = 0.95,
    max_seq_length: int = 2048,
) -> None:
    config = GenerationConfig(
        csv_path=map_local_path_to_remote(csv_path),
        split_column=split_column,
        model_name_or_path=map_local_path_to_remote(model_name_or_path),
        output_subdir=output_subdir,
        max_rows=max_rows,
        num_candidates_per_row=num_candidates_per_row,
        generation_max_new_tokens=generation_max_new_tokens,
        temperature=temperature,
        top_p=top_p,
        max_seq_length=max_seq_length,
    )
    result = generate_candidates.remote(asdict(config))
    print("Candidate generation complete")
    for key, value in result.items():
        print(f"{key}: {value}")
