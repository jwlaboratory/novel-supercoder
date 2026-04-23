"""Inference-only inspection: run vllm on N samples and save a CSV.

Usage:
    cd qwen-debug-rl/2-rl-model
    modal run inspect_run.py                        # 20 samples, sc_train.parquet
    modal run inspect_run.py --n-samples 50
    modal run inspect_run.py --parquet debug_train
    modal run inspect_run.py --temperature 0
"""
from __future__ import annotations
import csv
from pathlib import Path
import modal

MINUTES  = 60
HERE     = Path(__file__).resolve().parent
SHARED   = HERE / "shared"
VERL_DIR = (HERE / "../../SuperCoder-reference/verl").resolve()

BASE_MODEL = "Qwen/Qwen2.5-Coder-7B-Instruct"

app = modal.App("inspect-run")
hf_secret      = modal.Secret.from_name("huggingface", required_keys=["HF_TOKEN"])
data_vol       = modal.Volume.from_name("debug-rl-data",     create_if_missing=False)
hf_cache_vol   = modal.Volume.from_name("huggingface-cache", create_if_missing=True)
vllm_cache_vol = modal.Volume.from_name("vllm-cache",        create_if_missing=True)

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
        "pip install 'transformers>=4.40,<5'",
    )
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
    .add_local_file(str(SHARED / "reward.py"), "/reward.py")
)


def _system_diagnostics():
    """Run once at startup to check tool availability and flag broken flags."""
    import subprocess, tempfile, os, json

    print("\n" + "="*60)
    print("SYSTEM DIAGNOSTICS")
    print("="*60)

    # gcc version
    r = subprocess.run(["gcc", "--version"], capture_output=True, text=True)
    print(f"gcc: {r.stdout.splitlines()[0] if r.returncode == 0 else 'NOT FOUND'}")

    # hyperfine version
    r = subprocess.run(["hyperfine", "--version"], capture_output=True, text=True)
    hf_ver = r.stdout.strip() if r.returncode == 0 else "NOT FOUND"
    print(f"hyperfine: {hf_ver}")

    # Test: does hyperfine --input work? (only in newer versions)
    with tempfile.TemporaryDirectory() as d:
        # write a trivial C program
        csrc = os.path.join(d, "t.c")
        with open(csrc, "w") as f:
            f.write("int main(){return 0;}\n")
        bin_ = os.path.join(d, "t.bin")
        subprocess.run(f"gcc {csrc} -o {bin_}", shell=True, capture_output=True)
        os.chmod(bin_, 0o755)

        inp = os.path.join(d, "in.txt")
        with open(inp, "w") as f:
            f.write("")
        out_json = os.path.join(d, "out.json")

        # Test --input flag
        r = subprocess.run(
            f"hyperfine --warmup 1 --runs 3 --input {inp} --export-json {out_json} '{bin_}'",
            shell=True, capture_output=True, text=True, timeout=15
        )
        input_flag_works = r.returncode == 0
        print(f"hyperfine --input flag: {'OK' if input_flag_works else 'BROKEN'}")
        if not input_flag_works:
            print(f"  stderr: {r.stderr[:300]}")

        # Test shell-redirect syntax (fallback)
        r2 = subprocess.run(
            f"hyperfine --warmup 1 --runs 3 --export-json {out_json} '{bin_} < {inp}'",
            shell=True, capture_output=True, text=True, timeout=15
        )
        redirect_works = r2.returncode == 0
        print(f"hyperfine shell redirect: {'OK' if redirect_works else 'BROKEN'}")
        if not redirect_works:
            print(f"  stderr: {r2.stderr[:300]}")

    print("="*60 + "\n")
    return input_flag_works, redirect_works


def _benchmark_binary(bin_path, input_file, temp_dir, use_redirect=False, timeout=30):
    """Run hyperfine and return (mean_ms, stderr_snippet). Returns (None, reason) on failure."""
    import subprocess, os, json

    out_json = os.path.join(temp_dir, f"{os.path.basename(bin_path)}.json")

    # First: quick sanity run to make sure binary works and isn't infinite loop
    import time
    t0 = time.time()
    r = subprocess.run(
        f"{bin_path} < {input_file}",
        shell=True, capture_output=True, timeout=10
    )
    wall_ms = (time.time() - t0) * 1000
    if r.returncode != 0:
        return None, f"quick-run failed rc={r.returncode} stderr={r.stderr[:100]}"

    if use_redirect:
        cmd = f"hyperfine --warmup 3 --runs 10 --export-json {out_json} --time-unit millisecond '{bin_path} < {input_file}'"
    else:
        cmd = f"hyperfine --warmup 3 --runs 10 --input {input_file} --export-json {out_json} --time-unit millisecond '{bin_path}'"

    r = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout)
    if r.returncode != 0:
        return None, f"hyperfine rc={r.returncode} stderr={r.stderr[:200]} (wall_ms≈{wall_ms:.1f})"

    if not os.path.exists(out_json):
        return None, f"hyperfine json missing (wall_ms≈{wall_ms:.1f})"

    try:
        with open(out_json) as f:
            data = json.load(f)
        mean = data["results"][0]["mean"] * 1000  # convert s → ms
        return mean, ""
    except Exception as e:
        return None, f"json parse error: {e} (wall_ms≈{wall_ms:.1f})"


@app.function(
    image=image,
    gpu="h100:1",
    timeout=60 * MINUTES,
    secrets=[hf_secret],
    volumes={
        "/data":                    data_vol,
        "/root/.cache/huggingface": hf_cache_vol,
        "/root/.cache/vllm":        vllm_cache_vol,
    },
)
def run_inspection(
    n_samples: int = 20,
    parquet: str = "sc_train",
    temperature: float = 0.5,
    random_seed: int = 42,
) -> list[dict]:
    import sys, os, subprocess, tempfile, time
    sys.path.insert(0, "/")

    import pandas as pd
    import numpy as np
    import vllm
    from transformers import AutoTokenizer
    from reward import compute_score, check_correctness

    # ── System checks ─────────────────────────────────────────────────────────
    input_flag_ok, redirect_ok = _system_diagnostics()
    use_redirect = not input_flag_ok and redirect_ok
    print(f"Benchmark mode: {'shell redirect' if use_redirect else '--input flag' if input_flag_ok else 'NEITHER WORKS — speedup disabled'}")

    # ── Load data ─────────────────────────────────────────────────────────────
    parquet_path = f"/data/{parquet}.parquet"
    print(f"Loading {parquet_path} ...")
    df = pd.read_parquet(parquet_path)
    samples = df.sample(n=min(n_samples, len(df)), random_state=random_seed)
    print(f"Loaded {len(samples)} / {len(df)} rows\n")

    # ── vllm ─────────────────────────────────────────────────────────────────
    tokenizer = AutoTokenizer.from_pretrained(BASE_MODEL, trust_remote_code=True)
    llm = vllm.LLM(model=BASE_MODEL, max_model_len=4096, gpu_memory_utilization=0.85)
    sampling_params = vllm.SamplingParams(temperature=temperature, max_tokens=2000, n=1)

    prompts, rows_list = [], []
    for _, row in samples.iterrows():
        msgs = row["prompt"]
        if isinstance(msgs, np.ndarray):
            msgs = msgs.tolist()
        prompts.append(tokenizer.apply_chat_template(msgs, tokenize=False, add_generation_prompt=True))
        rows_list.append(row)

    print(f"Generating {len(prompts)} responses at temperature={temperature} ...")
    outputs = llm.generate(prompts, sampling_params=sampling_params)
    print("Done.\n")

    results = []
    for i, (output, row) in enumerate(zip(outputs, rows_list)):
        raw_response = output.outputs[0].text
        response_tokens = len(output.outputs[0].token_ids)

        msgs = row["prompt"]
        if isinstance(msgs, np.ndarray):
            msgs = msgs.tolist()
        user_content = next((m["content"] for m in msgs if m["role"] == "user"), "")

        extra_info = row["extra_info"]
        ground_truth = row["reward_model"].get("ground_truth", "") if isinstance(row["reward_model"], dict) else ""

        asm = raw_response.replace("```assembly\n", "").replace("```", "")

        # ── Compile + test ────────────────────────────────────────────────────
        # Re-run compile manually to capture stderr
        compile_stderr = ""
        runtime_stderr = ""
        try:
            with tempfile.TemporaryDirectory() as d:
                asm_file = os.path.join(d, "sol.s")
                bin_file = os.path.join(d, "sol.bin")
                with open(asm_file, "w") as f:
                    f.write(asm)
                cr = subprocess.run(f"gcc {asm_file} -o {bin_file} -lm",
                                    shell=True, capture_output=True, text=True, timeout=30)
                compile_stderr = cr.stderr[:400] if cr.returncode != 0 else ""
        except Exception as e:
            compile_stderr = str(e)[:200]

        correctness, binary = check_correctness(asm, ground_truth, extra_info)

        # Capture runtime error detail
        if correctness == -0.5:
            try:
                _ei = extra_info if isinstance(extra_info, dict) else {}
                _inputs = list(_ei.get("inputs", []))
                if _inputs and binary:
                    with tempfile.TemporaryDirectory() as d:
                        bpath = os.path.join(d, "t.bin")
                        with open(bpath, "wb") as f: f.write(binary)
                        os.chmod(bpath, 0o755)
                        rr = subprocess.run(
                            bpath, input=_inputs[0].encode(),
                            capture_output=True, timeout=10
                        )
                        runtime_stderr = f"rc={rr.returncode} stderr={rr.stderr[:200]}"
            except Exception as e:
                runtime_stderr = str(e)[:200]

        compiled   = correctness != -1
        tests_pass = correctness == 1.0

        # ── Copy-paste check ──────────────────────────────────────────────────
        unopt_raw = extra_info.get("unoptimized_assembly", "") if isinstance(extra_info, dict) else ""
        unopt_stripped = unopt_raw.replace("```assembly\n", "").replace("```", "").strip()
        is_copy = (asm.strip() == unopt_stripped)

        # ── Status label ──────────────────────────────────────────────────────
        if correctness == -1:
            status = "COMPILE_FAIL"
        elif correctness == -0.5:
            status = "RUNTIME_ERR"
        elif correctness == 1.0:
            status = "ALL_PASS"
        else:
            status = f"PARTIAL_{correctness:.0%}"

        has_closing_fence = "```" in raw_response[raw_response.find("```assembly") + 11:] if "```assembly" in raw_response else False

        # ── Speedup benchmark (only for ALL_PASS) ─────────────────────────────
        reward = 0.0
        raw_speedup = None
        speedup_lines = []

        if tests_pass and binary is not None and (input_flag_ok or redirect_ok):
            reward = compute_score(None, asm, ground_truth, extra_info)
            try:
                _ei = extra_info if isinstance(extra_info, dict) else {}
                _inputs = list(_ei.get("inputs", []))[:3]
                _precomp = bytes(_ei.get("unoptimized_compiled", b""))

                if len(_inputs) > 0 and len(_precomp) > 0:
                    with tempfile.TemporaryDirectory() as d:
                        sol_bin = os.path.join(d, "sol.bin")
                        unopt_bin = os.path.join(d, "unopt.bin")
                        with open(sol_bin, "wb") as f: f.write(binary)
                        with open(unopt_bin, "wb") as f: f.write(_precomp)
                        os.chmod(sol_bin, 0o755)
                        os.chmod(unopt_bin, 0o755)

                        speedups = []
                        for j, inp_text in enumerate(_inputs):
                            inf = os.path.join(d, f"in{j}.txt")
                            with open(inf, "w") as f: f.write(inp_text)

                            u_ms, u_err = _benchmark_binary(unopt_bin, inf, d, use_redirect)
                            s_ms, s_err = _benchmark_binary(sol_bin, inf, d, use_redirect)

                            if u_ms is not None and s_ms is not None and s_ms > 0:
                                sp = u_ms / s_ms
                                speedups.append(sp)
                                speedup_lines.append(
                                    f"  input{j}: unopt={u_ms:.3f}ms  sol={s_ms:.3f}ms  speedup={sp:.3f}x"
                                )
                            else:
                                speedup_lines.append(
                                    f"  input{j}: unopt={'FAIL: '+u_err if u_ms is None else f'{u_ms:.3f}ms'}  "
                                    f"sol={'FAIL: '+s_err if s_ms is None else f'{s_ms:.3f}ms'}"
                                )

                        if speedups:
                            raw_speedup = float(np.mean(speedups))
                        else:
                            speedup_lines.append("  => no valid speedup measurements")
                else:
                    speedup_lines.append(f"  skipped: inputs={len(_inputs)} precomp={len(_precomp)}b")
            except Exception as e:
                speedup_lines.append(f"  exception: {e}")

        # ── Print ─────────────────────────────────────────────────────────────
        sp_str = f"speedup={raw_speedup:.3f}x" if raw_speedup is not None else "speedup=N/A      "
        print(f"[{i+1:2d}/{n_samples}] tokens={response_tokens:4d}  "
              f"status={status:<20s}  reward={reward:.3f}  "
              f"{sp_str:<18s}  copy={'YES' if is_copy else 'NO '}  "
              f"fence={'YES' if has_closing_fence else 'NO '}")

        # Extra detail lines
        if status == "COMPILE_FAIL" and compile_stderr:
            for line in compile_stderr.strip().splitlines()[:3]:
                print(f"          [gcc] {line}")
        if status == "RUNTIME_ERR" and runtime_stderr:
            print(f"          [run] {runtime_stderr}")
        if tests_pass and speedup_lines:
            for line in speedup_lines:
                print(f"         {line}")

        speedup_detail = "\n".join(speedup_lines)
        results.append({
            "idx":              i + 1,
            "status":           status,
            "compiled":         compiled,
            "tests_pass":       tests_pass,
            "correctness":      round(float(correctness), 3),
            "reward":           round(float(reward), 4),
            "raw_speedup":      round(raw_speedup, 4) if raw_speedup is not None else None,
            "response_tokens":  response_tokens,
            "has_closing_fence": has_closing_fence,
            "is_copy":          is_copy,
            "n_inputs":         len(extra_info.get("inputs", [])) if isinstance(extra_info, dict) else 0,
            "compile_stderr":   compile_stderr,
            "runtime_stderr":   runtime_stderr,
            "speedup_detail":   speedup_detail,
            "asm_first_200":    asm.strip()[:200],
            "prompt":           user_content,
            "response":         raw_response,
        })

    # ── Summary ───────────────────────────────────────────────────────────────
    n = len(results)
    print(f"\n{'='*60}")
    print(f"SUMMARY ({n} samples, temp={temperature}):")
    print(f"  Compile OK     : {sum(r['compiled'] for r in results)}/{n}")
    print(f"  All Tests Pass : {sum(r['tests_pass'] for r in results)}/{n}")
    print(f"  Reward > 0     : {sum(r['reward'] > 0 for r in results)}/{n}")
    print(f"  Exact copy     : {sum(r['is_copy'] for r in results)}/{n}")
    sp_vals = [r["raw_speedup"] for r in results if r["raw_speedup"] is not None]
    if sp_vals:
        import numpy as _np
        print(f"  Speedup stats  : min={min(sp_vals):.3f}x  mean={_np.mean(sp_vals):.3f}x  max={max(sp_vals):.3f}x")
    print()
    return results


@app.local_entrypoint()
def main(
    n_samples: int = 20,
    parquet: str = "sc_train",
    temperature: float = 0.5,
    out_csv: str = "inspect_results.csv",
) -> None:
    results = run_inspection.remote(n_samples=n_samples, parquet=parquet, temperature=temperature)

    out_path = HERE / out_csv
    fieldnames = [
        "idx", "status", "compiled", "tests_pass", "correctness", "reward", "raw_speedup",
        "response_tokens", "has_closing_fence", "is_copy", "n_inputs",
        "compile_stderr", "runtime_stderr", "speedup_detail", "asm_first_200",
        "prompt", "response",
    ]
    with open(out_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(results)

    print(f"\nSaved {len(results)} rows → {out_path}")
    print(f"Open with: open {out_path}")
