#!/usr/bin/env python3
from __future__ import annotations

import json
import os
import time
from pathlib import Path
from typing import Dict, List

import modal

MINUTES = 60
MODEL_SLUG = "qwen25_coder_7b_instruct"

app = modal.App("copying-paper-qwen-modal-sglang-style")

vllm_image = (
    modal.Image.from_registry("nvidia/cuda:12.9.0-devel-ubuntu22.04", add_python="3.13")
    .entrypoint([])
    .uv_pip_install("vllm==0.13.0", "huggingface-hub==0.36.0", "transformers==4.57.1", "datasets==4.3.0")
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
)

hf_cache_vol = modal.Volume.from_name("huggingface-cache", create_if_missing=True)
vllm_cache_vol = modal.Volume.from_name("vllm-cache", create_if_missing=True)

GPU_SPEC = "h100"
MODEL_NAME = "Qwen/Qwen2.5-Coder-7B-Instruct"
MAX_OUTPUT_TOKENS = 2000
MAX_MODEL_LEN = 32768

VLLM_THROUGHPUT_KWARGS = {
    "max_model_len": MAX_MODEL_LEN,
    "attention_backend": "flashinfer",
    "async_scheduling": True,
}


def extract_assembly(raw: str) -> str:
    text = raw
    if "```assembly" in text:
        text = text[text.rfind("```assembly") + len("```assembly") :]
    if "```" in text:
        text = text[: text.rfind("```")]
    clean = text.strip()
    return clean + "\n" if clean else "\n"


def _load_split(ds_name: str, split: str):
    from datasets import load_dataset

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


def build_fewshot_messages(ds_name: str, num_fs: int) -> List[dict]:
    if num_fs <= 0:
        return []
    fewshot = _load_split(ds_name, "fewshot")
    messages: List[dict] = []
    for item in fewshot.select(range(min(num_fs, len(fewshot)))):
        extra = _safe_get_extra(item)
        q = extra.get("question", "")
        a = extra.get("answer", "")
        if q:
            messages.append({"role": "user", "content": q})
            messages.append({"role": "assistant", "content": a})
    return messages


@app.cls(
    image=vllm_image,
    gpu=GPU_SPEC,
    timeout=60 * MINUTES,
    volumes={
        "/root/.cache/huggingface": hf_cache_vol,
        "/root/.cache/vllm": vllm_cache_vol,
    },
)
class Vllm:
    @modal.enter()
    def start(self):
        import vllm
        from transformers import AutoTokenizer

        self.llm = vllm.LLM(model=MODEL_NAME, **VLLM_THROUGHPUT_KWARGS)
        self.tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME, trust_remote_code=True)
        self.sampling_params = vllm.SamplingParams(
            temperature=0.0,
            max_tokens=MAX_OUTPUT_TOKENS,
            n=1,
        )
        self._max_prompt_tokens = MAX_MODEL_LEN - MAX_OUTPUT_TOKENS
        _ = self.llm.generate(["warmup"], sampling_params=self.sampling_params)

    def _build_prompt(self, fewshot_messages, prompt: str) -> str:
        messages = [*fewshot_messages, {"role": "user", "content": prompt}]
        return self.tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)

    def _prompt_token_len(self, prompt_text: str) -> int:
        return len(self.tokenizer.encode(prompt_text))

    @modal.method()
    def process_batch(self, rows, fewshot_messages):
        limit = self._max_prompt_tokens
        skipped_by_row: Dict[int, dict] = {}
        prompts: List[str] = []
        to_run_rows: List[dict] = []

        for row in rows:
            row_index = int(row["row_index"])
            prompt_text = self._build_prompt(fewshot_messages, row["prompt"])
            prompt_tokens = self._prompt_token_len(prompt_text)
            if prompt_tokens > limit:
                skipped_by_row[row_index] = {
                    "row_index": row_index,
                    "status": "skipped_prompt_too_long",
                    "prompt_token_len": prompt_tokens,
                    "max_prompt_tokens": limit,
                    "raw": "",
                    "asm": "\n",
                }
            else:
                to_run_rows.append(row)
                prompts.append(prompt_text)

        outputs = []
        if prompts:
            start = time.time()
            outputs = self.llm.generate(prompts, sampling_params=self.sampling_params)
            elapsed = time.time() - start
            print(f"Generated {len(prompts)} prompts in {elapsed:.1f}s", flush=True)

        out = []
        out_idx = 0
        for row in rows:
            row_index = int(row["row_index"])
            if row_index in skipped_by_row:
                out.append(skipped_by_row[row_index])
                continue
            raw = outputs[out_idx].outputs[0].text
            out_idx += 1
            out.append(
                {
                    "row_index": row_index,
                    "status": "ok",
                    "raw": raw,
                    "asm": extract_assembly(raw),
                }
            )
        return out


@app.local_entrypoint()
def main(
    manifest: str,
    summary: str,
    workers: int = 1,
    batch_size: int = 32,
    write_mode: str = "overwrite",
    prompt_key: str = "main",
    ds_name: str = "random1123anonymized/supercoder",
    num_fs: int = 0,
    model_name: str = "Qwen/Qwen2.5-Coder-7B-Instruct",
) -> None:
    global MODEL_NAME
    if write_mode not in {"overwrite", "skip"}:
        raise ValueError("write_mode must be overwrite|skip")
    if prompt_key not in {"main", "c_only"}:
        raise ValueError("prompt_key must be main|c_only")
    MODEL_NAME = model_name

    manifest = Path(manifest)
    summary = Path(summary)
    prompt_filename = "prompt_supercoder_main.txt" if prompt_key == "main" else "prompt_supercoder_c_only.txt"

    rows = []
    with manifest.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rec = json.loads(line)
            row_dir = Path(rec["row_dir"])
            out_dir = row_dir / "out"
            raw_file = out_dir / f"{MODEL_SLUG}.raw.txt"
            asm_file = out_dir / f"{MODEL_SLUG}.s"
            if write_mode == "skip" and raw_file.exists() and asm_file.exists():
                rows.append({"row_index": rec["row_index"], "row_dir": rec["row_dir"], "skip": True})
                continue
            prompt = (row_dir / prompt_filename).read_text(encoding="utf-8", errors="replace")
            rows.append({"row_index": rec["row_index"], "row_dir": rec["row_dir"], "skip": False, "prompt": prompt})

    to_generate = [r for r in rows if not r["skip"]]
    skipped = [r for r in rows if r["skip"]]
    fewshot_messages = build_fewshot_messages(ds_name, num_fs)

    summary.parent.mkdir(parents=True, exist_ok=True)
    if not to_generate:
        with summary.open("w", encoding="utf-8") as out:
            for rec in skipped:
                row_dir = Path(rec["row_dir"])
                out.write(
                    json.dumps(
                        {
                            "row_index": rec["row_index"],
                            "model": MODEL_NAME,
                            "status": "skipped_existing",
                            "raw_file": str(row_dir / "out" / f"{MODEL_SLUG}.raw.txt"),
                            "asm_file": str(row_dir / "out" / f"{MODEL_SLUG}.s"),
                        },
                        ensure_ascii=False,
                    )
                    + "\n"
                )
        return

    batches = [to_generate[i : i + batch_size] for i in range(0, len(to_generate), batch_size)]
    engines = [Vllm() for _ in range(workers)]
    jobs = []
    for i, batch in enumerate(batches):
        engine = engines[i % workers]
        jobs.append((batch, engine.process_batch.spawn(batch, fewshot_messages)))

    done = 0
    with summary.open("w", encoding="utf-8") as out:
        for rec in skipped:
            row_dir = Path(rec["row_dir"])
            out.write(
                json.dumps(
                    {
                        "row_index": rec["row_index"],
                        "model": MODEL_NAME,
                        "status": "skipped_existing",
                        "raw_file": str(row_dir / "out" / f"{MODEL_SLUG}.raw.txt"),
                        "asm_file": str(row_dir / "out" / f"{MODEL_SLUG}.s"),
                    },
                    ensure_ascii=False,
                )
                + "\n"
            )

        for batch, call in jobs:
            try:
                batch_out = call.get()
            except Exception as exc:  # noqa: BLE001
                for rec in batch:
                    row_dir = Path(rec["row_dir"])
                    out_dir = row_dir / "out"
                    out_dir.mkdir(parents=True, exist_ok=True)
                    raw_file = out_dir / f"{MODEL_SLUG}.raw.txt"
                    asm_file = out_dir / f"{MODEL_SLUG}.s"
                    out.write(
                        json.dumps(
                            {
                                "row_index": rec["row_index"],
                                "model": MODEL_NAME,
                                "status": "modal_error",
                                "error": str(exc),
                                "raw_file": str(raw_file),
                                "asm_file": str(asm_file),
                            },
                            ensure_ascii=False,
                        )
                        + "\n"
                    )
                    done += 1
                continue

            for gen in batch_out:
                row_idx = int(gen["row_index"])
                row_dir = Path(next(r["row_dir"] for r in batch if int(r["row_index"]) == row_idx))
                out_dir = row_dir / "out"
                out_dir.mkdir(parents=True, exist_ok=True)
                raw_file = out_dir / f"{MODEL_SLUG}.raw.txt"
                asm_file = out_dir / f"{MODEL_SLUG}.s"
                raw_file.write_text(gen.get("raw", ""), encoding="utf-8")
                asm_file.write_text(gen.get("asm", "\n"), encoding="utf-8")
                rec = {
                    "row_index": row_idx,
                    "model": MODEL_NAME,
                    "status": gen.get("status", "ok"),
                    "raw_file": str(raw_file),
                    "asm_file": str(asm_file),
                }
                if rec["status"] == "skipped_prompt_too_long":
                    rec["prompt_token_len"] = gen.get("prompt_token_len")
                    rec["max_prompt_tokens"] = gen.get("max_prompt_tokens")
                out.write(json.dumps(rec, ensure_ascii=False) + "\n")
                done += 1
                print(f"[{done}/{len(to_generate)}] row_{row_idx:05d} ({rec['status']})", flush=True)
