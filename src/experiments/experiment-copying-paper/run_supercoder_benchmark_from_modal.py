#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import sys
import types
from pathlib import Path

try:
    from datasets import load_dataset
except Exception:  # noqa: BLE001
    load_dataset = None

MODEL_SLUG = "qwen25_coder_7b_instruct"


def _load_split(ds_name: str, split: str):
    if load_dataset is None:
        raise RuntimeError("datasets package unavailable")
    cache_dir = os.environ.get("HF_CACHE")
    if cache_dir:
        return load_dataset(ds_name, split=split, cache_dir=cache_dir)
    return load_dataset(ds_name, split=split)


def _safe_get_extra(item: dict) -> dict:
    extra = item.get("extra_info", {})
    if isinstance(extra, list) and extra:
        first = extra[0]
        if isinstance(first, dict):
            return first
    if isinstance(extra, dict):
        return extra
    return {}


def _install_supercoder_import_stubs() -> None:
    # SuperCoder benchmark modules import many training-time deps at module scope.
    # For benchmark replay we only need runtime helpers used in test_benchmark/metrics.
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

        def _noop(*_args, **_kwargs):  # noqa: ANN001
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
            tests = []
            tests_path = row_dir / "input_tests.json"
            if tests_path.exists():
                tests = json.loads(tests_path.read_text(encoding="utf-8"))
            inputs = [t.get("input", "") for t in tests if isinstance(t, dict)]
            outputs = [t.get("output", "") for t in tests if isinstance(t, dict)]
            unopt_asm = ""
            if (row_dir / "inputo0.s").exists():
                unopt_asm = (row_dir / "inputo0.s").read_text(encoding="utf-8", errors="replace")
            out.append(
                {
                    "idx": row_index - 1,
                    "extra_info": {
                        "inputs": inputs,
                        "outputs": outputs,
                        "unoptimized_assembly": unopt_asm,
                    },
                }
            )
    return out


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-dir", required=True)
    parser.add_argument("--supercoder-root", default="")
    parser.add_argument("--ds-name", default="random1123anonymized/supercoder")
    parser.add_argument("--split", default="val")
    parser.add_argument("--offset", type=int, default=0)
    parser.add_argument("--limit", type=int, default=0)
    parser.add_argument("--model-name", default="Qwen/Qwen2.5-Coder-7B-Instruct")
    parser.add_argument("--num-workers", type=int, default=4)
    args = parser.parse_args()

    run_dir = Path(args.run_dir).resolve()
    supercoder_root = Path(args.supercoder_root).resolve() if args.supercoder_root else (
        Path(__file__).resolve().parents[4] / "SuperCoder"
    )
    supercoder_src = supercoder_root / "src"
    if not (supercoder_src / "test_benchmark.py").exists():
        raise SystemExit(f"Could not find SuperCoder benchmark code under {supercoder_src}")

    synthetic_mode = False
    try:
        ds = _load_split(args.ds_name, args.split)
        if args.offset > 0:
            ds = ds.select(range(args.offset, len(ds)))
        if args.limit > 0:
            ds = ds.select(range(0, min(args.limit, len(ds))))
        ds = ds.map(lambda example, idx: {"idx": idx}, with_indices=True)
    except Exception as exc:  # noqa: BLE001
        print(f"Warning: failed to load HF dataset ({exc}); falling back to run-dir dataset.", flush=True)
        ds = _build_synthetic_dataset_from_run(run_dir)
        synthetic_mode = True

    _install_supercoder_import_stubs()
    sys.path.insert(0, str(supercoder_src))
    from test_benchmark import test_benchmark_generated_assembly  # noqa: WPS433
    from metrics import calculate_metrics  # noqa: WPS433

    gen_results_by_problem = []
    for problem_idx in range(len(ds)):
        row_index = problem_idx + 1
        asm_path = run_dir / "rows" / f"row_{row_index:05d}" / "out" / f"{MODEL_SLUG}.s"
        asm = asm_path.read_text(encoding="utf-8", errors="replace") if asm_path.exists() else ""
        gen_results_by_problem.append([{"idx": int(problem_idx), "sample_id": 0, "output": asm}])

    test_case_results, results_by_problem_and_sample, compilation_failures, identical_samples = (
        test_benchmark_generated_assembly(gen_results_by_problem, ds, args.num_workers)
    )
    output_data = calculate_metrics(
        args.model_name,
        args.ds_name,
        1,
        gen_results_by_problem,
        ds,
        results_by_problem_and_sample,
        compilation_failures,
        identical_samples,
    )

    out_dir = run_dir / "supercoder_bench"
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / "problem_results.json").write_text(
        json.dumps(output_data, ensure_ascii=False, indent=2), encoding="utf-8"
    )
    (out_dir / "test_case_results.json").write_text(
        json.dumps(test_case_results, ensure_ascii=False, indent=2), encoding="utf-8"
    )

    with (out_dir / "row_summary.jsonl").open("w", encoding="utf-8") as f:
        problems = output_data.get("problems", {})
        for problem_key, rec in problems.items():
            try:
                problem_idx = int(problem_key)
            except (ValueError, TypeError):
                continue
            row_index = problem_idx + 1
            extra = _safe_get_extra(ds[problem_idx]) if problem_idx >= 0 else {}
            f.write(
                json.dumps(
                    {
                        "row_index": row_index,
                        "problem_idx": problem_idx,
                        "paper_compilation_failed": rec.get("compilation_failed", True),
                        "paper_compiled": not rec.get("compilation_failed", True),
                        "paper_overall_correct": rec.get("overall_correct", False),
                        "paper_best_speedup": rec.get("best_speedup", 1.0),
                        "paper_best_sample_id": rec.get("best_sample_id"),
                        "paper_num_inputs": len(extra.get("inputs", []) or []),
                    },
                    ensure_ascii=False,
                )
                + "\n"
            )

    summary = output_data.get("summary", {})
    summary["synthetic_dataset_fallback"] = synthetic_mode
    print("SuperCoder benchmark summary:")
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    print(f"Wrote: {out_dir / 'problem_results.json'}")
    print(f"Wrote: {out_dir / 'row_summary.jsonl'}")


if __name__ == "__main__":
    main()
