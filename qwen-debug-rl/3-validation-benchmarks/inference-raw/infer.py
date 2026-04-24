"""Compare Qwen-base vs supercoder (exp1) vs debug-supercoder (exp6 @ step 490)
on the *original* SuperCoder prompt and validation set (``sc_val.parquet``).

This is the "raw" (single-stage / one-shot) benchmark — each model is prompted
directly with the normal supercoder prompt (``C + slow asm → faster asm``) and
scored on compile/test-pass/speedup.

Each model runs in its own GPU container in parallel. All 3 containers load
the same parquet sample (same random seed), run inference independently, and
results are collected locally and written to CSV.

Usage
-----
    cd qwen-debug-rl/3-validation-benchmarks/inference-raw
    modal run infer.py                        # 200 samples, all 3 models in parallel
    modal run infer.py --n-samples 500
    modal run infer.py --no-do-speedup        # skip hyperfine, faster
    modal run infer.py --temperature 0

Checkpoint paths (inside the ``debug-rl-checkpoints`` Modal volume):
    --supercoder-ckpt       default: latest ``exp1-train-supercoder/global_step_*/hf_model``
    --debug-supercoder-ckpt default: ``exp6-betterDebug-supercoder/global_step_490/hf_model``

Merge before running (if not done):
    modal run ../../3-rl-train-combined/merge_checkpoint.py \
        --exp exp6-betterDebug-supercoder --step 490

Output (written locally)
------------------------
    infer_results_<tag>.csv    per-sample detail per model
    infer_summary.csv          side-by-side metric comparison
"""
from __future__ import annotations

import csv
from pathlib import Path
import modal

MINUTES  = 60
HERE     = Path(__file__).resolve().parent
REPO     = (HERE / "../..").resolve()
# reward.py lives in either 2-rl-supercoder-and-debug/shared or 3-rl-train-combined/shared
# (they are identical). We use the combined one since it matches the exp6 training script.
SHARED   = (REPO / "3-rl-train-combined/shared").resolve()
VERL_DIR = (REPO / "../SuperCoder-reference/verl").resolve()

QWEN_BASE = "Qwen/Qwen2.5-Coder-7B-Instruct"
EXP1_NAME = "exp1-train-supercoder"
EXP6_NAME = "exp6-betterDebug-supercoder"
EXP6_STEP = 490
EXP6_DEFAULT_CKPT = f"/checkpoints/{EXP6_NAME}/global_step_{EXP6_STEP}/hf_model"

app = modal.App("infer-raw-supercoder-compare")

hf_secret       = modal.Secret.from_name("huggingface", required_keys=["HF_TOKEN"])
data_vol        = modal.Volume.from_name("debug-rl-data",        create_if_missing=False)
checkpoints_vol = modal.Volume.from_name("debug-rl-checkpoints", create_if_missing=False)
hf_cache_vol    = modal.Volume.from_name("huggingface-cache",    create_if_missing=True)
vllm_cache_vol  = modal.Volume.from_name("vllm-cache",           create_if_missing=True)

image = (
    modal.Image.from_registry("nvidia/cuda:12.4.1-devel-ubuntu22.04", add_python="3.11")
    .entrypoint([])
    .apt_install("gcc", "time", "curl", "ca-certificates")
    # Install hyperfine >=1.13 so we can use `--input <file>` (matches
    # SuperCoder-reference/src/test_benchmark.py). Ubuntu 22.04 apt ships 1.12,
    # which falls back to shell redirection and adds ~1-5ms/run overhead that
    # compresses speedup ratios for tiny programs.
    .run_commands(
        "curl -sL https://github.com/sharkdp/hyperfine/releases/download/v1.18.0/"
        "hyperfine-v1.18.0-x86_64-unknown-linux-gnu.tar.gz "
        "| tar xz -C /tmp && "
        "install -m 0755 /tmp/hyperfine-v1.18.0-x86_64-unknown-linux-gnu/hyperfine "
        "/usr/local/bin/hyperfine && hyperfine --version",
    )
    .add_local_dir(str(VERL_DIR), "/verl_src", copy=True)
    .run_commands(
        "pip install torch==2.6.0 torchaudio==2.6.0 torchdata==0.11.0 torchvision==0.21.0"
        " tabulate fire 'ray[default]' psutil cachetools numpy pandas pyarrow",
        "pip install wheel && pip install flash-attn==2.7.4.post1 --no-build-isolation",
        "pip install -e '/verl_src[vllm]'",
        "pip install 'transformers>=4.40,<5'",
    )
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
    .add_local_file(str(SHARED / "reward.py"), "/reward.py")
)


# ── Checkpoint helper (runs inside container) ─────────────────────────────────

def _find_hf_checkpoint(exp_name: str, step: int | None = None) -> str | None:
    """Find a merged HF checkpoint under /checkpoints/<exp_name>/global_step_*.

    If ``step`` is given, look for that specific step. Otherwise pick the latest.
    """
    import os, re

    root = f"/checkpoints/{exp_name}"
    if not os.path.isdir(root):
        print(f"  [ckpt] not found: {root}")
        return None

    step_dirs = sorted(
        [(int(m.group(1)), os.path.join(root, name))
         for name in os.listdir(root)
         if (m := re.match(r"global_step_(\d+)$", name))],
        key=lambda x: x[0], reverse=True,
    )
    if not step_dirs:
        print(f"  [ckpt] no global_step_N dirs in {root}")
        return None

    if step is not None:
        step_dirs = [(s, d) for s, d in step_dirs if s == step]
        if not step_dirs:
            print(f"  [ckpt] step {step} not found in {root}")
            return None

    print(f"  [ckpt] steps considered: {[s for s, _ in step_dirs]}")
    for _step, step_dir in step_dirs:
        for sub in ("hf_model", "actor/huggingface", "actor/hf", "actor", ""):
            candidate = os.path.join(step_dir, sub) if sub else step_dir
            if os.path.isfile(os.path.join(candidate, "config.json")):
                print(f"  [ckpt] using: {candidate}")
                return candidate

    print(f"  [ckpt] no config.json found under {root}")
    return None


# ── Single-model Modal function (one GPU container per model) ─────────────────

@app.function(
    image=image,
    gpu="h100:1",
    timeout=120 * MINUTES,
    secrets=[hf_secret],
    volumes={
        "/data":                    data_vol,
        "/checkpoints":             checkpoints_vol,
        "/root/.cache/huggingface": hf_cache_vol,
        "/root/.cache/vllm":        vllm_cache_vol,
    },
)
def eval_model(
    tag: str,
    model_path: str,          # HF model name or abs path in /checkpoints/
    exp_name: str = "",       # if set, auto-detect model_path from checkpoints vol
    exp_step: int = 0,        # if >0 and exp_name set, require this specific step
    n_samples: int = 200,
    parquet: str = "sc_val",
    temperature: float = 0.0,     # paper default (evaluate.py)
    random_seed: int = 42,
    do_speedup: bool = True,
    max_inputs_for_speedup: int = 10,  # paper uses all inputs (cap [:10])
) -> tuple[str, list[dict]]:
    import gc, json, os, subprocess, sys, tempfile, time
    import numpy as np
    import pandas as pd
    import vllm
    from transformers import AutoTokenizer
    sys.path.insert(0, "/")
    from reward import check_correctness  # noqa: F401

    # Resolve checkpoint if needed
    if exp_name and not model_path:
        step = exp_step if exp_step > 0 else None
        model_path = _find_hf_checkpoint(exp_name, step=step) or ""
    if not model_path:
        print(f"[{tag}] No model path — skipping.")
        return tag, []

    # Load the same sample every time (fixed seed)
    df      = pd.read_parquet(f"/data/{parquet}.parquet")
    samples = [row for _, row in df.sample(n=min(n_samples, len(df)), random_state=random_seed).iterrows()]
    print(f"\n[{tag}] model={model_path}  parquet={parquet}  samples={len(samples)}")

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

    print(f"[{tag}] Generating {len(prompts)} responses ...")
    t0 = time.time()
    outputs = llm.generate(prompts, sampling_params)
    print(f"[{tag}] Done in {time.time()-t0:.1f}s")

    results = []
    for i, (output, row) in enumerate(zip(outputs, samples)):
        raw_response    = output.outputs[0].text
        response_tokens = len(output.outputs[0].token_ids)

        msgs = row["prompt"]
        if isinstance(msgs, np.ndarray):
            msgs = msgs.tolist()
        user_content = next((m["content"] for m in msgs if m["role"] == "user"), "")

        ei           = row["extra_info"] if isinstance(row["extra_info"], dict) else {}
        ground_truth = row["reward_model"].get("ground_truth", "") if isinstance(row["reward_model"], dict) else ""

        asm = raw_response.replace("```assembly\n", "").replace("```", "")

        # Compile stderr capture
        compile_stderr = ""
        try:
            with tempfile.TemporaryDirectory() as d:
                asm_f = os.path.join(d, "sol.s")
                bin_f = os.path.join(d, "sol.bin")
                with open(asm_f, "w") as f:
                    f.write(asm)
                cr = subprocess.run(
                    f"gcc {asm_f} -o {bin_f} -lm",
                    shell=True, capture_output=True, text=True, timeout=30,
                )
                compile_stderr = cr.stderr[:400] if cr.returncode != 0 else ""
        except Exception as e:
            compile_stderr = str(e)[:200]

        correctness, binary = check_correctness(asm, ground_truth, ei)
        compiled   = (correctness != -1)
        tests_pass = (correctness == 1.0)

        if correctness == -1:       status = "COMPILE_FAIL"
        elif correctness == -0.5:   status = "RUNTIME_ERR"
        elif correctness == 1.0:    status = "ALL_PASS"
        else:                       status = f"PARTIAL_{correctness:.0%}"

        unopt_stripped = (
            ei.get("unoptimized_assembly", "")
            .replace("```assembly\n", "").replace("```", "").strip()
        )
        is_copy = (asm.strip() == unopt_stripped)

        # Speedup (only for ALL_PASS). Matches paper methodology:
        #   * up to 10 inputs per sample (not 3)
        #   * ``hyperfine --input <file>`` (no shell wrapper per run)
        raw_speedup = None
        if do_speedup and tests_pass and binary is not None:
            _inputs  = list(ei.get("inputs", []))[:max_inputs_for_speedup]
            _precomp = bytes(ei.get("unoptimized_compiled", b""))
            if _inputs and _precomp:
                try:
                    with tempfile.TemporaryDirectory() as d:
                        sol_bin   = os.path.join(d, "sol.bin")
                        unopt_bin = os.path.join(d, "unopt.bin")
                        with open(sol_bin,   "wb") as f: f.write(binary)
                        with open(unopt_bin, "wb") as f: f.write(_precomp)
                        os.chmod(sol_bin, 0o755); os.chmod(unopt_bin, 0o755)

                        speedups = []
                        for j, inp_text in enumerate(_inputs):
                            inf   = os.path.join(d, f"in{j}.txt")
                            out_j = os.path.join(d, f"b{j}.json")
                            with open(inf, "w") as f: f.write(inp_text)

                            def _bench(bp, out_j=out_j, inf=inf):
                                r = subprocess.run(
                                    [
                                        "hyperfine",
                                        "--warmup", "3",
                                        "--runs", "10",
                                        "--input", inf,
                                        "--export-json", out_j,
                                        "--time-unit", "millisecond",
                                        bp,
                                    ],
                                    capture_output=True, text=True, timeout=60,
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
                    print(f"[{tag}] speedup exception: {e}")

        # Effective speedup: failures count as 1.0x (no slowdown, no speedup)
        effective_speedup = raw_speedup if (tests_pass and raw_speedup is not None) else 1.0
        # Paper-style per-sample speedup (matches SuperCoder test_benchmark.py):
        #   * failures → 1.0x
        #   * slowdowns (<1.0x) → clipped to 1.0x
        # Aggregate as geometric mean across all samples in the summary.
        speedup_floor1 = max(1.0, effective_speedup)

        sp_str = f"speedup={raw_speedup:.3f}x" if raw_speedup is not None else "speedup=N/A"
        print(f"[{tag}] [{i+1:3d}/{len(samples)}]  {status:<20s}  {sp_str}  copy={'Y' if is_copy else 'N'}")

        results.append({
            "idx":               i + 1,
            "problem_idx":       ei.get("problem_idx", -1),
            "status":            status,
            "compiled":          compiled,
            "tests_pass":        tests_pass,
            "correctness":       round(float(correctness), 3),
            "raw_speedup":       round(raw_speedup, 4) if raw_speedup is not None else None,
            "effective_speedup": round(float(effective_speedup), 4),
            "speedup_floor1":    round(float(speedup_floor1), 4),
            "is_copy":           is_copy,
            "response_tokens":   response_tokens,
            "n_inputs":          len(ei.get("inputs", [])),
            "compile_stderr":    compile_stderr,
            "prompt":            user_content[:500],
            "response":          raw_response,
        })

    n = len(results)
    sp_vals = [r["raw_speedup"] for r in results if r["raw_speedup"] is not None]
    eff_vals = [r["effective_speedup"] for r in results]
    print(f"\n[{tag}] Compile OK : {sum(r['compiled']   for r in results)}/{n}")
    print(f"[{tag}] All Pass   : {sum(r['tests_pass'] for r in results)}/{n}")
    print(f"[{tag}] Mean corr  : {sum(r['correctness'] for r in results)/n:.3f}")
    if sp_vals:
        print(f"[{tag}] Speedup    : mean={np.mean(sp_vals):.3f}x  max={max(sp_vals):.3f}x (ALL_PASS only)")
    print(f"[{tag}] Eff speedup: mean={np.mean(eff_vals):.3f}x (failures count as 1.0x)")

    del llm; gc.collect()
    return tag, results


# ── Local entrypoint — spawns all 3 containers in parallel ───────────────────

@app.local_entrypoint()
def main(
    n_samples: int              = 200,
    parquet: str                = "sc_val",
    temperature: float          = 0.0,   # paper default
    random_seed: int            = 42,
    do_speedup: bool            = True,
    supercoder_ckpt: str        = "",
    debug_supercoder_ckpt: str  = "",
    out_dir: str                = "",
) -> None:
    import numpy as np

    out_path = Path(out_dir) if out_dir else HERE
    out_path.mkdir(parents=True, exist_ok=True)

    all_results: dict[str, list[dict]] = {}

    shared = dict(
        n_samples=n_samples, parquet=parquet,
        temperature=temperature, random_seed=random_seed, do_speedup=do_speedup,
    )
    print("Spawning 3 model containers in parallel...")

    # debug-supercoder: pin to EXP6_STEP=490 unless user overrides path
    ds_path = debug_supercoder_ckpt or EXP6_DEFAULT_CKPT

    calls = [
        eval_model.spawn(
            tag="qwen-base",
            model_path=QWEN_BASE,
            exp_name="",
            **shared,
        ),
        eval_model.spawn(
            tag="supercoder",
            model_path=supercoder_ckpt,
            exp_name=EXP1_NAME,
            **shared,
        ),
        eval_model.spawn(
            tag="debug-supercoder",
            model_path=ds_path,
            exp_name="",  # path is explicit; no auto-detect
            **shared,
        ),
    ]
    print("Waiting for all containers to finish...\n")
    for call in calls:
        tag, results = call.get()
        if results:
            all_results[tag] = results
            print(f"  [{tag}] finished — {len(results)} samples")
        else:
            print(f"  [{tag}] skipped (no checkpoint found)")

    # Write CSVs
    detail_fields = [
        "idx", "problem_idx", "status", "compiled", "tests_pass", "correctness",
        "raw_speedup", "effective_speedup", "speedup_floor1", "is_copy",
        "response_tokens", "n_inputs", "compile_stderr", "prompt", "response",
    ]
    summary_rows = []

    for tag, results in all_results.items():
        csv_path = out_path / f"infer_results_{tag}.csv"
        with open(csv_path, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=detail_fields)
            writer.writeheader()
            writer.writerows(results)
        print(f"Saved {len(results)} rows → {csv_path}")

        n            = len(results)
        sp_vals      = [r["raw_speedup"] for r in results if r["raw_speedup"] is not None]
        eff_vals     = [r["effective_speedup"] for r in results]
        floor1_vals  = [r["speedup_floor1"]    for r in results]
        # Geometric mean with floor-at-1 per sample → paper's ``avg_speedup``.
        geo_floor1 = (
            float(np.exp(np.mean(np.log(floor1_vals)))) if floor1_vals else 1.0
        )
        status_counts: dict[str, int] = {}
        for r in results:
            status_counts[r["status"]] = status_counts.get(r["status"], 0) + 1

        summary_rows.append({
            "model":                tag,
            "n_samples":            n,
            "compile_rate":         round(sum(r["compiled"]    for r in results) / n, 3),
            "test_pass_rate":       round(sum(r["tests_pass"]  for r in results) / n, 3),
            "mean_correctness":     round(sum(r["correctness"] for r in results) / n, 3),
            "n_speedup_measured":   len(sp_vals),
            "mean_speedup":         round(float(np.mean(sp_vals)), 4) if sp_vals else "",
            "max_speedup":          round(float(max(sp_vals)),     4) if sp_vals else "",
            "mean_effective_speedup": round(float(np.mean(eff_vals)), 4) if eff_vals else "",
            # Paper-style: geometric mean of max(1.0, per-sample speedup) over all samples.
            "geo_mean_speedup_floor1": round(max(1.0, geo_floor1), 4),
            "p25_speedup_floor1":   round(float(np.percentile(floor1_vals, 25)), 4),
            "p50_speedup_floor1":   round(float(np.percentile(floor1_vals, 50)), 4),
            "p75_speedup_floor1":   round(float(np.percentile(floor1_vals, 75)), 4),
            "copy_rate":            round(sum(r["is_copy"] for r in results) / n, 3),
            "status_breakdown":     str(status_counts),
        })

    summary_path = out_path / "infer_summary.csv"
    summary_fields = [
        "model", "n_samples", "compile_rate", "test_pass_rate", "mean_correctness",
        "n_speedup_measured", "mean_speedup", "max_speedup", "mean_effective_speedup",
        "geo_mean_speedup_floor1", "p25_speedup_floor1", "p50_speedup_floor1",
        "p75_speedup_floor1", "copy_rate", "status_breakdown",
    ]
    with open(summary_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=summary_fields)
        writer.writeheader()
        writer.writerows(summary_rows)
    print(f"\nSummary → {summary_path}")

    # Pretty-print comparison table
    col_w = 20
    print(f"\n{'='*85}")
    print(f"COMPARISON  (parquet={parquet}, n={n_samples}, temp={temperature}, "
          f"speedup={'on' if do_speedup else 'off'})")
    print(f"{'='*85}")
    hdr = f"{'metric':<26}" + "".join(f"{r['model']:>{col_w}}" for r in summary_rows)
    print(hdr)
    print("-" * len(hdr))
    for key, label in [
        ("compile_rate",            "compile_rate"),
        ("test_pass_rate",          "test_pass_rate"),
        ("mean_correctness",        "mean_correctness"),
        ("mean_speedup",            "mean_speedup (ALL_PASS)"),
        ("max_speedup",             "max_speedup"),
        ("mean_effective_speedup",  "mean_effective_speedup"),
        ("geo_mean_speedup_floor1", "geo_mean (paper)"),
        ("p50_speedup_floor1",      "p50_speedup"),
        ("p75_speedup_floor1",      "p75_speedup"),
        ("copy_rate",               "copy_rate (bad)"),
    ]:
        print(f"{label:<26}" + "".join(f"{str(r.get(key, '')):>{col_w}}" for r in summary_rows))
    print()
