from __future__ import annotations

import json
from dataclasses import asdict, dataclass
from pathlib import Path

import modal

REMOTE_PROJECT_ROOT = Path("/workspace")
_THIS_FILE = Path(__file__).resolve()
PROJECT_ROOT = _THIS_FILE.parents[2] if len(_THIS_FILE.parents) > 2 else REMOTE_PROJECT_ROOT
REMOTE_OUTPUT_ROOT = "/vol"

DEFAULT_SCORED_ROLLOUTS_PATH = (
    PROJECT_ROOT / "src" / "codeforces-approach" / "data" / "scored_rollouts.jsonl"
)
DEFAULT_BASE_MODEL = "/vol/sft/qwen2.5-coder-0.5b"
DEFAULT_OUTPUT_SUBDIR = "rl/qwen2.5-coder-0.5b"

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
    .add_local_dir(str(PROJECT_ROOT), remote_path=str(REMOTE_PROJECT_ROOT), copy=True)
)
output_volume = modal.Volume.from_name("gen-optimize-assembly-artifacts", create_if_missing=True)


@dataclass
class RLConfig:
    scored_rollouts_path: str
    model_name_or_path: str = DEFAULT_BASE_MODEL
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR
    max_records: int = 0
    require_all_tests_pass: bool = True
    top_candidates_per_row: int = 1
    min_reward_for_training: float = 0.0
    max_seq_length: int = 2048
    num_train_epochs: int = 1
    per_device_train_batch_size: int = 1
    gradient_accumulation_steps: int = 16
    learning_rate: float = 1e-5
    weight_decay: float = 0.01
    warmup_ratio: float = 0.03
    logging_steps: int = 10
    save_steps: int = 100
    seed: int = 42


def _parse_reward(raw_value: object) -> float | None:
    try:
        return float(raw_value)
    except (TypeError, ValueError):
        return None


def _extract_all_passed(record: dict) -> bool | None:
    explicit_correct = record.get("correct")
    if isinstance(explicit_correct, bool):
        return explicit_correct

    correctness_obj = record.get("correctness")
    if isinstance(correctness_obj, dict):
        all_passed = correctness_obj.get("all_passed")
        if isinstance(all_passed, bool):
            return all_passed

    score_obj = record.get("score")
    if isinstance(score_obj, dict):
        nested_correctness = score_obj.get("correctness")
        if isinstance(nested_correctness, dict):
            all_passed = nested_correctness.get("all_passed")
            if isinstance(all_passed, bool):
                return all_passed
    return None


def _record_group_key(record: dict, row_number: int) -> str:
    contest_id = str(record.get("contest_id", "")).strip()
    index = str(record.get("index", "")).strip()
    if contest_id and index:
        return f"{contest_id}::{index}"

    row_id = str(record.get("row_id", "")).strip()
    if row_id:
        return row_id

    prompt = str(record.get("prompt", "")).strip()
    if prompt:
        return prompt

    return f"row-{row_number}"


def load_scored_rollouts(path_str: str) -> list[dict]:
    path = Path(path_str)
    if not path.exists():
        raise FileNotFoundError(f"Scored rollouts file not found: {path}")

    suffix = path.suffix.lower()
    records: list[dict] = []
    if suffix == ".jsonl":
        with path.open("r", encoding="utf-8") as handle:
            for line_number, line in enumerate(handle, start=1):
                text = line.strip()
                if not text:
                    continue
                try:
                    item = json.loads(text)
                except json.JSONDecodeError as exc:
                    raise ValueError(
                        f"Invalid JSON in {path} at line {line_number}: {exc}"
                    ) from exc
                if not isinstance(item, dict):
                    continue
                records.append(item)
    elif suffix == ".json":
        payload = json.loads(path.read_text(encoding="utf-8"))
        if isinstance(payload, list):
            records = [item for item in payload if isinstance(item, dict)]
        elif isinstance(payload, dict):
            records = [payload]
    elif suffix == ".parquet":
        import pandas as pd

        records = pd.read_parquet(path).to_dict(orient="records")
    else:
        raise ValueError(
            f"Unsupported scored rollout format for {path}. Use .jsonl, .json, or .parquet."
        )
    return records


def prepare_training_records(config: RLConfig, records: list[dict]) -> tuple[list[dict], dict]:
    grouped: dict[str, list[dict]] = {}
    dropped_missing_fields = 0
    dropped_bad_reward = 0
    dropped_incorrect = 0

    for row_number, record in enumerate(records):
        prompt = str(record.get("prompt", "")).strip()
        candidate = str(record.get("candidate_assembly", "")).strip()
        reward = _parse_reward(record.get("reward"))

        if not prompt or not candidate:
            dropped_missing_fields += 1
            continue
        if reward is None:
            dropped_bad_reward += 1
            continue

        all_passed = _extract_all_passed(record)
        if config.require_all_tests_pass and all_passed is False:
            dropped_incorrect += 1
            continue

        normalized = dict(record)
        normalized["prompt"] = prompt
        normalized["candidate_assembly"] = candidate
        normalized["reward"] = reward
        normalized["_group_key"] = _record_group_key(record, row_number)
        grouped.setdefault(normalized["_group_key"], []).append(normalized)

    selected_records: list[dict] = []
    dropped_below_reward = 0
    for row_records in grouped.values():
        row_records.sort(key=lambda item: item["reward"], reverse=True)
        kept = 0
        for record in row_records:
            if record["reward"] < config.min_reward_for_training:
                dropped_below_reward += 1
                continue
            selected_records.append(record)
            kept += 1
            if kept >= config.top_candidates_per_row:
                break

    stats = {
        "loaded_records": len(records),
        "dropped_missing_fields": dropped_missing_fields,
        "dropped_bad_reward": dropped_bad_reward,
        "dropped_incorrect": dropped_incorrect,
        "dropped_below_reward": dropped_below_reward,
        "grouped_rows": len(grouped),
        "selected_records": len(selected_records),
    }
    return selected_records, stats


def map_local_path_to_remote(path_str: str) -> str:
    if path_str.startswith(f"{REMOTE_OUTPUT_ROOT}/"):
        return path_str

    path = Path(path_str).resolve()
    try:
        relative = path.relative_to(PROJECT_ROOT)
    except ValueError:
        if path.exists():
            raise ValueError(
                "scored_rollouts_path must be inside the project directory (so Modal can mount it) "
                f"or already in {REMOTE_OUTPUT_ROOT}. Got: {path}"
            )
        return path_str
    return str(REMOTE_PROJECT_ROOT / relative)


@app.function(
    image=image,
    gpu="h100",
    timeout=24 * 60 * 60,
    volumes={REMOTE_OUTPUT_ROOT: output_volume},
)
def run_offline_rl(config_dict: dict) -> dict:
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
    records = load_scored_rollouts(config.scored_rollouts_path)
    if config.max_records > 0:
        records = records[: config.max_records]
    if not records:
        raise RuntimeError("No records found in scored rollout file.")

    selected_records, selection_stats = prepare_training_records(config, records)
    if not selected_records:
        raise RuntimeError(
            "No records available for training after filtering. Check scored rollout format, "
            "--min-reward-for-training, and --require-all-tests-pass."
        )

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
    selected_rollouts_path = output_dir / "selected_rollouts.jsonl"
    with selected_rollouts_path.open("w", encoding="utf-8") as handle:
        for record in selected_records:
            handle.write(json.dumps(record) + "\n")

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

    raw_dataset = Dataset.from_list(selected_records)
    train_dataset = raw_dataset.map(
        preprocess_record,
        remove_columns=raw_dataset.column_names,
    )

    use_bf16 = torch.cuda.is_available() and torch.cuda.is_bf16_supported()
    use_fp16 = torch.cuda.is_available() and not use_bf16

    training_args = TrainingArguments(
        output_dir=str(output_dir),
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
        seed=config.seed,
        bf16=use_bf16,
        fp16=use_fp16,
        remove_unused_columns=False,
    )

    trainer = RewardWeightedTrainer(
        model=model,
        args=training_args,
        train_dataset=train_dataset,
        processing_class=tokenizer,
        data_collator=default_data_collator,
    )

    train_result = trainer.train()
    trainer.save_model(str(output_dir))
    tokenizer.save_pretrained(str(output_dir))
    output_volume.commit()

    selected_rewards = [record["reward"] for record in selected_records]
    summary = {
        "output_dir": str(output_dir),
        "selected_rollouts_path": str(selected_rollouts_path),
        "scored_rollouts_path": config.scored_rollouts_path,
        "loaded_records": selection_stats["loaded_records"],
        "grouped_rows": selection_stats["grouped_rows"],
        "selected_candidates": selection_stats["selected_records"],
        "dropped_missing_fields": selection_stats["dropped_missing_fields"],
        "dropped_bad_reward": selection_stats["dropped_bad_reward"],
        "dropped_incorrect": selection_stats["dropped_incorrect"],
        "dropped_below_reward": selection_stats["dropped_below_reward"],
        "avg_selected_reward": float(sum(selected_rewards) / len(selected_rewards)),
        "best_selected_reward": float(max(selected_rewards)),
        "train_loss": float(train_result.training_loss),
    }
    return summary


@app.local_entrypoint()
def main(
    scored_rollouts_path: str = str(DEFAULT_SCORED_ROLLOUTS_PATH),
    model_name_or_path: str = DEFAULT_BASE_MODEL,
    output_subdir: str = DEFAULT_OUTPUT_SUBDIR,
    max_records: int = 0,
    require_all_tests_pass: bool = True,
    top_candidates_per_row: int = 1,
    min_reward_for_training: float = 0.0,
    max_seq_length: int = 2048,
    num_train_epochs: int = 1,
    per_device_train_batch_size: int = 1,
    gradient_accumulation_steps: int = 16,
    learning_rate: float = 1e-5,
    weight_decay: float = 0.01,
    warmup_ratio: float = 0.03,
    logging_steps: int = 10,
    save_steps: int = 100,
    seed: int = 42,
) -> None:
    if "/path/to/local/" in scored_rollouts_path:
        raise ValueError(
            "Replace the placeholder --scored-rollouts-path with a real file path, "
            "for example: src/codeforces-approach/data/scored_rollouts.jsonl"
        )
    if not Path(scored_rollouts_path).exists():
        raise FileNotFoundError(
            f"Scored rollouts file not found on local machine: {scored_rollouts_path}\n"
            "Generate it locally first, then rerun modal."
        )
    config = RLConfig(
        scored_rollouts_path=map_local_path_to_remote(scored_rollouts_path),
        model_name_or_path=map_local_path_to_remote(model_name_or_path),
        output_subdir=output_subdir,
        max_records=max_records,
        require_all_tests_pass=require_all_tests_pass,
        top_candidates_per_row=top_candidates_per_row,
        min_reward_for_training=min_reward_for_training,
        max_seq_length=max_seq_length,
        num_train_epochs=num_train_epochs,
        per_device_train_batch_size=per_device_train_batch_size,
        gradient_accumulation_steps=gradient_accumulation_steps,
        learning_rate=learning_rate,
        weight_decay=weight_decay,
        warmup_ratio=warmup_ratio,
        logging_steps=logging_steps,
        save_steps=save_steps,
        seed=seed,
    )
    result = run_offline_rl.remote(asdict(config))
    print("Offline RL complete")
    for key, value in result.items():
        print(f"{key}: {value}")
