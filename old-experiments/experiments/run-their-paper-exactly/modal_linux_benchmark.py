#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import sys
import types
from pathlib import Path

import modal

app = modal.App("supercoder-linux-benchmark")
_THIS_FILE = Path(__file__).resolve()
if len(_THIS_FILE.parents) > 4:
    LOCAL_WORKSPACE = _THIS_FILE.parents[4]
else:
    LOCAL_WORKSPACE = Path.cwd()
LOCAL_EXPERIMENTS_ROOT = LOCAL_WORKSPACE / "novel-supercoder" / "src" / "experiments"
LOCAL_SUPERCODER_SRC = LOCAL_WORKSPACE / "SuperCoder" / "src"
REMOTE_EXPERIMENTS_ROOT = Path("/root/experiments")
REMOTE_SUPERCODER_SRC = Path("/root/SuperCoder/src")

image = (
    modal.Image.from_registry("ubuntu:22.04", add_python="3.10")
    .entrypoint([])
    .apt_install("gcc", "g++", "hyperfine")
    .pip_install("numpy", "requests", "tqdm", "psutil", "datasets")
)
if modal.is_local():
    image = image.add_local_dir(str(LOCAL_EXPERIMENTS_ROOT), remote_path=str(REMOTE_EXPERIMENTS_ROOT))
    image = image.add_local_dir(str(LOCAL_SUPERCODER_SRC), remote_path=str(REMOTE_SUPERCODER_SRC))


def _install_supercoder_import_stubs() -> None:
    transformers_stub = types.ModuleType("transformers")
    transformers_stub.AutoTokenizer = object
    sys.modules["transformers"] = transformers_stub

    if "ray" not in sys.modules:
        ray_stub = types.ModuleType("ray")
        sys.modules["ray"] = ray_stub

    if "fire" not in sys.modules:
        fire_stub = types.ModuleType("fire")
        sys.modules["fire"] = fire_stub

    if "sglang" not in sys.modules:
        sglang_stub = types.ModuleType("sglang")
        sglang_utils_stub = types.ModuleType("sglang.utils")

        def _noop(*_args, **_kwargs):
            return None

        sglang_utils_stub.terminate_process = _noop
        sglang_utils_stub.wait_for_server = _noop
        sglang_utils_stub.launch_server_cmd = _noop
        sglang_stub.utils = sglang_utils_stub
        sys.modules["sglang"] = sglang_stub
        sys.modules["sglang.utils"] = sglang_utils_stub


def _build_synthetic_dataset_from_run(run_dir: Path) -> list[dict]:
    manifest = run_dir / "manifest.jsonl"
    if not manifest.exists():
        raise RuntimeError(f"Missing manifest: {manifest}")
    out: list[dict] = []
    with manifest.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rec = json.loads(line)
            row_index = int(rec["row_index"])
            row_dir = Path(rec["row_dir"])
            tests_path = row_dir / "input_tests.json"
            tests = json.loads(tests_path.read_text(encoding="utf-8")) if tests_path.exists() else []
            inputs = [t.get("input", "") for t in tests if isinstance(t, dict)]
            outputs = [t.get("output", "") for t in tests if isinstance(t, dict)]
            unopt = (row_dir / "inputo0.s").read_text(encoding="utf-8", errors="replace") if (row_dir / "inputo0.s").exists() else ""
            out.append(
                {
                    "idx": row_index - 1,
                    "extra_info": {
                        "inputs": inputs,
                        "outputs": outputs,
                        "unoptimized_assembly": unopt,
                    },
                }
            )
    return out


@app.function(
    image=image,
    cpu=8,
    timeout=60 * 60 * 8,
)
def benchmark_run(run_dir: str, model_name: str) -> dict:
    run_dir_p = Path(run_dir)
    supercoder_src = REMOTE_SUPERCODER_SRC
    if not run_dir_p.exists():
        raise RuntimeError(f"Run dir missing: {run_dir_p}")
    if not (supercoder_src / "test_benchmark.py").exists():
        raise RuntimeError(f"SuperCoder src missing: {supercoder_src}")

    os.chdir(str(run_dir_p))
    _install_supercoder_import_stubs()
    sys.path.insert(0, str(supercoder_src))

    from test_benchmark import test_benchmark_generated_assembly  # noqa: WPS433
    from metrics import calculate_metrics  # noqa: WPS433

    ds = _build_synthetic_dataset_from_run(run_dir_p)

    model_slug = "qwen25_coder_7b_instruct"
    gen_results_by_problem = []
    for problem_idx in range(len(ds)):
        row_index = problem_idx + 1
        asm_path = run_dir_p / "rows" / f"row_{row_index:05d}" / "out" / f"{model_slug}.s"
        asm = asm_path.read_text(encoding="utf-8", errors="replace") if asm_path.exists() else ""
        gen_results_by_problem.append([{"idx": int(problem_idx), "sample_id": 0, "output": asm}])

    test_case_results, results_by_problem_and_sample, compilation_failures, identical_samples = test_benchmark_generated_assembly(
        gen_results_by_problem, ds, 4
    )
    output_data = calculate_metrics(
        model_name,
        "random1123anonymized/supercoder",
        1,
        gen_results_by_problem,
        ds,
        results_by_problem_and_sample,
        compilation_failures,
        identical_samples,
    )

    return {
        "summary": output_data.get("summary", {}),
        "num_test_case_results": len(test_case_results),
        "compilation_failures": len(compilation_failures),
    }


@app.local_entrypoint()
def main(run_dir: str, model_name: str = "Qwen/Qwen2.5-Coder-7B-Instruct"):
    run_dir_abs = Path(run_dir).resolve()
    run_dir_rel = run_dir_abs.relative_to(LOCAL_EXPERIMENTS_ROOT)
    remote_run_dir = REMOTE_EXPERIMENTS_ROOT / run_dir_rel
    result = benchmark_run.remote(str(remote_run_dir), model_name)
    print(json.dumps(result, ensure_ascii=False, indent=2))
