from __future__ import annotations

from dataclasses import asdict, dataclass
from pathlib import Path

import modal

PROJECT_ROOT = Path(__file__).resolve().parents[2]
REMOTE_PROJECT_ROOT = Path("/workspace")
DEFAULT_CSV_PATH = PROJECT_ROOT / "src" / "codeforces-approach" / "data" / "codeforces_join.csv"
DEFAULT_MODEL_NAME = "Qwen/Qwen2.5-Coder-0.5B"
DEFAULT_SPLIT_COLUMN = "dataset_split"
DEFAULT_OUTPUT_SUBDIR = "sft/qwen2.5-coder-0.5b"
ASSEMBLY_O0_COLUMN = "assembly_o0"
ASSEMBLY_O3_COLUMN = "assembly_o3"

app = modal.App("codeforces-assembly-sft")
image = (
    modal.Image.debian_slim(python_version="3.11")
    .pip_install(
        "accelerate",
        "datasets",
        "pandas",
        "torch",
        "transformers",
    )
)
project_mount = modal.Mount.from_local_dir(str(PROJECT_ROOT), remote_path=str(REMOTE_PROJECT_ROOT))
output_volume = modal.Volume.from_name("gen-optimize-assembly-artifacts", create_if_missing=True)
REMOTE_OUTPUT_ROOT = "/vol"


@dataclass
class SFTConfig:
    csv_path: str
    split_column: str = DEFAULT_SPLIT_COLUMN
    model_name: str = DEFAULT_MODEL_NAME
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR
    max_seq_length: int = 2048
    num_train_epochs: int = 1
    per_device_train_batch_size: int = 1
    per_device_eval_batch_size: int = 1
    gradient_accumulation_steps: int = 16
    learning_rate: float = 2e-5
    weight_decay: float = 0.01
    warmup_ratio: float = 0.03
    logging_steps: int = 10
    save_steps: int = 100
    eval_steps: int = 100
    max_train_rows: int = 0
    max_val_rows: int = 0


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


def map_local_path_to_remote(path_str: str) -> str:
    path = Path(path_str).resolve()
    try:
        relative = path.relative_to(PROJECT_ROOT)
    except ValueError as exc:
        raise ValueError(
            "For this script, --csv-path must live inside the project directory so "
            "Modal can access it via the mounted workspace."
        ) from exc
    return str(REMOTE_PROJECT_ROOT / relative)


@app.function(
    image=image,
    gpu="h100",
    timeout=24 * 60 * 60,
    mounts=[project_mount],
    volumes={REMOTE_OUTPUT_ROOT: output_volume},
)
def train_sft(config_dict: dict) -> dict:
    import pandas as pd
    import torch
    from datasets import Dataset
    from transformers import (
        AutoModelForCausalLM,
        AutoTokenizer,
        Trainer,
        TrainingArguments,
        default_data_collator,
    )

    config = SFTConfig(**config_dict)
    dataframe = pd.read_csv(config.csv_path, keep_default_na=False)

    def is_usable(frame: pd.DataFrame, split_name: str) -> pd.DataFrame:
        split_frame = frame[frame[config.split_column].str.upper() == split_name].copy()
        split_frame = split_frame[
            split_frame[ASSEMBLY_O0_COLUMN].astype(str).str.strip().ne("")
            & split_frame[ASSEMBLY_O3_COLUMN].astype(str).str.strip().ne("")
        ]
        return split_frame.reset_index(drop=True)

    train_df = is_usable(dataframe, "SFT")
    val_df = is_usable(dataframe, "VAL")

    if config.max_train_rows > 0:
        train_df = train_df.head(config.max_train_rows).copy()
    if config.max_val_rows > 0:
        val_df = val_df.head(config.max_val_rows).copy()

    if train_df.empty:
        raise RuntimeError("No usable SFT rows were found. Run the split script first.")

    tokenizer = AutoTokenizer.from_pretrained(config.model_name)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    model = AutoModelForCausalLM.from_pretrained(config.model_name)
    model.config.use_cache = False

    def preprocess_row(example: dict) -> dict:
        prompt = build_prompt(example[ASSEMBLY_O0_COLUMN])
        target = example[ASSEMBLY_O3_COLUMN].strip() + tokenizer.eos_token

        prompt_tokens = tokenizer(prompt, add_special_tokens=False)
        full_tokens = tokenizer(
            prompt + target,
            add_special_tokens=False,
            truncation=True,
            max_length=config.max_seq_length,
        )

        input_ids = full_tokens["input_ids"]
        attention_mask = full_tokens["attention_mask"]
        prompt_token_count = min(len(prompt_tokens["input_ids"]), len(input_ids))
        labels = input_ids.copy()
        labels[:prompt_token_count] = [-100] * prompt_token_count

        return {
            "input_ids": input_ids,
            "attention_mask": attention_mask,
            "labels": labels,
        }

    train_dataset = Dataset.from_pandas(
        train_df[[ASSEMBLY_O0_COLUMN, ASSEMBLY_O3_COLUMN]],
        preserve_index=False,
    ).map(preprocess_row, remove_columns=[ASSEMBLY_O0_COLUMN, ASSEMBLY_O3_COLUMN])

    eval_dataset = None
    if not val_df.empty:
        eval_dataset = Dataset.from_pandas(
            val_df[[ASSEMBLY_O0_COLUMN, ASSEMBLY_O3_COLUMN]],
            preserve_index=False,
        ).map(preprocess_row, remove_columns=[ASSEMBLY_O0_COLUMN, ASSEMBLY_O3_COLUMN])

    output_dir = Path(REMOTE_OUTPUT_ROOT) / config.output_subdir
    output_dir.mkdir(parents=True, exist_ok=True)

    use_bf16 = torch.cuda.is_available() and torch.cuda.is_bf16_supported()
    use_fp16 = torch.cuda.is_available() and not use_bf16

    training_args = TrainingArguments(
        output_dir=str(output_dir),
        overwrite_output_dir=True,
        num_train_epochs=config.num_train_epochs,
        per_device_train_batch_size=config.per_device_train_batch_size,
        per_device_eval_batch_size=config.per_device_eval_batch_size,
        gradient_accumulation_steps=config.gradient_accumulation_steps,
        learning_rate=config.learning_rate,
        weight_decay=config.weight_decay,
        warmup_ratio=config.warmup_ratio,
        logging_steps=config.logging_steps,
        save_steps=config.save_steps,
        eval_steps=config.eval_steps,
        evaluation_strategy="steps" if eval_dataset is not None else "no",
        save_strategy="steps",
        report_to=[],
        bf16=use_bf16,
        fp16=use_fp16,
        remove_unused_columns=False,
    )

    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=train_dataset,
        eval_dataset=eval_dataset,
        tokenizer=tokenizer,
        data_collator=default_data_collator,
    )

    train_result = trainer.train()
    trainer.save_model(str(output_dir))
    tokenizer.save_pretrained(str(output_dir))
    output_volume.commit()

    summary = {
        "output_dir": str(output_dir),
        "train_rows": len(train_df),
        "val_rows": len(val_df),
        "train_loss": float(train_result.training_loss),
    }

    if eval_dataset is not None:
        eval_metrics = trainer.evaluate()
        summary["eval_loss"] = float(eval_metrics["eval_loss"])

    return summary


@app.local_entrypoint()
def main(
    csv_path: str = str(DEFAULT_CSV_PATH),
    split_column: str = DEFAULT_SPLIT_COLUMN,
    model_name: str = DEFAULT_MODEL_NAME,
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR,
    max_seq_length: int = 2048,
    num_train_epochs: int = 1,
    per_device_train_batch_size: int = 1,
    per_device_eval_batch_size: int = 1,
    gradient_accumulation_steps: int = 16,
    learning_rate: float = 2e-5,
    weight_decay: float = 0.01,
    warmup_ratio: float = 0.03,
    logging_steps: int = 10,
    save_steps: int = 100,
    eval_steps: int = 100,
    max_train_rows: int = 0,
    max_val_rows: int = 0,
) -> None:
    config = SFTConfig(
        csv_path=map_local_path_to_remote(csv_path),
        split_column=split_column,
        model_name=model_name,
        output_subdir=output_subdir,
        max_seq_length=max_seq_length,
        num_train_epochs=num_train_epochs,
        per_device_train_batch_size=per_device_train_batch_size,
        per_device_eval_batch_size=per_device_eval_batch_size,
        gradient_accumulation_steps=gradient_accumulation_steps,
        learning_rate=learning_rate,
        weight_decay=weight_decay,
        warmup_ratio=warmup_ratio,
        logging_steps=logging_steps,
        save_steps=save_steps,
        eval_steps=eval_steps,
        max_train_rows=max_train_rows,
        max_val_rows=max_val_rows,
    )
    result = train_sft.remote(asdict(config))
    print("SFT complete")
    for key, value in result.items():
        print(f"{key}: {value}")
