"""Step 3 — Modal: Deep diagnosis of the two bugs found.

Bug 1 (supercoder): Does the unoptimized assembly compile after stripping markdown fences?
  → if yes, check_correctness is fine; reward=0 is just from LLM generating bad code
  → if no, the gcc compilation itself is broken

Bug 2 (debug): Confirm that unoptimized_assembly/compiled are empty in the Modal volume
  → if empty, the Modal volume has a stale train.parquet (missing the fields added by stage 5)
  → need to re-upload local train.parquet to the volume

Usage:
    cd /Users/shreybirmiwal/projects/jwlabs/novel-supercoder/qwen-debug-rl/2-rl-model
    modal run ../../tmp-debug/3-modal-deep-diagnosis.py
"""
from __future__ import annotations
from pathlib import Path
import modal

MINUTES = 60
HERE   = Path(__file__).resolve().parent
REPO   = HERE.parent
SHARED = REPO / "qwen-debug-rl/2-rl-model/shared"

app = modal.App("debug-deep-diagnosis")
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
    image=image, cpu=4, memory=4096, timeout=20 * MINUTES,
    volumes={"/data": data_vol},
)
def deep_diagnosis(n_samples: int = 5) -> None:
    import sys, os, tempfile, subprocess
    sys.path.insert(0, "/")
    import pandas as pd
    from reward import check_correctness, compute_score

    # ─── Bug 1: Supercoder - does stripped unopt_asm compile? ─────────────────
    print("=" * 60)
    print("BUG 1 CHECK: Supercoder — compile stripped unoptimized_assembly")
    print("=" * 60)

    df_sc = pd.read_parquet("/data/sc_train.parquet")
    samples_sc = df_sc.sample(n=min(n_samples, len(df_sc)), random_state=42)

    sc_compile_ok = 0
    sc_test_ok    = 0

    for i, (_, row) in enumerate(samples_sc.iterrows()):
        ei = row["extra_info"]
        raw_asm = ei.get("unoptimized_assembly", "")
        # Strip fences the same way compute_score does
        stripped_asm = raw_asm.replace("```assembly\n", "").replace("```", "")
        inputs  = ei.get("inputs", [])
        outputs = ei.get("outputs", [])

        print(f"\n  [{i+1}] asm_len(raw)={len(raw_asm)}, asm_len(stripped)={len(stripped_asm)}")
        print(f"        inputs={len(inputs)}, outputs={len(outputs)}")
        if stripped_asm:
            print(f"        First 80 chars of stripped asm: {repr(stripped_asm[:80])}")

        # Test compile of stripped asm
        score, binary = check_correctness(stripped_asm, "", ei)
        print(f"        check_correctness(stripped_asm) → score={score}, binary={'yes' if binary else 'None'}")

        if score == -1:
            # Try to get the actual gcc error
            with tempfile.TemporaryDirectory() as td:
                asm_file = os.path.join(td, "test.s")
                bin_file = os.path.join(td, "test.bin")
                with open(asm_file, 'w') as f:
                    f.write(stripped_asm)
                result = subprocess.run(
                    ["gcc", asm_file, "-o", bin_file, "-lm"],
                    capture_output=True, text=True, timeout=30
                )
                print(f"        gcc returncode={result.returncode}")
                print(f"        gcc stderr: {result.stderr[:400]}")
        elif score < 1.0:
            print(f"        PARTIAL: {score:.0%} tests passed")
            sc_compile_ok += 1
        else:
            print(f"        ALL TESTS PASSED!")
            sc_compile_ok += 1
            sc_test_ok    += 1

    print(f"\n  SC SUMMARY: compile={sc_compile_ok}/{n_samples}, tests={sc_test_ok}/{n_samples}")
    if sc_compile_ok == 0:
        print("  → Compile is broken even for the REFERENCE (unoptimized) assembly!")
        print("  → This means reward can NEVER be nonzero — the reward pipeline is fundamentally broken.")
    elif sc_test_ok < n_samples:
        print("  → Compile works but test cases fail even for reference assembly.")
        print("  → Test cases in parquet may have encoding issues (newlines, whitespace).")
    else:
        print("  → BUG 1 CLEAR: reference assembly compiles and passes tests fine.")
        print("  → reward=0 is because the LLM generates bad/uncompilable code (expected for base model).")

    # ─── Bug 2: Debug - confirm empty fields in Modal volume ──────────────────
    print("\n" + "=" * 60)
    print("BUG 2 CHECK: Debug — are unoptimized fields empty in Modal volume?")
    print("=" * 60)

    df_debug = pd.read_parquet("/data/train.parquet")
    print(f"  Columns: {list(df_debug.columns)}")

    # Check ALL rows, not just a sample
    ei_col = df_debug["extra_info"]
    first_ei = ei_col.iloc[0]
    print(f"  First row extra_info keys: {list(first_ei.keys()) if isinstance(first_ei, dict) else type(first_ei)}")

    if isinstance(first_ei, dict):
        unopt_asm_vals    = [row.get("unoptimized_assembly", None) for row in ei_col]
        unopt_bin_vals    = [row.get("unoptimized_compiled", None) for row in ei_col]

        nonempty_asm = sum(1 for v in unopt_asm_vals if v)
        nonempty_bin = sum(1 for v in unopt_bin_vals if isinstance(v, (bytes, bytearray)) and len(v) > 0)

        print(f"  Rows with non-empty unoptimized_assembly: {nonempty_asm} / {len(df_debug)}")
        print(f"  Rows with non-empty unoptimized_compiled: {nonempty_bin} / {len(df_debug)}")

        if nonempty_asm == 0:
            print("\n  BUG 2 CONFIRMED: unoptimized_assembly is EMPTY for all rows in Modal volume!")
            print("  → The Modal volume has a stale train.parquet uploaded before stage 5.")
            print("  → Need to re-upload local train.parquet (which has the fields) to the volume.")
            print("  → Until fixed, debug task reward is ALWAYS 0 regardless of LLM quality.")
        else:
            print(f"\n  Bug 2 not present — {nonempty_asm} rows have unoptimized_assembly.")
    else:
        print(f"  extra_info is not a dict, it's {type(first_ei)} — unexpected schema.")

    # ─── List all files in Modal volume ───────────────────────────────────────
    print("\n" + "=" * 60)
    print("Modal volume /data contents:")
    print("=" * 60)
    for f in os.listdir("/data"):
        fpath = os.path.join("/data", f)
        size = os.path.getsize(fpath)
        print(f"  {f}  ({size // 1024} KB)")


@app.local_entrypoint()
def main(n_samples: int = 5) -> None:
    deep_diagnosis.remote(n_samples=n_samples)
