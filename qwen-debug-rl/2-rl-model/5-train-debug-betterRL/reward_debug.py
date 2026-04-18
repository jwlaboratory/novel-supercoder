"""Debug-specific reward: correctness fraction (passed/total tests).

Replaces the speedup reward for the debug task. Rationale:
  - Speedup reward requires: fix compile errors AND pass tests AND beat GCC timing
  - That stacks 3 hard hurdles → near-zero reward → no gradient
  - This reward gives signal for partial fixes: 3/5 tests passing → 0.6 reward
  - Optimization skill comes later in exp4/exp6 (supercoder stage on top)

Returns:
  0.0              compile fails or runtime error on first test
  passed/total     fraction of test cases passed, in [0.0, 1.0]
"""
import os
import tempfile
import subprocess
import psutil
from subprocess import PIPE


def kill_process_tree(process):
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


def run_with_timeout(cmd, shell=True, timeout=30, capture_output=True, input_data=None):
    process = None
    try:
        process = subprocess.Popen(
            cmd,
            shell=shell,
            stdout=subprocess.PIPE if capture_output else None,
            stderr=subprocess.PIPE if capture_output else None,
            stdin=subprocess.PIPE if input_data else None,
            text=not input_data,
            preexec_fn=os.setsid,
        )
        stdout, stderr = process.communicate(input=input_data, timeout=timeout)
        return {"returncode": process.returncode, "stdout": stdout, "stderr": stderr}
    except subprocess.TimeoutExpired:
        if process:
            kill_process_tree(process)
        return {"returncode": -1, "stdout": None, "stderr": f"timed out after {timeout}s"}
    except Exception as e:
        if process:
            kill_process_tree(process)
        return {"returncode": -1, "stdout": None, "stderr": str(e)}


def compute_score(data_source, solution_str, ground_truth, extra_info=None):
    """Correctness-fraction reward for the debug task."""
    if not extra_info:
        return 0.0

    solution_str = solution_str.replace("```assembly\n", "").replace("```", "")

    inputs  = extra_info.get("inputs",  [])[:10]
    outputs = extra_info.get("outputs", [])[:10]

    if not inputs or len(inputs) != len(outputs):
        return 0.0

    try:
        with tempfile.TemporaryDirectory() as tmp:
            asm_file = os.path.join(tmp, "sol.s")
            bin_file = os.path.join(tmp, "sol.bin")

            with open(asm_file, "w") as f:
                f.write(solution_str)

            compile_result = run_with_timeout(
                f"gcc {asm_file} -o {bin_file} -lm", timeout=30
            )
            if compile_result["returncode"] != 0:
                return 0.0   # compile fail

            passed = 0
            for inp, expected in zip(inputs, outputs):
                run_result = run_with_timeout(
                    bin_file,
                    shell=False,
                    timeout=30,
                    input_data=inp.encode(),
                )
                if run_result["returncode"] != 0:
                    continue  # runtime error on this test — count as fail, not abort
                actual = run_result["stdout"]
                if isinstance(actual, bytes):
                    actual = actual.decode()
                if actual == expected:
                    passed += 1

            return passed / len(inputs)   # 0.0 → 1.0

    except Exception:
        return 0.0
