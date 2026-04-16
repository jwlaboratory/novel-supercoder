"""Step 4 — Check if debug_train.parquet has the correct fields.

The volume has both:
  - train.parquet (23MB, stale - missing unoptimized fields)
  - debug_train.parquet (97MB, possibly the correct one)

Check which file is correct and what the training scripts actually use.

Usage:
    cd /Users/shreybirmiwal/projects/jwlabs/novel-supercoder/qwen-debug-rl/2-rl-model
    modal run ../../tmp-debug/4-check-debug-train.py
"""
from __future__ import annotations
from pathlib import Path
import modal

MINUTES = 60
HERE   = Path(__file__).resolve().parent
REPO   = HERE.parent
SHARED = REPO / "qwen-debug-rl/2-rl-model/shared"

app = modal.App("debug-check-train-parquet")
data_vol = modal.Volume.from_name("debug-rl-data", create_if_missing=False)

image = (
    modal.Image.from_registry("nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.11")
    .entrypoint([])
    .apt_install("hyperfine", "gcc")
    .run_commands(
        "pip install pandas pyarrow psutil numpy",
        "pip install torch==2.6.0 --index-url https://download.pytorch.org/whl/cu124",
    )
    .add_local_file(str(SHARED / "reward.py"), "/reward.py")
)


@app.function(
    image=image, cpu=4, memory=4096, timeout=20 * MINUTES,
    volumes={"/data": data_vol},
)
def check_parquets() -> None:
    import sys, os
    sys.path.insert(0, "/")
    import pandas as pd
    from reward import check_correctness

    files_to_check = [
        "/data/train.parquet",
        "/data/debug_train.parquet",
        "/data/val.parquet",
        "/data/debug_val.parquet",
    ]

    for fpath in files_to_check:
        print(f"\n{'='*60}")
        print(f"  {fpath}  ({os.path.getsize(fpath)//1024} KB)")
        print(f"{'='*60}")

        df = pd.read_parquet(fpath)
        print(f"  Rows: {len(df)}")
        ei = df["extra_info"].iloc[0]
        print(f"  extra_info keys: {sorted(ei.keys()) if isinstance(ei, dict) else type(ei)}")

        if isinstance(ei, dict):
            unopt_asm = ei.get("unoptimized_assembly", "")
            unopt_bin = ei.get("unoptimized_compiled", b"")
            print(f"  unoptimized_assembly: {len(unopt_asm)} chars")
            print(f"  unoptimized_compiled: {len(unopt_bin) if isinstance(unopt_bin, (bytes,bytearray)) else 'not bytes'} bytes")

            if isinstance(unopt_bin, (bytes, bytearray)) and len(unopt_bin) > 4:
                elf_magic = b'\x7fELF'
                print(f"  ELF magic check: {'OK' if unopt_bin[:4] == elf_magic else 'FAIL'}")

            # If we have the fields, test compilation of stripped unopt_asm
            if unopt_asm:
                stripped = unopt_asm.replace("```assembly\n", "").replace("```", "")
                score, binary = check_correctness(stripped, "", ei)
                print(f"  check_correctness(stripped_unopt_asm) → score={score}, binary={'yes' if binary else 'None'}")
            else:
                print("  Skipping compile test — unoptimized_assembly is empty")


@app.local_entrypoint()
def main() -> None:
    check_parquets.remote()
