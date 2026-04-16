"""Step 1 — Local data inspection. No GPU, no compilation.

Checks whether the parquet files are well-formed and extra_info has what
the reward function needs.

Usage:
    cd /Users/shreybirmiwal/projects/jwlabs/novel-supercoder
    uv run python tmp-debug/1-inspect-data.py
"""
from pathlib import Path
import pandas as pd

DATA = Path(__file__).resolve().parent.parent / "qwen-debug-rl/2-rl-model/data"

def inspect(path: Path, name: str) -> None:
    print(f"\n{'='*60}")
    print(f"  {name}  ({path})")
    print(f"{'='*60}")
    if not path.exists():
        print(f"  ERROR: file not found!")
        return

    df = pd.read_parquet(path)
    print(f"  Rows   : {len(df)}")
    print(f"  Columns: {list(df.columns)}")

    row = df.iloc[0]

    # --- prompt ---
    prompt = row.get("prompt", None)
    if isinstance(prompt, list):
        user_msg = next((m["content"] for m in prompt if m["role"] == "user"), "")
    else:
        user_msg = str(prompt)
    print(f"\n  Prompt (first 500 chars):\n{user_msg[:500]}")

    # --- extra_info ---
    ei = row.get("extra_info", None)
    if ei is None:
        print("\n  ERROR: no extra_info column!")
        return

    print(f"\n  extra_info keys: {list(ei.keys()) if isinstance(ei, dict) else type(ei)}")

    if isinstance(ei, dict):
        inputs  = ei.get("inputs", [])
        outputs = ei.get("outputs", [])
        asm     = ei.get("unoptimized_assembly", "")
        binary  = ei.get("unoptimized_compiled", b"")

        print(f"  inputs  count : {len(inputs)}")
        print(f"  outputs count : {len(outputs)}")
        print(f"  unoptimized_assembly length: {len(asm)} chars")
        print(f"  unoptimized_compiled length: {len(binary)} bytes  (type={type(binary).__name__})")

        if inputs:
            print(f"\n  First input  (repr): {repr(inputs[0][:200])}")
        if outputs:
            print(f"  First output (repr): {repr(outputs[0][:200])}")
        if asm:
            print(f"\n  Assembly (first 300 chars):\n{asm[:300]}")

        # sanity checks
        if not isinstance(binary, (bytes, bytearray)) or len(binary) == 0:
            print("\n  WARNING: unoptimized_compiled is empty or wrong type — speedup benchmark will fail!")
        if len(inputs) != len(outputs):
            print(f"\n  WARNING: inputs/outputs length mismatch ({len(inputs)} vs {len(outputs)})")
        if not asm:
            print("\n  WARNING: unoptimized_assembly is empty!")

    # --- reward_model ---
    rm = row.get("reward_model", None)
    print(f"\n  reward_model: {rm}")


if __name__ == "__main__":
    inspect(DATA / "supercoder_train.parquet", "supercoder_train (optimization task)")
    inspect(DATA / "train.parquet",             "debug train (debug task)")
    print("\nDone.")
