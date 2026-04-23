"""Modal smoke test — generate assembly with base Qwen model and run reward function.

Diagnoses where reward=0 comes from:
  - GCC compile fail?
  - Tests fail?
  - Compiles and passes tests but speedup <= 1.0?

Usage:
    cd /Users/shreybirmiwal/projects/jwlabs/novel-supercoder/qwen-debug-rl/2-rl-model
    modal run smoke_test_modal.py
    modal run smoke_test_modal.py --n-samples 10
"""
from __future__ import annotations
import os
from pathlib import Path
import modal

MINUTES = 60
HERE    = Path(__file__).resolve().parent
SHARED  = (HERE / "shared").resolve()
VERL_DIR = (HERE / "../../SuperCoder-reference/verl").resolve()

BASE_MODEL = "Qwen/Qwen2.5-Coder-7B-Instruct"

app = modal.App("smoke-test-qwen-assembly")
hf_secret       = modal.Secret.from_name("huggingface", required_keys=["HF_TOKEN"])
data_vol        = modal.Volume.from_name("debug-rl-data",        create_if_missing=False)
hf_cache_vol    = modal.Volume.from_name("huggingface-cache",    create_if_missing=True)

image = (
    modal.Image.from_registry("nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.11")
    .entrypoint([])
    .apt_install("hyperfine", "gcc")
    .run_commands(
        "pip install torch==2.6.0 --index-url https://download.pytorch.org/whl/cu124",
        "pip install transformers>=4.40 pandas pyarrow psutil numpy accelerate",
    )
    .add_local_file(str(SHARED / "reward.py"), "/reward.py")
)


@app.function(
    image=image,
    gpu="h100:1",
    timeout=30 * MINUTES,
    secrets=[hf_secret],
    volumes={
        "/data":                    data_vol,
        "/root/.cache/huggingface": hf_cache_vol,
    },
)
def run_smoke_test(n_samples: int = 5) -> None:
    import sys
    sys.path.insert(0, "/")
    import pandas as pd
    import torch
    from transformers import AutoTokenizer, AutoModelForCausalLM
    from reward import compute_score, check_correctness

    # ── Load parquet ──────────────────────────────────────────────────────────
    parquet_path = "/data/sc_train.parquet"
    print(f"Loading {parquet_path} ...")
    df = pd.read_parquet(parquet_path)
    print(f"Dataset size: {len(df)} rows")
    print(f"Columns: {list(df.columns)}")
    print()

    samples = df.sample(n=min(n_samples, len(df)), random_state=42)

    # ── Load model ────────────────────────────────────────────────────────────
    print(f"Loading {BASE_MODEL} ...")
    tokenizer = AutoTokenizer.from_pretrained(BASE_MODEL, trust_remote_code=True)
    model = AutoModelForCausalLM.from_pretrained(
        BASE_MODEL,
        torch_dtype=torch.bfloat16,
        device_map="auto",
        trust_remote_code=True,
    )
    model.eval()
    print("Model loaded.\n")

    compile_ok = 0
    tests_ok   = 0
    reward_ok  = 0

    for idx, (_, row) in enumerate(samples.iterrows()):
        print(f"{'='*60}")
        print(f"Sample {idx+1}/{n_samples}")

        prompt_messages = row["prompt"]
        extra_info      = row["extra_info"] if "extra_info" in row else None
        ground_truth    = row["reward"]     if "reward"     in row else ""

        # Normalize: parquet via pandas returns numpy array, verl uses Arrow (proper list)
        import numpy as np
        if isinstance(prompt_messages, np.ndarray):
            prompt_messages = prompt_messages.tolist()
        # Each element might itself be a dict or a list-of-one-dict
        if isinstance(prompt_messages, list) and len(prompt_messages) == 1 and not isinstance(prompt_messages[0], dict):
            prompt_messages = list(prompt_messages[0])

        user_msg = next((m["content"] for m in prompt_messages if m["role"] == "user"), str(prompt_messages))
        print(f"Prompt (first 300 chars): {user_msg[:300]}")
        print()

        # Generate — apply chat template exactly as verl does
        text = tokenizer.apply_chat_template(
            prompt_messages, tokenize=False, add_generation_prompt=True
        )

        inputs = tokenizer(text, return_tensors="pt").to(model.device)
        prompt_len = inputs["input_ids"].shape[1]
        print(f"Prompt tokens: {prompt_len}")

        with torch.no_grad():
            output_ids = model.generate(
                **inputs,
                max_new_tokens=2000,
                temperature=0.5,
                do_sample=True,
                eos_token_id=[151643, 151645],
                pad_token_id=151643,
            )

        response_ids = output_ids[0][prompt_len:]
        response = tokenizer.decode(response_ids, skip_special_tokens=True)
        print(f"Response tokens: {len(response_ids)}")
        print(f"Response (first 500 chars):\n{response[:500]}")
        print()

        # ── Run correctness check ──────────────────────────────────────────
        if extra_info is None:
            print("WARNING: no extra_info in row, skipping reward")
            continue

        correctness, binary = check_correctness(response, ground_truth, extra_info)
        print(f"Correctness result: {correctness}")

        if correctness == -1:
            print(">>> COMPILE FAILED")
        elif correctness == -0.5:
            print(">>> RUNTIME ERROR on a test")
        elif correctness < 1.0:
            print(f">>> PARTIAL TEST PASS: {correctness:.0%}")
            compile_ok += 1
        else:
            print(">>> ALL TESTS PASSED — running speedup benchmark ...")
            compile_ok += 1
            tests_ok   += 1

            reward = compute_score(None, response, ground_truth, extra_info)
            print(f">>> REWARD: {reward:.4f}")
            if reward > 0:
                reward_ok += 1
            else:
                print("    (speedup <= 1.0 — solution not faster than unoptimized)")

        print()

    print(f"{'='*60}")
    print(f"SUMMARY ({n_samples} samples):")
    print(f"  Compile OK : {compile_ok}/{n_samples} ({compile_ok/n_samples:.0%})")
    print(f"  Tests OK   : {tests_ok}/{n_samples}   ({tests_ok/n_samples:.0%})")
    print(f"  Reward > 0 : {reward_ok}/{n_samples}  ({reward_ok/n_samples:.0%})")
    print()
    if compile_ok / n_samples < 0.5:
        print("DIAGNOSIS: Low compile rate — model doesn't know the assembly format.")
        print("  → SFT pre-training likely needed before RL.")
    elif tests_ok / n_samples < 0.5:
        print("DIAGNOSIS: Compiles OK but tests fail — model generates wrong output.")
        print("  → RL training should eventually fix this (reward signal is reachable).")
    else:
        print("DIAGNOSIS: Compiles and passes tests but speedup <= 1.0.")
        print("  → Model generates correct but unoptimized code. RL will push it to optimize.")


@app.local_entrypoint()
def main(n_samples: int = 5) -> None:
    run_smoke_test.remote(n_samples=n_samples)
