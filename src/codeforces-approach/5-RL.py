from __future__ import annotations

import json
import subprocess
from dataclasses import asdict, dataclass
from pathlib import Path

import modal

PROJECT_ROOT = Path(__file__).resolve().parents[2]
REMOTE_PROJECT_ROOT = Path("/workspace")
REMOTE_OUTPUT_ROOT = "/vol"

DEFAULT_CSV_PATH = PROJECT_ROOT / "src" / "codeforces-approach" / "data" / "codeforces_join.csv"
DEFAULT_SPLIT_COLUMN = "dataset_split"
DEFAULT_BASE_MODEL = "/vol/sft/qwen2.5-coder-0.5b"
DEFAULT_OUTPUT_SUBDIR = "rl/qwen2.5-coder-0.5b"
DEFAULT_SCORER_COMMAND = "python src/codeforces-approach/6-scorer.py"

CONTEST_ID_COLUMN = "contest_id"
INDEX_COLUMN = "index"
TESTS_COLUMN = "official_tests"
SOURCE_COLUMN = "accepted_cpp_solution"
ASSEMBLY_O0_COLUMN = "assembly_o0"
ASSEMBLY_O3_COLUMN = "assembly_o3"

app = modal.App("codeforces-assembly-offline-rl")
image = (
    modal.Image.debian_slim(python_version="3.11")
    .apt_install("bash", "build-essential")
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


@dataclass
class RLConfig:
    csv_path: str
    split_column: str = DEFAULT_SPLIT_COLUMN
    model_name_or_path: str = DEFAULT_BASE_MODEL
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR
    scorer_command: str = DEFAULT_SCORER_COMMAND
    max_rows: int = 0
    num_candidates_per_row: int = 4
    top_candidates_per_row: int = 1
    min_reward_for_training: float = 0.0
    generation_max_new_tokens: int = 1024
    temperature: float = 0.8
    top_p: float = 0.95
    max_seq_length: int = 2048
    num_train_epochs: int = 1
    per_device_train_batch_size: int = 1
    gradient_accumulation_steps: int = 16
    learning_rate: float = 1e-5
    weight_decay: float = 0.01
    warmup_ratio: float = 0.03
    logging_steps: int = 10
    save_steps: int = 100
    scorer_timeout_seconds: int = 300
    reward_on_scorer_error: float = -1000.0


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
    gpu="T4",
    timeout=24 * 60 * 60,
    mounts=[project_mount],
    volumes={REMOTE_OUTPUT_ROOT: output_volume},
)
def run_offline_rl(config_dict: dict) -> dict:
    import pandas as pd
    import torch
    from datasets import Dataset
    from torch.nn import CrossEntropyLoss
    from transformers import (
        AutoModelForCausalLM,
        AutoTokenizer,
        Trainer,
        TrainingArguments,
        default_data_collator,
    )

    class RewardWeightedTrainer(Trainer):
        def compute_loss(self, model, inputs, return_outputs=False, **kwargs):
            sample_weight = inputs.pop("sample_weight")
            labels = inputs["labels"]
            outputs = model(**inputs)
            logits = outputs.logits

            shift_logits = logits[..., :-1, :].contiguous()
            shift_labels = labels[..., 1:].contiguous()
            valid_mask = shift_labels.ne(-100)

            loss_fct = CrossEntropyLoss(reduction="none")
            token_loss = loss_fct(
                shift_logits.view(-1, shift_logits.size(-1)),
                shift_labels.view(-1),
            ).view(shift_labels.size())

            per_example_loss = (
                (token_loss * valid_mask).sum(dim=1)
                / valid_mask.sum(dim=1).clamp(min=1)
            )
            weights = sample_weight.to(per_example_loss.dtype)
            loss = (per_example_loss * weights).sum() / weights.sum().clamp(min=1e-8)
            return (loss, outputs) if return_outputs else loss

    config = RLConfig(**config_dict)
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
    if not config.scorer_command.strip():
        raise RuntimeError("Pass --scorer-command so candidates can be scored.")

    tokenizer = AutoTokenizer.from_pretrained(config.model_name_or_path)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token

    model = AutoModelForCausalLM.from_pretrained(config.model_name_or_path)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    model.config.use_cache = True
    model.eval()

    output_dir = Path(REMOTE_OUTPUT_ROOT) / config.output_subdir
    output_dir.mkdir(parents=True, exist_ok=True)
    rollout_path = output_dir / "rollouts.jsonl"

    records: list[dict] = []

    def score_candidate(payload: dict) -> dict:
        try:
            result = subprocess.run(
                ["bash", "-lc", config.scorer_command],
                input=json.dumps(payload),
                text=True,
                capture_output=True,
                cwd=str(REMOTE_PROJECT_ROOT),
                timeout=config.scorer_timeout_seconds,
                check=False,
            )
        except subprocess.TimeoutExpired:
            return {
                "reward": config.reward_on_scorer_error,
                "scorer_status": "timeout",
                "scorer_stdout": "",
                "scorer_stderr": "",
            }

        if result.returncode != 0:
            return {
                "reward": config.reward_on_scorer_error,
                "scorer_status": f"command_failed_{result.returncode}",
                "scorer_stdout": result.stdout.strip(),
                "scorer_stderr": result.stderr.strip(),
            }

        try:
            score = json.loads(result.stdout)
        except json.JSONDecodeError:
            return {
                "reward": config.reward_on_scorer_error,
                "scorer_status": "invalid_json",
                "scorer_stdout": result.stdout.strip(),
                "scorer_stderr": result.stderr.strip(),
            }

        if "reward" not in score:
            score["reward"] = config.reward_on_scorer_error
            score["scorer_status"] = "missing_reward"
        else:
            score.setdefault("scorer_status", "ok")
        return score

    with torch.no_grad():
        for row in rl_df.itertuples(index=False):
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
            for sample_index, output_ids in enumerate(generated):
                candidate = tokenizer.decode(output_ids[prompt_length:], skip_special_tokens=True).strip()
                if not candidate or candidate in seen_candidates:
                    continue
                seen_candidates.add(candidate)

                payload = {
                    "contest_id": getattr(row, CONTEST_ID_COLUMN),
                    "index": getattr(row, INDEX_COLUMN),
                    "official_tests": getattr(row, TESTS_COLUMN),
                    "accepted_cpp_solution": getattr(row, SOURCE_COLUMN),
                    "assembly_o0": getattr(row, ASSEMBLY_O0_COLUMN),
                    "assembly_o3": getattr(row, ASSEMBLY_O3_COLUMN),
                    "candidate_assembly": candidate,
                }
                score = score_candidate(payload)
                records.append(
                    {
                        "contest_id": payload["contest_id"],
                        "index": payload["index"],
                        "prompt": prompt,
                        "candidate_assembly": candidate,
                        "reward": float(score.get("reward", config.reward_on_scorer_error)),
                        "score": score,
                    }
                )

    with rollout_path.open("w", encoding="utf-8") as handle:
        for record in records:
            handle.write(json.dumps(record) + "\n")

    grouped: dict[tuple[str, str], list[dict]] = {}
    for record in records:
        key = (record["contest_id"], record["index"])
        grouped.setdefault(key, []).append(record)

    selected_records: list[dict] = []
    for row_records in grouped.values():
        row_records.sort(key=lambda record: record["reward"], reverse=True)
        kept = 0
        for record in row_records:
            if record["reward"] < config.min_reward_for_training:
                continue
            selected_records.append(record)
            kept += 1
            if kept >= config.top_candidates_per_row:
                break

    if not selected_records:
        raise RuntimeError(
            "No candidates met the training reward threshold. Lower "
            "--min-reward-for-training or inspect rollouts.jsonl."
        )

    model.config.use_cache = False
    model.train()

    min_kept_reward = min(record["reward"] for record in selected_records)
    reward_shift = abs(min(min_kept_reward, 0.0)) + 1e-3

    def preprocess_record(example: dict) -> dict:
        prompt = example["prompt"]
        target = example["candidate_assembly"].strip() + tokenizer.eos_token

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
            "sample_weight": float(example["reward"]) + reward_shift,
        }

    train_dataset = Dataset.from_list(selected_records).map(
        preprocess_record,
        remove_columns=["contest_id", "index", "prompt", "candidate_assembly", "reward", "score"],
    )

    use_bf16 = torch.cuda.is_available() and torch.cuda.is_bf16_supported()
    use_fp16 = torch.cuda.is_available() and not use_bf16

    training_args = TrainingArguments(
        output_dir=str(output_dir),
        overwrite_output_dir=True,
        num_train_epochs=config.num_train_epochs,
        per_device_train_batch_size=config.per_device_train_batch_size,
        gradient_accumulation_steps=config.gradient_accumulation_steps,
        learning_rate=config.learning_rate,
        weight_decay=config.weight_decay,
        warmup_ratio=config.warmup_ratio,
        logging_steps=config.logging_steps,
        save_steps=config.save_steps,
        save_strategy="steps",
        report_to=[],
        bf16=use_bf16,
        fp16=use_fp16,
        remove_unused_columns=False,
    )

    trainer = RewardWeightedTrainer(
        model=model,
        args=training_args,
        train_dataset=train_dataset,
        tokenizer=tokenizer,
        data_collator=default_data_collator,
    )

    train_result = trainer.train()
    trainer.save_model(str(output_dir))
    tokenizer.save_pretrained(str(output_dir))
    output_volume.commit()

    rewards = [record["reward"] for record in records]
    summary = {
        "output_dir": str(output_dir),
        "rollout_path": str(rollout_path),
        "rl_rows": len(rl_df),
        "generated_candidates": len(records),
        "selected_candidates": len(selected_records),
        "avg_reward": float(sum(rewards) / len(rewards)),
        "best_reward": float(max(rewards)),
        "train_loss": float(train_result.training_loss),
    }
    return summary


@app.local_entrypoint()
def main(
    csv_path: str = str(DEFAULT_CSV_PATH),
    split_column: str = DEFAULT_SPLIT_COLUMN,
    model_name_or_path: str = DEFAULT_BASE_MODEL,
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR,
    scorer_command: str = DEFAULT_SCORER_COMMAND,
    max_rows: int = 0,
    num_candidates_per_row: int = 4,
    top_candidates_per_row: int = 1,
    min_reward_for_training: float = 0.0,
    generation_max_new_tokens: int = 1024,
    temperature: float = 0.8,
    top_p: float = 0.95,
    max_seq_length: int = 2048,
    num_train_epochs: int = 1,
    per_device_train_batch_size: int = 1,
    gradient_accumulation_steps: int = 16,
    learning_rate: float = 1e-5,
    weight_decay: float = 0.01,
    warmup_ratio: float = 0.03,
    logging_steps: int = 10,
    save_steps: int = 100,
    scorer_timeout_seconds: int = 300,
    reward_on_scorer_error: float = -1000.0,
) -> None:
    config = RLConfig(
        csv_path=map_local_path_to_remote(csv_path),
        split_column=split_column,
        model_name_or_path=map_local_path_to_remote(model_name_or_path),
        output_subdir=output_subdir,
        scorer_command=scorer_command,
        max_rows=max_rows,
        num_candidates_per_row=num_candidates_per_row,
        top_candidates_per_row=top_candidates_per_row,
        min_reward_for_training=min_reward_for_training,
        generation_max_new_tokens=generation_max_new_tokens,
        temperature=temperature,
        top_p=top_p,
        max_seq_length=max_seq_length,
        num_train_epochs=num_train_epochs,
        per_device_train_batch_size=per_device_train_batch_size,
        gradient_accumulation_steps=gradient_accumulation_steps,
        learning_rate=learning_rate,
        weight_decay=weight_decay,
        warmup_ratio=warmup_ratio,
        logging_steps=logging_steps,
        save_steps=save_steps,
        scorer_timeout_seconds=scorer_timeout_seconds,
        reward_on_scorer_error=reward_on_scorer_error,
    )
    result = run_offline_rl.remote(asdict(config))
    print("Offline RL complete")
    for key, value in result.items():
        print(f"{key}: {value}")
