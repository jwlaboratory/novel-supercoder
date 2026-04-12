#!/usr/bin/env python3
from __future__ import annotations

import argparse
import shlex
from pathlib import Path

import modal

app = modal.App("run-their-paper-exactly-train")

ROOT = Path(__file__).resolve().parents[4]
SUPERCODER_DIR = ROOT / "SuperCoder"

image = (
    modal.Image.from_registry("nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.10")
    .entrypoint([])
    .apt_install("git", "build-essential", "gcc", "g++", "hyperfine")
    .pip_install("uv")
)


@app.function(
    image=image,
    gpu="A100-80GB:4",
    cpu=32,
    memory=262144,
    timeout=60 * 60 * 24,
)
def run_training(
    train_parquet: str,
    val_parquet: str,
    reward_path: str,
    experiment_name: str,
    project_name: str,
    extra_args: str,
) -> None:
    import os
    import subprocess

    if not SUPERCODER_DIR.exists():
        raise RuntimeError(f"SuperCoder path not found at {SUPERCODER_DIR}")

    os.chdir(str(SUPERCODER_DIR))

    # Install SuperCoder + VERL runtime in container.
    subprocess.run(["uv", "sync"], check=False)
    subprocess.run(["uv", "pip", "install", "-e", "./verl"], check=True)
    subprocess.run(
        ["uv", "pip", "install", "torch", "datasets", "numpy", "ray", "wandb", "vllm", "accelerate", "transformers"],
        check=True,
    )

    cmd = [
        "uv",
        "run",
        "python",
        "-m",
        "verl.trainer.main_ppo",
        "algorithm.adv_estimator=gae",
        f"data.train_files={train_parquet}",
        f"data.val_files={val_parquet}",
        "data.train_batch_size=16",
        "data.max_prompt_length=2000",
        "data.max_response_length=2000",
        "data.filter_overlong_prompts=True",
        "data.truncation=error",
        "actor_rollout_ref.model.path=Qwen/Qwen2.5-Coder-7B-Instruct",
        "actor_rollout_ref.model.enable_gradient_checkpointing=False",
        "actor_rollout_ref.actor.optim.lr=1e-6",
        "actor_rollout_ref.model.use_remove_padding=True",
        "actor_rollout_ref.actor.ppo_mini_batch_size=16",
        "actor_rollout_ref.actor.ppo_micro_batch_size_per_gpu=1",
        "actor_rollout_ref.model.enable_gradient_checkpointing=True",
        "actor_rollout_ref.actor.fsdp_config.param_offload=False",
        "actor_rollout_ref.actor.fsdp_config.optimizer_offload=False",
        "actor_rollout_ref.actor.use_kl_loss=False",
        "actor_rollout_ref.rollout.log_prob_micro_batch_size_per_gpu=1",
        "actor_rollout_ref.rollout.tensor_model_parallel_size=1",
        "actor_rollout_ref.rollout.temperature=0.5",
        "actor_rollout_ref.rollout.name=vllm",
        "actor_rollout_ref.rollout.gpu_memory_utilization=0.6",
        "critic.optim.lr=1e-5",
        "critic.model.use_remove_padding=True",
        "critic.model.path=Qwen/Qwen2.5-Coder-7B-Instruct",
        "critic.model.enable_gradient_checkpointing=True",
        "critic.ppo_micro_batch_size_per_gpu=2",
        "critic.model.fsdp_config.param_offload=False",
        "critic.model.fsdp_config.optimizer_offload=False",
        "algorithm.use_kl_in_reward=False",
        "trainer.critic_warmup=0",
        "trainer.logger=[console,wandb]",
        f"trainer.project_name={project_name}",
        f"trainer.experiment_name={experiment_name}",
        "trainer.n_gpus_per_node=4",
        "trainer.nnodes=1",
        f"custom_reward_function.path={reward_path}",
        "trainer.save_freq=100",
        "trainer.test_freq=100",
        "trainer.total_epochs=1",
    ]

    if extra_args.strip():
        cmd.extend(shlex.split(extra_args))

    print("Running:", " ".join(shlex.quote(x) for x in cmd), flush=True)
    subprocess.run(cmd, check=True)


@app.local_entrypoint()
def main(
    train_parquet: str = "llm_superoptimizer_ds_train.parquet",
    val_parquet: str = "llm_superoptimizer_ds_val.parquet",
    reward_path: str = "verl/verl/utils/reward_score/speedup_assembly_design2.py",
    experiment_name: str = "qwen25_supercoder_ppo_exact_modal",
    project_name: str = "supercoder_exact_modal",
    extra_args: str = "",
):
    run_training.remote(train_parquet, val_parquet, reward_path, experiment_name, project_name, extra_args)
