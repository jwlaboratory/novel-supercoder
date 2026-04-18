"""Convert a verl FSDP actor checkpoint → HuggingFace model directory.

The merged HF model is saved back into the same Modal volume so exp4 can load it.

Usage:
    modal run merge_checkpoint.py
    modal run merge_checkpoint.py --step 258
    modal run merge_checkpoint.py --exp exp3-qwen-debug --step 258
"""
from __future__ import annotations
from pathlib import Path
import modal

MINUTES       = 60
HERE          = Path(__file__).resolve().parent
VERL_DIR      = (HERE / "../../SuperCoder-reference/verl").resolve()
BASE_MODEL    = "Qwen/Qwen2.5-Coder-7B-Instruct"

app             = modal.App("merge-checkpoint")
hf_secret       = modal.Secret.from_name("huggingface", required_keys=["HF_TOKEN"])
checkpoints_vol = modal.Volume.from_name("debug-rl-checkpoints", create_if_missing=False)
hf_cache_vol    = modal.Volume.from_name("huggingface-cache",    create_if_missing=True)

image = (
    modal.Image.debian_slim(python_version="3.11")
    .pip_install(
        "torch==2.6.0",
        "transformers>=4.40,<5",
        "safetensors",
        "numpy",
        "huggingface_hub",
    )
    .add_local_file(str(VERL_DIR / "scripts/model_merger.py"), "/model_merger.py")
)


@app.function(
    image=image,
    cpu=8,
    memory=65536,   # 64 GB — peak usage: 4 shards × ~7B bfloat16 loaded in parallel
    timeout=60 * MINUTES,
    secrets=[hf_secret],
    volumes={
        "/checkpoints":             checkpoints_vol,
        "/root/.cache/huggingface": hf_cache_vol,
    },
)
def merge(exp: str = "exp3-qwen-debug", step: int = 258) -> str:
    import os, sys, subprocess

    step_dir  = f"/checkpoints/{exp}/global_step_{step}"
    actor_dir = f"{step_dir}/actor"
    hf_dir    = f"{step_dir}/hf_model"

    # Sanity check
    if not os.path.isdir(actor_dir):
        raise FileNotFoundError(
            f"Actor checkpoint not found at {actor_dir}\n"
            f"Contents of {step_dir}: {os.listdir(step_dir) if os.path.isdir(step_dir) else 'MISSING'}"
        )

    pt_files = [f for f in os.listdir(actor_dir) if f.endswith(".pt")]
    print(f"Found {len(pt_files)} shard file(s) in {actor_dir}:")
    for f in sorted(pt_files):
        size_gb = os.path.getsize(os.path.join(actor_dir, f)) / 1e9
        print(f"  {f}  ({size_gb:.1f} GB)")

    print(f"\nMerging → {hf_dir}")
    subprocess.run(
        [
            sys.executable, "/model_merger.py",
            "--backend",      "fsdp",
            "--hf_model_path", BASE_MODEL,
            "--local_dir",     actor_dir,
            "--target_dir",    hf_dir,
        ],
        check=True,
    )

    merged_files = os.listdir(hf_dir)
    print(f"\nMerged model files: {merged_files}")

    checkpoints_vol.commit()
    print(f"\nCommitted volume. HF model at: {hf_dir}")
    return hf_dir


@app.local_entrypoint()
def main(exp: str = "exp3-qwen-debug", step: int = 258) -> None:
    hf_path = merge.remote(exp=exp, step=step)
    print(f"\n{'='*60}")
    print(f"Merged model saved to Modal volume at:")
    print(f"  {hf_path}")
    print(f"\nRun exp4 with:")
    print(f"  modal run 4-train-debug-supercoder/modal_train.py --model-path {hf_path}")
    print(f"{'='*60}")
