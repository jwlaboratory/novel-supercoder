"""Reward function for the debug RL task.

The model is given a broken assembly + error + C code and must output a fixed
assembly. We reward it based on:
  -1.0  → compile failure
  -0.5  → runtime error on any test
   0.0  → wrong output on any test (all-or-nothing: must pass ALL tests)
   1.0  → all tests passed

This mirrors speedup_assembly_design2.py exactly: reward is 0 unless ALL test
cases pass. Only correct = full reward.

Signature must match what verl's NaiveRewardManager calls:
    compute_score(data_source, solution_str, ground_truth, extra_info)

extra_info expected keys (from convert_to_parquet.py):
    inputs:  list[str]   stdin for each test case
    outputs: list[str]   expected stdout for each test case
"""
from __future__ import annotations

import os
import subprocess
import tempfile
import psutil


# ---------------------------------------------------------------------------
# Process helpers (copied from speedup_assembly_design2.py)
# ---------------------------------------------------------------------------

def _kill_tree(process):
    try:
        parent = psutil.Process(process.pid)
        for child in parent.children(recursive=True):
            try:
                child.kill()
            except psutil.NoSuchProcess:
                pass
        parent.kill()
    except (psutil.NoSuchProcess, AttributeError):
        pass


def _run(cmd, shell=True, timeout=30, input_data=None):
    process = None
    try:
        process = subprocess.Popen(
            cmd,
            shell=shell,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            stdin=subprocess.PIPE if input_data else None,
            text=(input_data is None),
            preexec_fn=os.setsid,
        )
        stdout, stderr = process.communicate(input=input_data, timeout=timeout)
        return {"returncode": process.returncode, "stdout": stdout, "stderr": stderr}
    except subprocess.TimeoutExpired:
        if process:
            _kill_tree(process)
        return {"returncode": -1, "stdout": None, "stderr": f"Timed out after {timeout}s"}
    except Exception as exc:
        if process:
            _kill_tree(process)
        return {"returncode": -1, "stdout": None, "stderr": str(exc)}


# ---------------------------------------------------------------------------
# Core scoring
# ---------------------------------------------------------------------------

def _strip_fences(text: str) -> str:
    """Remove ```assembly / ``` markdown fences the model sometimes emits."""
    text = text.strip()
    if text.startswith("```"):
        lines = text.split("\n")
        lines = lines[1:]  # drop opening fence line
        if lines and lines[-1].strip() == "```":
            lines = lines[:-1]
        text = "\n".join(lines)
    return text.strip()


def compute_score(data_source, solution_str, ground_truth, extra_info=None):
    """
    Score a model-generated assembly fix.

    Returns
    -------
    float
        -1.0  compile failure
        -0.5  runtime error on any test
         0.0  all tests produce wrong output
         0.0–1.0  fraction of test cases with correct output
    """
    if not extra_info:
        return -1.0

    inputs = extra_info.get("inputs", [])
    outputs = extra_info.get("outputs", [])

    if not inputs or len(inputs) != len(outputs):
        return -1.0

    solution_str = _strip_fences(solution_str)
    if not solution_str:
        return -1.0

    try:
        with tempfile.TemporaryDirectory() as tmp:
            asm_file = os.path.join(tmp, "fixed.s")
            bin_file = os.path.join(tmp, "fixed.bin")

            with open(asm_file, "w") as f:
                f.write(solution_str)

            # Compile — must run on Linux x86-64 (Modal / GPU server)
            compile_result = _run(f"gcc {asm_file} -o {bin_file} -lm", timeout=30)
            if compile_result["returncode"] != 0:
                return -1.0

            for inp, expected in zip(inputs, outputs):
                run_result = _run(
                    bin_file,
                    shell=False,
                    timeout=15,
                    input_data=inp.encode() if isinstance(inp, str) else inp,
                )

                if run_result["returncode"] != 0:
                    return -0.5  # runtime error on any test → 0

                actual = run_result["stdout"]
                if isinstance(actual, bytes):
                    actual = actual.decode()

                if actual != expected:
                    return 0  # wrong output on any test → 0 (design2: all-or-nothing)

            return 1.0  # all tests passed

    except Exception:
        return -1.0
