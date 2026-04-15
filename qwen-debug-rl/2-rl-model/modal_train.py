"""Modal RL training: teach a model to debug broken assembly (verl PPO).

Usage
-----
    modal run modal_train.py --mode qwen-debug
    modal run modal_train.py --mode qwen-supercoder-debug
    modal run modal_train.py --mode qwen-debug-supercoder   # prints TO BE IMPLEMENTED

GPU override (default: a100-40gb:4)
    MODAL_TRAIN_GPU="h100:4" modal run modal_train.py --mode qwen-debug

Checkpoints are saved to Modal Volume "debug-rl-checkpoints".
Retrieve with: modal volume get debug-rl-checkpoints <experiment-name>/ ./checkpoints/
"""
from __future__ import annotations

import os
import subprocess
import sys
from pathlib import Path

import modal
from huggingface_hub import HfApi
from huggingface_hub.errors import RepositoryNotFoundError

MINUTES = 60
SCRIPT_DIR = Path(__file__).resolve().parent
VERL_DIR = (SCRIPT_DIR / "../../SuperCoder-reference/verl").resolve()

app = modal.App("qwen-debug-rl-train")
hf_secret = modal.Secret.from_name("huggingface", required_keys=["HF_TOKEN"])

checkpoints_vol = modal.Volume.from_name("debug-rl-checkpoints", create_if_missing=True)
data_vol        = modal.Volume.from_name("debug-rl-data",        create_if_missing=True)
hf_cache_vol    = modal.Volume.from_name("huggingface-cache",    create_if_missing=True)
vllm_cache_vol  = modal.Volume.from_name("vllm-cache",           create_if_missing=True)

DEFAULT_GPU = os.environ.get("MODAL_TRAIN_GPU", "a100-80gb:4")

# ---------------------------------------------------------------------------
# Training image
#
# We only need vllm for rollout (no sglang). Keeping torch==2.6.0 throughout
# avoids the ABI break that sglang causes by upgrading torch to 2.9.
#
#   1. torch 2.6.0 + ray + misc
#   2. flash-attn (compiled against torch 2.6.0)
#   3. verl[vllm] editable  (brings vllm<=0.8.3, compatible w/ torch 2.6.0)
# ---------------------------------------------------------------------------
train_image = (
    modal.Image.from_registry(
        "nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.11"
    )
    .entrypoint([])
    .add_local_dir(str(VERL_DIR), "/verl_src", copy=True)
    .run_commands(
        "pip install torch==2.6.0 torchaudio==2.6.0 torchdata==0.11.0 torchvision==0.21.0"
        " tabulate fire 'ray[default]' psutil cachetools",
        "pip install wheel && pip install flash-attn==2.7.4.post1 --no-build-isolation",
        "pip install -e '/verl_src[vllm]'",
        "pip install 'transformers>=4.40,<5'",
    )
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
    .add_local_file(str(SCRIPT_DIR / "reward_score.py"), "/reward_score.py")
)

# ---------------------------------------------------------------------------
# Model paths per experiment
# ---------------------------------------------------------------------------
MODEL_PATHS = {
    "qwen-debug":            "Qwen/Qwen2.5-Coder-7B-Instruct",
    "qwen-supercoder-debug": "random1123anonymized/supercoder",
}

EXPERIMENT_NAMES = {
    "qwen-debug":            "qwen25-coder-7b-debug",
    "qwen-supercoder-debug": "supercoder-7b-debug",
}


# ---------------------------------------------------------------------------
# Training function (runs on Modal GPU)
# ---------------------------------------------------------------------------
@app.function(
    image=train_image,
    gpu=DEFAULT_GPU,
    timeout=24 * 60 * MINUTES,
    secrets=[hf_secret],
    volumes={
        "/data":                      data_vol,
        "/checkpoints":               checkpoints_vol,
        "/root/.cache/huggingface":   hf_cache_vol,
        "/root/.cache/vllm":          vllm_cache_vol,
    },
)
def train(mode: str) -> None:
    model_path      = MODEL_PATHS[mode]
    experiment_name = EXPERIMENT_NAMES[mode]
    hf_token = os.environ.get("HF_TOKEN", "")

    # Fast-fail with a clear auth/config message before launching verl.
    try:
        HfApi().model_info(model_path, token=hf_token or None)
    except RepositoryNotFoundError as exc:
        raise RuntimeError(
            f"Cannot access HF model '{model_path}'. "
            "Make sure the repo id is correct and that Modal secret "
            "'huggingface' contains a valid HF_TOKEN with access."
        ) from exc

    cmd = [
        "python3", "-m", "verl.trainer.main_ppo",
        "algorithm.adv_estimator=gae",
        "data.train_files=/data/train.parquet",
        "data.val_files=/data/val.parquet",
        "data.train_batch_size=16",
        "data.max_prompt_length=3000",
        "data.max_response_length=2000",
        "data.filter_overlong_prompts=True",
        "data.truncation=error",
        f"actor_rollout_ref.model.path={model_path}",
        "actor_rollout_ref.model.enable_gradient_checkpointing=True",
        "actor_rollout_ref.model.use_remove_padding=True",
        "actor_rollout_ref.actor.optim.lr=1e-6",
        "actor_rollout_ref.actor.ppo_mini_batch_size=16",
        "actor_rollout_ref.actor.ppo_micro_batch_size_per_gpu=1",
        "actor_rollout_ref.actor.fsdp_config.param_offload=False",
        "actor_rollout_ref.actor.fsdp_config.optimizer_offload=False",
        "actor_rollout_ref.actor.use_kl_loss=False",
        "actor_rollout_ref.rollout.log_prob_micro_batch_size_per_gpu=1",
        "actor_rollout_ref.rollout.tensor_model_parallel_size=1",
        "actor_rollout_ref.rollout.temperature=0.5",
        "actor_rollout_ref.rollout.name=vllm",
        "actor_rollout_ref.rollout.gpu_memory_utilization=0.6",
        "critic.optim.lr=1e-5",
        f"critic.model.path={model_path}",
        "critic.model.use_remove_padding=True",
        "critic.model.enable_gradient_checkpointing=True",
        "critic.ppo_micro_batch_size_per_gpu=2",
        "critic.model.fsdp_config.param_offload=False",
        "critic.model.fsdp_config.optimizer_offload=False",
        "algorithm.use_kl_in_reward=False",
        "trainer.critic_warmup=0",
        "trainer.logger=['console']",
        "trainer.project_name=qwen-debug-rl",
        f"trainer.experiment_name={experiment_name}",
        "trainer.n_gpus_per_node=4",
        "trainer.nnodes=1",
        "trainer.save_freq=100",
        "trainer.test_freq=100",
        "trainer.total_epochs=1",
        f"trainer.default_local_dir=/checkpoints/{experiment_name}",
        "custom_reward_function.path=/reward_score.py",
        "custom_reward_function.name=compute_score",
    ]

    print(f"[modal_train] mode={mode}  model={model_path}")
    print(f"[modal_train] checkpoints → /checkpoints/{experiment_name}")
    print(f"[modal_train] cmd: {' '.join(cmd)}", flush=True)

    subprocess.run(cmd, check=True)

    checkpoints_vol.commit()
    print("[modal_train] Done.")


# ---------------------------------------------------------------------------
# Local entrypoint
# ---------------------------------------------------------------------------
@app.local_entrypoint()
def main(mode: str = "qwen-debug") -> None:
    if mode == "qwen-debug-supercoder":
        print("TO BE IMPLEMENTED")
        print()
        print("Plan: run --qwen-debug first to get a debug checkpoint,")
        print("then run a generation RL pass on top of that checkpoint")
        print("(needs supercoder-style train/val data, not just fails data).")
        return

    if mode not in MODEL_PATHS:
        valid = list(MODEL_PATHS.keys()) + ["qwen-debug-supercoder"]
        print(f"ERROR: --mode must be one of: {valid}", file=sys.stderr)
        sys.exit(1)

    # Generate parquets locally if missing
    train_parquet = SCRIPT_DIR / "train.parquet"
    val_parquet   = SCRIPT_DIR / "val.parquet"

    if not train_parquet.exists():
        print("train.parquet missing — generating...")
        subprocess.run(
            ["uv", "run", "python", "convert_to_parquet.py", "--split", "train"],
            cwd=SCRIPT_DIR, check=True,
        )

    if not val_parquet.exists():
        print("val.parquet missing — generating...")
        subprocess.run(
            [
                "uv", "run", "python", "convert_to_parquet.py",
                "--split", "val",
                "--input-csv", "supercoder_val_fails.csv",
            ],
            cwd=SCRIPT_DIR, check=True,
        )

    # Upload parquets to Modal Volume
    print("Uploading parquets to Modal volume 'debug-rl-data'...")
    with data_vol.batch_upload(force=True) as upload:
        upload.put_file(str(train_parquet), "train.parquet")
        upload.put_file(str(val_parquet),   "val.parquet")
    print("Upload done.")

    print(f"\nLaunching Modal training: mode={mode}  gpu={DEFAULT_GPU}")
    train.remote(mode)
