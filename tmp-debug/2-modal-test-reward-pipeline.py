"""Step 2 — Modal: Test the reward pipeline WITHOUT the LLM.

We take the unoptimized_assembly from a few parquet rows and run it through
check_correctness (compile + I/O test) to verify the reward infrastructure
works independently of the model.

Failure modes we're diagnosing:
  A) unoptimized assembly doesn't compile on Linux x86-64
     → reward.py or data is broken
  B) compiled binary produces wrong output vs expected outputs
     → test cases are broken
  C) everything works → pipeline is fine, the LLM just generates bad code

Usage:
    cd /Users/shreybirmiwal/projects/jwlabs/novel-supercoder/qwen-debug-rl/2-rl-model
    modal run ../../tmp-debug/2-modal-test-reward-pipeline.py
    modal run ../../tmp-debug/2-modal-test-reward-pipeline.py --n-samples 20
"""
from __future__ import annotations
import os
from pathlib import Path
import modal

MINUTES = 60
HERE   = Path(__file__).resolve().parent
REPO   = HERE.parent
SHARED = REPO / "qwen-debug-rl/2-rl-model/shared"

app = modal.App("debug-reward-pipeline")

data_vol = modal.Volume.from_name("debug-rl-data", create_if_missing=False)

image = (
    modal.Image.from_registry("nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.11")
    .entrypoint([])
    .apt_install("hyperfine", "gcc", "binutils")
    .run_commands(
        "pip install pandas pyarrow psutil numpy",
        "pip install torch==2.6.0 --index-url https://download.pytorch.org/whl/cu124",
    )
    .add_local_file(str(SHARED / "reward.py"), "/reward.py")
)


@app.function(
    image=image,
    cpu=4,
    memory=4096,
    timeout=20 * MINUTES,
    volumes={"/data": data_vol},
)
def test_reward_pipeline(n_samples: int = 10) -> None:
    import sys
    sys.path.insert(0, "/")
    import pandas as pd
    from reward import check_correctness

    results = {}

    for dataset_name, parquet_path in [
        ("supercoder", "/data/sc_train.parquet"),
        ("debug",      "/data/train.parquet"),
    ]:
        print(f"\n{'='*60}")
        print(f"  Dataset: {dataset_name}  ({parquet_path})")
        print(f"{'='*60}")

        try:
            df = pd.read_parquet(parquet_path)
        except Exception as e:
            print(f"  ERROR loading parquet: {e}")
            continue

        print(f"  {len(df)} rows loaded")
        samples = df.sample(n=min(n_samples, len(df)), random_state=42)

        compile_ok = 0
        tests_ok   = 0
        binary_ok  = 0
        errors = []

        for i, (_, row) in enumerate(samples.iterrows()):
            ei = row.get("extra_info", {})
            if not isinstance(ei, dict):
                errors.append(f"  row {i}: extra_info is {type(ei)}")
                continue

            unopt_asm = ei.get("unoptimized_assembly", "")
            inputs    = ei.get("inputs", [])
            outputs   = ei.get("outputs", [])
            binary    = ei.get("unoptimized_compiled", b"")

            print(f"\n  [{i+1}/{n_samples}] inputs={len(inputs)}, "
                  f"asm_len={len(unopt_asm)}, binary_len={len(binary) if isinstance(binary, (bytes,bytearray)) else 'NOT_BYTES'}")

            if not unopt_asm:
                errors.append(f"  row {i}: unoptimized_assembly is empty")
                continue

            # Test check_correctness on the unoptimized assembly itself
            score, bin_data = check_correctness(unopt_asm, "", ei)
            print(f"  check_correctness(unopt_asm) → score={score}, binary={'yes' if bin_data else 'None'}")

            if score == -1:
                errors.append(f"  row {i}: COMPILE FAIL on unoptimized_assembly")
            elif score == -0.5:
                errors.append(f"  row {i}: RUNTIME ERROR on unoptimized_assembly")
                compile_ok += 1
            elif score < 1.0:
                errors.append(f"  row {i}: PARTIAL TESTS ({score:.0%}) on unoptimized_assembly")
                compile_ok += 1
            else:
                compile_ok += 1
                tests_ok   += 1
                if bin_data:
                    binary_ok += 1

            # Also check that the precompiled binary bytes look sane
            if isinstance(binary, (bytes, bytearray)) and len(binary) > 0:
                # Check ELF magic
                if binary[:4] == b'\x7fELF':
                    print(f"  precompiled_binary: valid ELF ({len(binary)} bytes)")
                else:
                    errors.append(f"  row {i}: precompiled_binary does NOT start with ELF magic — got {binary[:8]!r}")
            else:
                errors.append(f"  row {i}: precompiled_binary is empty or wrong type ({type(binary)})")

        n = min(n_samples, len(samples))
        results[dataset_name] = {
            "n": n, "compile_ok": compile_ok,
            "tests_ok": tests_ok, "binary_ok": binary_ok,
        }

        print(f"\n  SUMMARY for {dataset_name}:")
        print(f"    Compile OK : {compile_ok}/{n}")
        print(f"    All tests  : {tests_ok}/{n}")
        print(f"    Binary OK  : {binary_ok}/{n}")
        if errors:
            print(f"  ERRORS ({len(errors)}):")
            for e in errors[:20]:
                print(f"    {e}")

    # Final diagnosis
    print(f"\n{'='*60}")
    print("DIAGNOSIS")
    print(f"{'='*60}")
    for name, r in results.items():
        n = r["n"]
        if r["compile_ok"] < n * 0.8:
            print(f"  [{name}] BROKEN PIPELINE: unoptimized assembly fails to compile ({r['compile_ok']}/{n})")
            print(f"    → check GCC version / assembly syntax / header flags")
        elif r["tests_ok"] < n * 0.8:
            print(f"  [{name}] TEST CASES BROKEN: compiles but wrong output ({r['tests_ok']}/{n} pass all tests)")
            print(f"    → check inputs/outputs in parquet for encoding issues (trailing newlines, etc.)")
        elif r["binary_ok"] < n * 0.8:
            print(f"  [{name}] BINARY ISSUE: tests pass but no binary returned ({r['binary_ok']}/{n})")
        else:
            print(f"  [{name}] Pipeline OK — unoptimized assembly compiles, passes tests, binary valid.")
            print(f"    → Reward=0 must come from LLM generating bad assembly (expected for base model).")
            print(f"    → Run smoke_test_modal.py to see what the LLM actually generates.")


@app.local_entrypoint()
def main(n_samples: int = 10) -> None:
    test_reward_pipeline.remote(n_samples=n_samples)
