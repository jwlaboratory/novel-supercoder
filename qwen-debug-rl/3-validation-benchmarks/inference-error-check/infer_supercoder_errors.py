"""Run SuperCoder (exp1) on a parquet split and export a spreadsheet of *error* rows only.

Each row includes generated assembly, gcc stderr (if any), and the first test failure
explanation (runtime stderr or stdout mismatch).

Usage
-----
    cd qwen-debug-rl/3-validation-benchmarks/inference-error-check
    modal run infer_supercoder_errors.py
    modal run infer_supercoder_errors.py --parquet sc_val --n-samples 200
    modal run infer_supercoder_errors.py --n-samples 0          # full parquet (all rows)
    modal run infer_supercoder_errors.py --xlsx --no-speedup

Checkpoint: latest merged HF model under ``/checkpoints/exp1-train-supercoder`` on the
``debug-rl-checkpoints`` volume, unless ``--supercoder-ckpt`` is set.
"""
from __future__ import annotations

import csv
from pathlib import Path
import modal

MINUTES = 60
HERE = Path(__file__).resolve().parent
REPO = (HERE / "../..").resolve()
SHARED = (REPO / "2-rl-model/shared").resolve()
VERL_DIR = (REPO / "../SuperCoder-reference/verl").resolve()

EXP1_NAME = "exp1-train-supercoder"

app = modal.App("infer-supercoder-error-report")

hf_secret = modal.Secret.from_name("huggingface", required_keys=["HF_TOKEN"])
data_vol = modal.Volume.from_name("debug-rl-data", create_if_missing=False)
checkpoints_vol = modal.Volume.from_name("debug-rl-checkpoints", create_if_missing=False)
hf_cache_vol = modal.Volume.from_name("huggingface-cache", create_if_missing=True)
vllm_cache_vol = modal.Volume.from_name("vllm-cache", create_if_missing=True)

image = (
    modal.Image.from_registry("nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.11")
    .entrypoint([])
    .apt_install("hyperfine", "gcc", "time")
    .add_local_dir(str(VERL_DIR), "/verl_src", copy=True)
    .run_commands(
        "pip install torch==2.6.0 torchaudio==2.6.0 torchdata==0.11.0 torchvision==0.21.0"
        " tabulate fire 'ray[default]' psutil cachetools numpy pandas pyarrow openpyxl",
        "pip install wheel && pip install flash-attn==2.7.4.post1 --no-build-isolation",
        "pip install -e '/verl_src[vllm]'",
        "pip install 'transformers>=4.40,<5'",
    )
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
    .add_local_file(str(SHARED / "reward.py"), "/reward.py")
)


def _find_hf_checkpoint(exp_name: str) -> str | None:
    import os
    import re

    root = f"/checkpoints/{exp_name}"
    if not os.path.isdir(root):
        print(f"  [ckpt] not found: {root}")
        return None

    step_dirs = sorted(
        [
            (int(m.group(1)), os.path.join(root, name))
            for name in os.listdir(root)
            if (m := re.match(r"global_step_(\d+)$", name))
        ],
        key=lambda x: x[0],
        reverse=True,
    )
    if not step_dirs:
        print(f"  [ckpt] no global_step_N dirs in {root}")
        return None

    print(f"  [ckpt] steps found: {[s for s, _ in step_dirs]}")
    for _step, step_dir in step_dirs:
        for sub in ("hf_model", "actor/huggingface", "actor/hf", "actor", ""):
            candidate = os.path.join(step_dir, sub) if sub else step_dir
            if os.path.isfile(os.path.join(candidate, "config.json")):
                print(f"  [ckpt] using: {candidate}")
                return candidate

    print(f"  [ckpt] no config.json found under {root}")
    return None


def _asm_from_response(text: str) -> str:
    """Same fence stripping as inference-debug/infer.py (no strip — matches check_correctness input)."""
    return text.replace("```assembly\n", "").replace("```", "")


def _diagnose_assembly(solution_str: str, extra_info: dict) -> dict:
    """Single compile+test pass with rich error detail (matches reward.check_correctness semantics)."""
    import os
    import sys
    import tempfile

    sys.path.insert(0, "/")
    from reward import run_with_timeout  # noqa: E402

    solution_str = _asm_from_response(solution_str)
    if not extra_info or "inputs" not in extra_info or "outputs" not in extra_info:
        return {
            "correctness": -1.0,
            "status": "COMPILE_FAIL",
            "error_kind": "bad_extra_info",
            "compile_stderr": "",
            "first_error_explanation": "missing inputs/outputs/unoptimized_assembly in extra_info",
            "tests_passed": 0,
            "tests_total": 0,
            "generated_assembly": solution_str,
        }

    inputs = list(extra_info["inputs"])[:10]
    outputs = list(extra_info["outputs"])[:10]
    if len(inputs) == 0 or len(inputs) != len(outputs):
        return {
            "correctness": -1.0,
            "status": "COMPILE_FAIL",
            "error_kind": "bad_tests",
            "compile_stderr": "",
            "first_error_explanation": "empty or mismatched inputs/outputs lengths",
            "tests_passed": 0,
            "tests_total": 0,
            "generated_assembly": solution_str,
        }

    with tempfile.TemporaryDirectory() as temp_dir:
        asm_file = os.path.join(temp_dir, "test.s")
        with open(asm_file, "w") as f:
            f.write(solution_str)

        bin_file = os.path.join(temp_dir, "test.bin")
        compile_cmd = f"gcc {asm_file} -o {bin_file} -lm"
        compile_result = run_with_timeout(compile_cmd, timeout=30)
        cerr = compile_result.get("stderr") or ""
        if isinstance(cerr, bytes):
            cerr = cerr.decode("utf-8", errors="replace")

        if compile_result["returncode"] != 0:
            return {
                "correctness": -1.0,
                "status": "COMPILE_FAIL",
                "error_kind": "compile",
                "compile_stderr": cerr,
                "first_error_explanation": cerr.strip()[:8000] or "(gcc failed, empty stderr)",
                "tests_passed": 0,
                "tests_total": len(inputs),
                "generated_assembly": solution_str,
            }

        passed = 0
        first_mismatch = ""
        for i, (input_text, expected_output) in enumerate(zip(inputs, outputs)):
            run_result = run_with_timeout(
                bin_file,
                shell=False,
                timeout=120,
                input_data=input_text.encode(),
            )
            if run_result["returncode"] != 0:
                rerr = run_result.get("stderr") or b""
                if isinstance(rerr, bytes):
                    rerr = rerr.decode("utf-8", errors="replace")
                expl = (
                    f"test {i}: exit={run_result['returncode']}, "
                    f"stderr={rerr.strip()[:4000] or '(empty)'}"
                )
                return {
                    "correctness": -0.5,
                    "status": "RUNTIME_ERR",
                    "error_kind": "runtime",
                    "compile_stderr": cerr.strip(),
                    "first_error_explanation": expl,
                    "tests_passed": passed,
                    "tests_total": len(inputs),
                    "generated_assembly": solution_str,
                }

            actual = run_result["stdout"]
            if isinstance(actual, bytes):
                actual = actual.decode("utf-8", errors="replace")
            if actual == expected_output:
                passed += 1
            elif not first_mismatch:
                first_mismatch = (
                    f"test {i} stdout mismatch: "
                    f"expected ({len(expected_output)} chars) vs actual ({len(actual)} chars); "
                    f"expected_head={expected_output[:240]!r} actual_head={actual[:240]!r}"
                )

        total = len(inputs)
        correctness = passed / total
        if correctness >= 1.0:
            return {
                "correctness": 1.0,
                "status": "ALL_PASS",
                "error_kind": "none",
                "compile_stderr": cerr.strip(),
                "first_error_explanation": "",
                "tests_passed": passed,
                "tests_total": total,
                "generated_assembly": solution_str,
            }

        return {
            "correctness": float(correctness),
            "status": f"PARTIAL_{correctness:.0%}",
            "error_kind": "wrong_output",
            "compile_stderr": cerr.strip(),
            "first_error_explanation": first_mismatch or "output mismatch (detail unavailable)",
            "tests_passed": passed,
            "tests_total": total,
            "generated_assembly": solution_str,
        }


@app.function(
    image=image,
    gpu="h100:1",
    timeout=90 * MINUTES,
    secrets=[hf_secret],
    volumes={
        "/data": data_vol,
        "/checkpoints": checkpoints_vol,
        "/root/.cache/huggingface": hf_cache_vol,
        "/root/.cache/vllm": vllm_cache_vol,
    },
)
def run_supercoder_and_collect(
    model_path: str,
    parquet: str = "sc_val",
    n_samples: int = 0,
    random_seed: int = 42,
    temperature: float = 0.5,
    do_speedup: bool = False,
    max_asm_field_chars: int = 100_000,
) -> list[dict]:
    import gc
    import json
    import os
    import subprocess
    import sys
    import tempfile
    import time

    import numpy as np
    import pandas as pd
    import vllm
    from transformers import AutoTokenizer

    sys.path.insert(0, "/")
    from reward import check_correctness  # noqa: F401

    if not (model_path and str(model_path).strip()):
        model_path = _find_hf_checkpoint(EXP1_NAME) or ""
    if not model_path:
        print("[supercoder-errors] No checkpoint — set model_path or upload exp1 to volume.")
        return []

    df = pd.read_parquet(f"/data/{parquet}.parquet")
    if n_samples <= 0:
        samples = [row for _, row in df.iterrows()]
    else:
        samples = [
            row
            for _, row in df.sample(
                n=min(n_samples, len(df)), random_state=random_seed
            ).iterrows()
        ]

    print(f"\n[supercoder-errors] model={model_path}  parquet={parquet}  n={len(samples)}")

    tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
    llm = vllm.LLM(
        model=model_path,
        max_model_len=4096,
        gpu_memory_utilization=0.85,
        trust_remote_code=True,
    )
    sampling_params = vllm.SamplingParams(
        temperature=temperature,
        max_tokens=2000,
        stop_token_ids=[151643, 151645],
    )

    prompts = []
    for row in samples:
        msgs = row["prompt"]
        if isinstance(msgs, np.ndarray):
            msgs = msgs.tolist()
        prompts.append(
            tokenizer.apply_chat_template(msgs, tokenize=False, add_generation_prompt=True)
        )

    print(f"[supercoder-errors] Generating {len(prompts)} responses ...")
    t0 = time.time()
    outputs = llm.generate(prompts, sampling_params)
    print(f"[supercoder-errors] Done in {time.time() - t0:.1f}s")

    rows_out: list[dict] = []
    for i, (output, row) in enumerate(zip(outputs, samples)):
        raw_response = output.outputs[0].text
        token_ids = output.outputs[0].token_ids
        response_tokens = len(token_ids) if token_ids is not None else -1

        msgs = row["prompt"]
        if isinstance(msgs, np.ndarray):
            msgs = msgs.tolist()
        user_content = next((m["content"] for m in msgs if m["role"] == "user"), "")

        ei = row["extra_info"] if isinstance(row["extra_info"], dict) else {}
        ground_truth = (
            row["reward_model"].get("ground_truth", "")
            if isinstance(row["reward_model"], dict)
            else ""
        )

        asm_for_eval = _asm_from_response(raw_response)
        diag = _diagnose_assembly(raw_response, ei)
        correctness, binary = check_correctness(asm_for_eval, ground_truth, ei)

        unopt = (
            ei.get("unoptimized_assembly", "")
            .replace("```assembly\n", "")
            .replace("```", "")
            .strip()
        )
        gen_asm = diag["generated_assembly"]
        # Match infer.py: compare stripped asm to stripped unoptimized
        is_copy = gen_asm.strip() == unopt

        raw_speedup = None
        if do_speedup and correctness == 1.0 and binary is not None:
            _inputs = list(ei.get("inputs", []))[:3]
            _precomp = bytes(ei.get("unoptimized_compiled", b""))
            if _inputs and _precomp:
                try:
                    with tempfile.TemporaryDirectory() as d:
                        sol_bin = os.path.join(d, "sol.bin")
                        unopt_bin = os.path.join(d, "unopt.bin")
                        with open(sol_bin, "wb") as f:
                            f.write(binary)
                        with open(unopt_bin, "wb") as f:
                            f.write(_precomp)
                        os.chmod(sol_bin, 0o755)
                        os.chmod(unopt_bin, 0o755)
                        speedups = []
                        for j, inp_text in enumerate(_inputs):
                            inf = os.path.join(d, f"in{j}.txt")
                            out_j = os.path.join(d, f"b{j}.json")
                            with open(inf, "w") as f:
                                f.write(inp_text)

                            def _bench(bp, out_j=out_j, inf=inf):
                                r = subprocess.run(
                                    f"hyperfine --warmup 3 --runs 10 --export-json {out_j}"
                                    f" --time-unit millisecond '{bp} < {inf}'",
                                    shell=True,
                                    capture_output=True,
                                    text=True,
                                    timeout=60,
                                )
                                if r.returncode != 0 or not os.path.exists(out_j):
                                    return None
                                try:
                                    return json.load(open(out_j))["results"][0]["mean"] * 1000
                                except Exception:
                                    return None

                            u_ms = _bench(unopt_bin)
                            s_ms = _bench(sol_bin)
                            if u_ms and s_ms and s_ms > 0:
                                speedups.append(u_ms / s_ms)
                        if speedups:
                            raw_speedup = float(np.mean(speedups))
                except Exception as e:
                    print(f"[supercoder-errors] speedup exception: {e}")

        def _clip(s: str) -> str:
            if len(s) <= max_asm_field_chars:
                return s
            return s[: max_asm_field_chars - 20] + "\n... [truncated]"

        rows_out.append(
            {
                "idx": i + 1,
                "problem_idx": ei.get("problem_idx", -1),
                "status": diag["status"],
                "error_kind": diag["error_kind"],
                "correctness": round(float(diag["correctness"]), 6),
                "tests_passed": diag["tests_passed"],
                "tests_total": diag["tests_total"],
                "compile_stderr": _clip(diag.get("compile_stderr", "")),
                "first_error_explanation": _clip(diag.get("first_error_explanation", "")),
                "generated_assembly": _clip(gen_asm),
                "unoptimized_assembly": _clip(unopt),
                "user_prompt": _clip(user_content),
                "raw_response": _clip(raw_response),
                "response_tokens": response_tokens,
                "is_copy": is_copy,
                "raw_speedup": round(raw_speedup, 4) if raw_speedup is not None else "",
            }
        )
        sp = f"speedup={raw_speedup:.3f}x" if raw_speedup is not None else "speedup=N/A"
        print(
            f"[supercoder-errors] [{i + 1:3d}/{len(samples)}]  {diag['status']:<18}  {sp}  copy={'Y' if is_copy else 'N'}"
        )

    del llm
    gc.collect()
    return rows_out


@app.local_entrypoint()
def main(
    parquet: str = "sc_val",
    n_samples: int = 0,
    random_seed: int = 42,
    temperature: float = 0.5,
    supercoder_ckpt: str = "",
    out_dir: str = "",
    xlsx: bool = False,
    do_speedup: bool = False,
    include_passing: bool = False,
) -> None:
    import pandas as pd

    out_path = Path(out_dir) if out_dir else HERE
    out_path.mkdir(parents=True, exist_ok=True)

    all_rows = run_supercoder_and_collect.remote(
        model_path=supercoder_ckpt.strip(),
        parquet=parquet,
        n_samples=n_samples,
        random_seed=random_seed,
        temperature=temperature,
        do_speedup=do_speedup,
    )

    if not all_rows:
        print("No results (missing checkpoint, empty parquet, or remote failure).")
        return

    if not include_passing:
        error_rows = [r for r in all_rows if r.get("status") != "ALL_PASS"]
    else:
        error_rows = all_rows

    fields = [
        "idx",
        "problem_idx",
        "status",
        "error_kind",
        "correctness",
        "tests_passed",
        "tests_total",
        "compile_stderr",
        "first_error_explanation",
        "generated_assembly",
        "unoptimized_assembly",
        "user_prompt",
        "raw_response",
        "response_tokens",
        "is_copy",
        "raw_speedup",
    ]

    stem = f"supercoder_errors_{parquet}"
    csv_path = out_path / f"{stem}.csv"
    with open(csv_path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        w.writeheader()
        w.writerows(error_rows)
    kind = "rows" if include_passing else "error rows"
    print(f"\nWrote {len(error_rows)} {kind} (evaluated {len(all_rows)}) → {csv_path}")

    if xlsx and error_rows:
        xlsx_path = out_path / f"{stem}.xlsx"

        def _cell(s: str, lim: int = 32000) -> str:
            if not isinstance(s, str):
                s = str(s)
            return s if len(s) <= lim else s[: lim - 15] + "…[truncated]"

        slim = [{k: _cell(r.get(k, "")) if k in r and isinstance(r[k], str) else r.get(k, "") for k in fields} for r in error_rows]
        pd.DataFrame(slim).to_excel(xlsx_path, index=False)
        print(f"Wrote XLSX → {xlsx_path}")
