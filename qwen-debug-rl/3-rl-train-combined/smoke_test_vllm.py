"""Smoke test using vllm (same as paper) at temperature=0.5.

The previous smoke test used HF model.generate() and got 0% compile.
This test uses vllm exactly as the paper does to see if we get ~78% compile.

Usage:
    cd qwen-debug-rl/2-rl-model
    modal run smoke_test_vllm.py --n-samples 20
"""
from __future__ import annotations
from pathlib import Path
import modal

MINUTES  = 60
HERE     = Path(__file__).resolve().parent
SHARED   = HERE / "shared"
VERL_DIR = (HERE / "../../SuperCoder-reference/verl").resolve()

BASE_MODEL = "Qwen/Qwen2.5-Coder-7B-Instruct"

app = modal.App("smoke-test-vllm")
hf_secret      = modal.Secret.from_name("huggingface", required_keys=["HF_TOKEN"])
data_vol       = modal.Volume.from_name("debug-rl-data",     create_if_missing=False)
hf_cache_vol   = modal.Volume.from_name("huggingface-cache", create_if_missing=True)
vllm_cache_vol = modal.Volume.from_name("vllm-cache",        create_if_missing=True)

# Reuse the exact same image as training so vllm/transformers versions match
image = (
    modal.Image.from_registry("nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.11")
    .entrypoint([])
    .apt_install("hyperfine")
    .add_local_dir(str(VERL_DIR), "/verl_src", copy=True)
    .run_commands(
        "pip install torch==2.6.0 torchaudio==2.6.0 torchdata==0.11.0 torchvision==0.21.0"
        " tabulate fire 'ray[default]' psutil cachetools numpy pandas pyarrow",
        "pip install wheel && pip install flash-attn==2.7.4.post1 --no-build-isolation",
        "pip install -e '/verl_src[vllm]'",
        "pip install 'transformers>=4.40,<5'",
    )
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
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
        "/root/.cache/vllm":        vllm_cache_vol,
    },
)
def run_smoke_test(n_samples: int = 20) -> None:
    import sys
    sys.path.insert(0, "/")

    import pandas as pd
    import numpy as np
    import vllm
    from transformers import AutoTokenizer
    from reward import check_correctness

    print(f"vllm version: {vllm.__version__}")

    # ── Load parquet ─────────────────────────────────────────────────────────
    df = pd.read_parquet("/data/sc_train.parquet")
    samples = df.sample(n=min(n_samples, len(df)), random_state=42)
    print(f"Loaded {len(samples)} samples\n")

    # ── Load vllm (same settings as old experiment) ───────────────────────────
    tokenizer = AutoTokenizer.from_pretrained(BASE_MODEL, trust_remote_code=True)
    llm = vllm.LLM(
        model=BASE_MODEL,
        max_model_len=4096,   # same as verl: prompt(2000)+response(2000)
        gpu_memory_utilization=0.85,
    )
    # Paper: temperature=0.5, max_tokens=2000
    sampling_params = vllm.SamplingParams(temperature=0.5, max_tokens=2000, n=1)

    # ── Build prompts ────────────────────────────────────────────────────────
    prompts = []
    rows_list = []
    for _, row in samples.iterrows():
        msgs = row["prompt"]
        if isinstance(msgs, np.ndarray):
            msgs = msgs.tolist()
        text = tokenizer.apply_chat_template(msgs, tokenize=False, add_generation_prompt=True)
        prompts.append(text)
        rows_list.append(row)

    # ── Generate ─────────────────────────────────────────────────────────────
    print(f"Generating {len(prompts)} responses at temperature=0.5 ...")
    outputs = llm.generate(prompts, sampling_params=sampling_params)
    print("Done.\n")

    compile_ok = 0
    tests_ok   = 0

    for i, (output, row) in enumerate(zip(outputs, rows_list)):
        raw = output.outputs[0].text
        response_tokens = len(output.outputs[0].token_ids)

        # Extract assembly (same logic as reward.py)
        asm = raw
        if "```assembly" in asm:
            asm = asm[asm.rfind("```assembly") + len("```assembly"):]
        if "```" in asm:
            asm = asm[:asm.rfind("```")]
        asm = asm.strip() + "\n"

        extra_info = row["extra_info"]
        ground_truth = row["reward_model"].get("ground_truth", "") if isinstance(row["reward_model"], dict) else ""

        correctness, binary = check_correctness(asm, ground_truth, extra_info)

        compiled = correctness != -1
        tests_pass = correctness == 1.0

        if compiled:
            compile_ok += 1
        if tests_pass:
            tests_ok += 1

        print(f"[{i+1:2d}/{n_samples}] tokens={response_tokens:4d}  "
              f"compile={'OK' if compiled else 'FAIL'}  "
              f"tests={'PASS' if tests_pass else 'FAIL'}  "
              f"  first_line={repr(asm.split(chr(10))[0][:50])}")

    print()
    print(f"{'='*50}")
    print(f"SUMMARY ({n_samples} samples, temperature=0.5, vllm {vllm.__version__}):")
    print(f"  Compile OK : {compile_ok}/{n_samples} ({compile_ok/n_samples:.0%})")
    print(f"  Tests OK   : {tests_ok}/{n_samples}  ({tests_ok/n_samples:.0%})")
    print()
    if compile_ok / n_samples > 0.5:
        print("=> Base model CAN generate compilable assembly at temp=0.5.")
        print("   The HF model.generate() smoke test was misleading.")
        print("   RL training with verl/vllm should work.")
    else:
        print("=> Still getting low compile rate — issue is NOT just the inference stack.")


@app.local_entrypoint()
def main(n_samples: int = 20) -> None:
    run_smoke_test.remote(n_samples=n_samples)
