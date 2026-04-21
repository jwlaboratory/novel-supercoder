"""Two-stage benchmark on supercoder validation data (sc_val.parquet).

**Stage 1 — generate only with supercoder** (``exp1-train-supercoder``, same as
inference-debug ``supercoder-exp1``): ``--stage1-ckpt`` or auto
``_find_hf_checkpoint("exp1-train-supercoder")``.

**Stage 2 — if stage 1 fails, try to debug/fix** (same debug prompt as
``1-gen-training-data/3-identify-fails.py``: error + C code + bad assembly).
Exactly one of these strategies per experiment column:

  1. ``supercoder-again`` — same supercoder checkpoint as stage 1 (exp1), second
     pass on the fix prompt (not a separate “exp4” model).
  2. ``qwen-base`` — ``Qwen/Qwen2.5-Coder-7B-Instruct`` (base instruct, not RL).
  3. ``nothing`` — no second pass; failures stay failures.
  4. ``debug-better-rl`` — ``exp5-debug-betterRL`` (``5-train-debug-betterRL``).
  5. ``exp3-qwen-debug`` — ``exp3-qwen-debug`` (``3-train-qwen-debug``, first debug RL).

Effective speedup: mean of per-row speedup where ALL_PASS uses measured
hyperfine speedup; any compile/test failure counts as 1.0x (per request).

Usage
-----
    cd qwen-debug-rl/3-validation-benchmarks/2-stage
    modal run infer.py --n-samples 200
    modal run infer.py --n-samples 200 --no-do-speedup
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

QWEN_BASE = "Qwen/Qwen2.5-Coder-7B-Instruct"
# Stage 1 = EXP1 only (matches inference-debug supercoder-exp1).
EXP1_NAME = "exp1-train-supercoder"
# Stage 2: Qwen debug RL (3-train-qwen-debug) and improved debug RL (5-train-debug-betterRL).
EXP3_NAME = "exp3-qwen-debug"
EXP5_NAME = "exp5-debug-betterRL"

# Same template as qwen-debug-rl/1-gen-training-data/3-identify-fails.py
DEBUG_PROMPT_TEMPLATE = """\
You are an expert x86-64 assembly programmer. Fix the following incorrectly \
optimized assembly code for x86-64 Linux (compiled with gcc, linked with -lm). \
The assembly must compile with `gcc <file>.s -o <file> -lm` and produce correct \
output for all test cases. Output ONLY the corrected x86-64 assembly code — no \
explanations, no markdown fences, no additional text.

The error is:
{error}

The correct C code is:
{c_code}

The incorrectly optimized assembly is:
{bad_assembly}

Generated, correct but still optimized assembly:
"""

app = modal.App("infer-two-stage")

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
        " tabulate fire 'ray[default]' psutil cachetools numpy pandas pyarrow",
        "pip install wheel && pip install flash-attn==2.7.4.post1 --no-build-isolation",
        "pip install -e '/verl_src[vllm]'",
        "pip install 'transformers>=4.40,<5' datasets",
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
        [(int(m.group(1)), os.path.join(root, name))
         for name in os.listdir(root)
         if (m := re.match(r"global_step_(\d+)$", name))],
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


def _error_text_for_fix(compile_stderr: str, correctness: float, status: str) -> str:
    if compile_stderr:
        return compile_stderr[:4000]
    if correctness == -0.5:
        return "Runtime error on one or more test cases."
    if 0 <= correctness < 1.0:
        return f"Wrong output on one or more tests (fraction passed: {correctness:.3f})."
    return status or "Unknown failure."


@app.function(
    image=image,
    gpu="h100:1",
    timeout=120 * MINUTES,
    secrets=[hf_secret],
    volumes={
        "/data": data_vol,
        "/checkpoints": checkpoints_vol,
        "/root/.cache/huggingface": hf_cache_vol,
        "/root/.cache/vllm": vllm_cache_vol,
    },
)
def eval_two_stage(
    n_samples: int = 200,
    parquet: str = "sc_val",
    temperature: float = 0.5,
    random_seed: int = 42,
    do_speedup: bool = True,
    stage1_ckpt: str = "",
    base_fix_ckpt: str = "",
    debug1_ckpt: str = "",
    debug2_ckpt: str = "",
) -> dict:
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
    from datasets import load_dataset
    from transformers import AutoTokenizer

    sys.path.insert(0, "/")
    from reward import check_correctness  # noqa: F401

    # Resolve stage-1 path
    s1_path = stage1_ckpt or _find_hf_checkpoint(EXP1_NAME) or ""
    if not s1_path:
        return {"error": "No stage1 (supercoder) checkpoint — set --stage1-ckpt or upload exp1."}

    df = pd.read_parquet(f"/data/{parquet}.parquet")
    samples = [
        row for _, row in df.sample(n=min(n_samples, len(df)), random_state=random_seed).iterrows()
    ]
    print(f"\n[two-stage] parquet={parquet}  samples={len(samples)}  stage1_model={s1_path}")

    # Map question text -> c_code for debug prompts (HF val split)
    print("Loading HF dataset for c_code lookup …")
    hf_ds = load_dataset("random1123anonymized/supercoder", split="val")

    def _safe_extra(item: dict) -> dict:
        extra = item.get("extra_info", {})
        if isinstance(extra, list) and extra:
            first = extra[0]
            if isinstance(first, dict):
                return first
        return extra if isinstance(extra, dict) else {}

    c_code_by_question: dict[str, str] = {}
    for item in hf_ds:
        ex = _safe_extra(item)
        q = ex.get("question", "") or ""
        if q:
            c_code_by_question[q] = ex.get("c_code", "") or ""

    def evaluate_asm(
        raw_response: str,
        row,
        ei: dict,
        ground_truth: str,
    ) -> dict:
        asm = raw_response.replace("```assembly\n", "").replace("```", "")

        compile_stderr = ""
        try:
            with tempfile.TemporaryDirectory() as d:
                asm_f = os.path.join(d, "sol.s")
                bin_f = os.path.join(d, "sol.bin")
                with open(asm_f, "w") as f:
                    f.write(asm)
                cr = subprocess.run(
                    f"gcc {asm_f} -o {bin_f} -lm",
                    shell=True,
                    capture_output=True,
                    text=True,
                    timeout=30,
                )
                compile_stderr = cr.stderr[:400] if cr.returncode != 0 else ""
        except Exception as e:
            compile_stderr = str(e)[:200]

        correctness, binary = check_correctness(asm, ground_truth, ei)
        compiled = correctness != -1
        tests_pass = correctness == 1.0

        if correctness == -1:
            status = "COMPILE_FAIL"
        elif correctness == -0.5:
            status = "RUNTIME_ERR"
        elif correctness == 1.0:
            status = "ALL_PASS"
        else:
            status = f"PARTIAL_{correctness:.0%}"

        unopt_stripped = (
            ei.get("unoptimized_assembly", "").replace("```assembly\n", "").replace("```", "").strip()
        )
        is_copy = asm.strip() == unopt_stripped

        raw_speedup = None
        if do_speedup and tests_pass and binary is not None:
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
                    print(f"  [speedup] exception: {e}")

        eff = raw_speedup if (tests_pass and raw_speedup is not None) else 1.0

        return {
            "status": status,
            "compiled": compiled,
            "tests_pass": tests_pass,
            "correctness": round(float(correctness), 3),
            "raw_speedup": round(raw_speedup, 4) if raw_speedup is not None else None,
            "effective_speedup": round(float(eff), 4),
            "is_copy": is_copy,
            "compile_stderr": compile_stderr,
            "asm": asm,
        }

    # ── Stage 1: supercoder ───────────────────────────────────────────────
    tok1 = AutoTokenizer.from_pretrained(s1_path, trust_remote_code=True)
    llm1 = vllm.LLM(
        model=s1_path,
        max_model_len=4096,
        gpu_memory_utilization=0.85,
        trust_remote_code=True,
    )
    sp = vllm.SamplingParams(
        temperature=temperature,
        max_tokens=2000,
        stop_token_ids=[151643, 151645],
    )

    stage1_prompts = []
    meta = []
    for row in samples:
        msgs = row["prompt"]
        if hasattr(msgs, "tolist"):
            msgs = msgs.tolist()
        user_content = next((m["content"] for m in msgs if m["role"] == "user"), "")
        ei = row["extra_info"] if isinstance(row["extra_info"], dict) else {}
        gt = (
            row["reward_model"].get("ground_truth", "")
            if isinstance(row["reward_model"], dict)
            else ""
        )
        stage1_prompts.append(tok1.apply_chat_template(msgs, tokenize=False, add_generation_prompt=True))
        meta.append({"row": row, "user_content": user_content, "ei": ei, "ground_truth": gt})

    print(f"[stage1] Generating {len(stage1_prompts)} responses …")
    t0 = time.time()
    out1 = llm1.generate(stage1_prompts, sp)
    print(f"[stage1] Done in {time.time() - t0:.1f}s")

    stage1_eval = []
    for i, (output, m) in enumerate(zip(out1, meta)):
        raw = output.outputs[0].text
        ev = evaluate_asm(raw, m["row"], m["ei"], m["ground_truth"])
        ev["response"] = raw
        ev["prompt_preview"] = m["user_content"][:500]
        print(
            f"[stage1] [{i+1:3d}/{len(meta)}]  {ev['status']:<18s}  "
            f"eff_sp={ev['effective_speedup']:.3f}x"
        )
        stage1_eval.append(ev)

    del llm1
    gc.collect()

    n = len(stage1_eval)
    n_s1_pass = sum(1 for s in stage1_eval if s["tests_pass"])
    print(f"\n[stage1] ALL_PASS: {n_s1_pass}/{n}  compile_ok: {sum(s['compiled'] for s in stage1_eval)}/{n}")

    # ── Stage 2 experiments ───────────────────────────────────────────────
    failure_indices = [i for i, s in enumerate(stage1_eval) if not s["tests_pass"]]

    def run_stage2_experiment(
        tag: str,
        model_path: str,
        exp_name: str,
        path_override: str,
    ) -> list[dict] | None:
        rows_out: list[dict] = []

        if tag == "nothing":
            for i, s1 in enumerate(stage1_eval):
                eff = s1["effective_speedup"]
                rows_out.append(
                    {
                        "idx": i + 1,
                        "experiment": tag,
                        "stage2_used": False,
                        "stage2_model": "",
                        "stage1_status": s1["status"],
                        "stage1_tests_pass": s1["tests_pass"],
                        "stage1_compile": s1["compiled"],
                        "stage1_correctness": s1["correctness"],
                        "stage1_effective_speedup": s1["effective_speedup"],
                        "final_status": s1["status"],
                        "final_tests_pass": s1["tests_pass"],
                        "final_compile": s1["compiled"],
                        "final_correctness": s1["correctness"],
                        "raw_speedup": s1["raw_speedup"],
                        "effective_speedup": eff,
                        "prompt_preview": s1["prompt_preview"],
                        "stage1_response": s1["response"][:8000],
                        "stage2_response": "",
                    }
                )
            return rows_out

        mp = path_override or (model_path if model_path else "")
        if exp_name and not mp:
            mp = _find_hf_checkpoint(exp_name) or ""
        if not mp:
            print(f"\n[{tag}] No checkpoint — skipping.")
            return None

        tok2 = AutoTokenizer.from_pretrained(mp, trust_remote_code=True)
        llm2 = vllm.LLM(
            model=mp,
            max_model_len=4096,
            gpu_memory_utilization=0.85,
            trust_remote_code=True,
        )

        fix_chat_prompts: list[str] = []
        fix_index_order: list[int] = []

        for i in failure_indices:
            s1 = stage1_eval[i]
            m = meta[i]
            q = m["user_content"]
            c_code = c_code_by_question.get(q, "")
            err = _error_text_for_fix(s1["compile_stderr"], s1["correctness"], s1["status"])
            fix_user = DEBUG_PROMPT_TEMPLATE.format(
                error=err,
                c_code=c_code,
                bad_assembly=s1["asm"][:12000],
            )
            msgs = [{"role": "user", "content": fix_user}]
            fix_chat_prompts.append(
                tok2.apply_chat_template(msgs, tokenize=False, add_generation_prompt=True)
            )
            fix_index_order.append(i)

        responses_by_idx: dict[int, str] = {}
        if fix_chat_prompts:
            print(f"\n[{tag}] model={mp}  fixing {len(fix_chat_prompts)} failures …")
            t1 = time.time()
            out2 = llm2.generate(fix_chat_prompts, sp)
            print(f"[{tag}] stage2 done in {time.time() - t1:.1f}s")
            for idx, output in zip(fix_index_order, out2):
                responses_by_idx[idx] = output.outputs[0].text
        else:
            print(f"\n[{tag}] model={mp}  no failures to fix.")

        for i, s1 in enumerate(stage1_eval):
            if s1["tests_pass"]:
                eff = s1["effective_speedup"]
                rows_out.append(
                    {
                        "idx": i + 1,
                        "experiment": tag,
                        "stage2_used": False,
                        "stage2_model": mp,
                        "stage1_status": s1["status"],
                        "stage1_tests_pass": True,
                        "stage1_compile": s1["compiled"],
                        "stage1_correctness": s1["correctness"],
                        "stage1_effective_speedup": s1["effective_speedup"],
                        "final_status": s1["status"],
                        "final_tests_pass": True,
                        "final_compile": s1["compiled"],
                        "final_correctness": s1["correctness"],
                        "raw_speedup": s1["raw_speedup"],
                        "effective_speedup": eff,
                        "prompt_preview": s1["prompt_preview"],
                        "stage1_response": s1["response"][:8000],
                        "stage2_response": "",
                    }
                )
                continue

            raw2 = responses_by_idx.get(i, "")
            ev2 = evaluate_asm(raw2, meta[i]["row"], meta[i]["ei"], meta[i]["ground_truth"])
            eff = ev2["effective_speedup"]
            rows_out.append(
                {
                    "idx": i + 1,
                    "experiment": tag,
                    "stage2_used": True,
                    "stage2_model": mp,
                    "stage1_status": s1["status"],
                    "stage1_tests_pass": False,
                    "stage1_compile": s1["compiled"],
                    "stage1_correctness": s1["correctness"],
                    "stage1_effective_speedup": s1["effective_speedup"],
                    "final_status": ev2["status"],
                    "final_tests_pass": ev2["tests_pass"],
                    "final_compile": ev2["compiled"],
                    "final_correctness": ev2["correctness"],
                    "raw_speedup": ev2["raw_speedup"],
                    "effective_speedup": eff,
                    "prompt_preview": s1["prompt_preview"],
                    "stage1_response": s1["response"][:8000],
                    "stage2_response": raw2[:8000],
                }
            )

        del llm2
        gc.collect()
        return rows_out

    # Order matches the intended comparison: supercoder re-try, vanilla Qwen,
    # no fix, then exp5 and exp3 RL debuggers.
    experiments: list[tuple[str, str, str, str]] = [
        ("supercoder-again", s1_path, "", ""),
        ("qwen-base", QWEN_BASE, "", base_fix_ckpt),
        ("nothing", "", "", ""),
        ("debug-better-rl", "", EXP5_NAME, debug2_ckpt),
        ("exp3-qwen-debug", "", EXP3_NAME, debug1_ckpt),
    ]

    all_results: dict[str, list[dict]] = {}
    for tag, path, exp, override in experiments:
        res = run_stage2_experiment(tag, path, exp, override)
        if res is not None:
            all_results[tag] = res

    return {"stage1_summary": {"n": n, "stage1_all_pass": n_s1_pass}, "results": all_results}


@app.local_entrypoint()
def main(
    n_samples: int = 200,
    parquet: str = "sc_val",
    temperature: float = 0.5,
    random_seed: int = 42,
    do_speedup: bool = True,
    out_dir: str = "",
    stage1_ckpt: str = "",
    base_fix_ckpt: str = "",
    debug1_ckpt: str = "",
    debug2_ckpt: str = "",
) -> None:
    import numpy as np

    out_path = Path(out_dir) if out_dir else HERE
    out_path.mkdir(parents=True, exist_ok=True)

    payload = eval_two_stage.remote(
        n_samples=n_samples,
        parquet=parquet,
        temperature=temperature,
        random_seed=random_seed,
        do_speedup=do_speedup,
        stage1_ckpt=stage1_ckpt,
        base_fix_ckpt=base_fix_ckpt,
        debug1_ckpt=debug1_ckpt,
        debug2_ckpt=debug2_ckpt,
    )

    if "error" in payload:
        print(payload["error"])
        return

    all_results: dict[str, list[dict]] = payload["results"]
    s1 = payload["stage1_summary"]

    detail_fields = [
        "idx",
        "experiment",
        "stage2_used",
        "stage2_model",
        "stage1_status",
        "stage1_tests_pass",
        "stage1_compile",
        "stage1_correctness",
        "stage1_effective_speedup",
        "final_status",
        "final_tests_pass",
        "final_compile",
        "final_correctness",
        "raw_speedup",
        "effective_speedup",
        "prompt_preview",
        "stage1_response",
        "stage2_response",
    ]

    for tag, rows in all_results.items():
        p = out_path / f"two_stage_detail_{tag}.csv"
        with open(p, "w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=detail_fields, extrasaction="ignore")
            w.writeheader()
            w.writerows(rows)
        print(f"Saved {len(rows)} rows → {p}")

    # Summary: one row per experiment + shared stage1 row
    summary_rows = []

    n_tot = int(s1["n"])
    n_s1_ok = int(s1["stage1_all_pass"])
    n_s1_fail = n_tot - n_s1_ok

    summary_rows.append(
        {
            "experiment": "_stage1_reference",
            "n_samples": n_tot,
            "stage1_pass_count": n_s1_ok,
            "stage1_fail_count": n_s1_fail,
            "final_compile_rate": "",
            "final_test_pass_rate": round(n_s1_ok / max(n_tot, 1), 4),
            "final_fail_count": n_s1_fail,
            "mean_final_correctness": "",
            "mean_effective_speedup_1x_on_fail": "",
            "n_speedup_measured": "",
            "mean_raw_speedup_all_pass_only": "",
            "notes": "Stage1 only (before any fix). Same stage1 run for all experiments below.",
        }
    )

    for tag, rows in sorted(all_results.items()):
        n = len(rows)
        compile_ok = sum(1 for r in rows if r["final_compile"])
        test_ok = sum(1 for r in rows if r["final_tests_pass"])
        fail_ct = n - test_ok
        mean_corr = sum(float(r["final_correctness"]) for r in rows) / max(n, 1)
        effs = [float(r["effective_speedup"]) for r in rows]
        mean_eff = float(np.mean(effs)) if effs else 0.0
        raw_sp = [float(r["raw_speedup"]) for r in rows if r["raw_speedup"] is not None]
        summary_rows.append(
            {
                "experiment": tag,
                "n_samples": n,
                "stage1_pass_count": "",
                "stage1_fail_count": "",
                "final_compile_rate": round(compile_ok / max(n, 1), 4),
                "final_test_pass_rate": round(test_ok / max(n, 1), 4),
                "final_fail_count": fail_ct,
                "mean_final_correctness": round(mean_corr, 4),
                "mean_effective_speedup_1x_on_fail": round(mean_eff, 4),
                "n_speedup_measured": len(raw_sp),
                "mean_raw_speedup_all_pass_only": round(float(np.mean(raw_sp)), 4) if raw_sp else "",
                "notes": "",
            }
        )

    summary_path = out_path / "two_stage_summary.csv"
    sf = [
        "experiment",
        "n_samples",
        "stage1_pass_count",
        "stage1_fail_count",
        "final_compile_rate",
        "final_test_pass_rate",
        "final_fail_count",
        "mean_final_correctness",
        "mean_effective_speedup_1x_on_fail",
        "n_speedup_measured",
        "mean_raw_speedup_all_pass_only",
        "notes",
    ]
    with open(summary_path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=sf)
        w.writeheader()
        w.writerows(summary_rows)
    print(f"\nSummary → {summary_path}")

    col_w = 18
    print(f"\n{'='*90}")
    print(f"TWO-STAGE COMPARISON  (n={n_samples}, parquet={parquet}, speedup={'on' if do_speedup else 'off'})")
    print(f"{'='*90}")
    data_rows = [r for r in summary_rows if not str(r["experiment"]).startswith("_stage1")]
    hdr = f"{'metric':<28}" + "".join(f"{r['experiment']:>{col_w}}" for r in data_rows)
    print(hdr)
    print("-" * len(hdr))
    for key, label in [
        ("final_compile_rate", "final_compile_rate"),
        ("final_test_pass_rate", "final_test_pass_rate"),
        ("final_fail_count", "final_fail_count"),
        ("mean_final_correctness", "mean_correctness"),
        ("mean_effective_speedup_1x_on_fail", "mean_eff_speedup"),
        ("mean_raw_speedup_all_pass_only", "mean_raw_sp (pass)"),
    ]:
        print(f"{label:<28}" + "".join(f"{str(r.get(key, '')):>{col_w}}" for r in data_rows))
    print()
