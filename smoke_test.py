"""Smoke test: load one example from sc_train.parquet and ask the base Qwen model to generate assembly.

Usage:
    pip install transformers torch pandas pyarrow
    python smoke_test.py

This tests whether Qwen2.5-Coder-7B-Instruct can generate compilable AT&T assembly
without any SFT pre-training. The key question: is reward=0 in exp1 because the base
model doesn't know the right format, or for some other reason?
"""
import subprocess, tempfile, os, sys
from pathlib import Path

import pandas as pd
from transformers import AutoTokenizer, AutoModelForCausalLM
import torch

PARQUET = Path(__file__).parent / "qwen-debug-rl/2-rl-model/data/supercoder_train.parquet"
MODEL   = "Qwen/Qwen2.5-Coder-7B-Instruct"

# ── 1. Load one training example ────────────────────────────────────────────
df = pd.read_parquet(PARQUET)
row = df.iloc[0]

# The parquet stores chat messages in 'prompt' column (list of dicts)
prompt_messages = row["prompt"]
print("=== PROMPT MESSAGES ===")
for m in prompt_messages:
    print(f"[{m['role']}]: {m['content'][:300]}...")
print()

# ── 2. Load tokenizer + model ───────────────────────────────────────────────
print(f"Loading {MODEL} ...")
tokenizer = AutoTokenizer.from_pretrained(MODEL, trust_remote_code=True)
model = AutoModelForCausalLM.from_pretrained(
    MODEL,
    torch_dtype=torch.bfloat16,
    device_map="auto",
    trust_remote_code=True,
)
model.eval()

# ── 3. Format prompt and generate ───────────────────────────────────────────
text = tokenizer.apply_chat_template(
    prompt_messages,
    tokenize=False,
    add_generation_prompt=True,
)
inputs = tokenizer(text, return_tensors="pt").to(model.device)

print("Generating response (max 1000 new tokens) ...")
with torch.no_grad():
    output_ids = model.generate(
        **inputs,
        max_new_tokens=1000,
        temperature=0.5,
        do_sample=True,
        eos_token_id=[151643, 151645],  # <|endoftext|> and <|im_end|>
        pad_token_id=151643,
    )

response_ids = output_ids[0][inputs["input_ids"].shape[1]:]
response = tokenizer.decode(response_ids, skip_special_tokens=True)

print("=== MODEL RESPONSE ===")
print(response[:2000])
print()

# ── 4. Try to compile the assembly ──────────────────────────────────────────
asm_raw = response
if "```assembly" in asm_raw:
    asm_raw = asm_raw.split("```assembly")[1].split("```")[0]
elif "```" in asm_raw:
    asm_raw = asm_raw.split("```")[1].split("```")[0]

print("=== EXTRACTED ASSEMBLY (first 500 chars) ===")
print(asm_raw[:500])
print()

with tempfile.TemporaryDirectory() as tmpdir:
    asm_file = os.path.join(tmpdir, "solution.s")
    bin_file = os.path.join(tmpdir, "solution")

    with open(asm_file, "w") as f:
        f.write(asm_raw)

    result = subprocess.run(
        ["gcc", asm_file, "-o", bin_file, "-lm"],
        capture_output=True, text=True, timeout=30
    )

    if result.returncode == 0:
        print("✓ GCC COMPILATION SUCCEEDED")
        print("The model CAN generate compilable assembly. Reward=0 is from failing tests or speedup<=1.")
    else:
        print("✗ GCC COMPILATION FAILED")
        print("STDERR:", result.stderr[:500])
        print()
        print("This confirms: base Qwen cannot format valid x86-64 AT&T assembly.")
        print("The paper's SFT stage is needed to teach the format before RL.")
