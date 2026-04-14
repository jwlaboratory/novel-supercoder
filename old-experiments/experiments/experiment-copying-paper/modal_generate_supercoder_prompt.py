#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import time
from pathlib import Path

import modal

MINUTES = 60
MODEL_SLUG = "qwen25_coder_7b_instruct"

app = modal.App("copying-paper-qwen-modal")

vllm_image = (
    modal.Image.from_registry("nvidia/cuda:12.9.0-devel-ubuntu22.04", add_python="3.13")
    .entrypoint([])
    .uv_pip_install("vllm==0.13.0", "huggingface-hub==0.36.0")
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


def build_fewshot_messages(ds_name: str, num_fs: int) -> list[dict]:
    if num_fs <= 0:
        return []
    fewshot = _load_split(ds_name, "fewshot")
    messages: list[dict] = []
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

        self.llm = vllm.LLM(model=MODEL_NAME, **VLLM_THROUGHPUT_KWARGS)
        self.sampling_params = self.llm.get_default_sampling_params()
        self.sampling_params.max_tokens = MAX_OUTPUT_TOKENS
        self.sampling_params.temperature = 0.0
        self._max_prompt_tokens = MAX_MODEL_LEN - MAX_OUTPUT_TOKENS

        self.llm.chat([{"role": "user", "content": "warmup"}], sampling_params=self.sampling_params)

    def _chat_prompt_token_len(self, messages: list[dict]) -> int:
        tok = self.llm.get_tokenizer()
        if hasattr(tok, "apply_chat_template"):
            ids = tok.apply_chat_template(messages, tokenize=True, add_generation_prompt=True)
            if hasattr(ids, "shape"):
                return int(ids.shape[0])
            return len(ids)
        joined = "\n".join(str(m.get("content", "")) for m in messages)
        return len(tok.encode(joined))

    @modal.method()
    def process_batch(self, rows: list[dict], fewshot_messages: list[dict]) -> list[dict]:
        limit = self._max_prompt_tokens
        skipped_by_row: dict[int, dict] = {}
        to_run: list[tuple[dict, list[dict]]] = []

        for row in rows:
            row_index = int(row["row_index"])
            prompt = row["prompt"]
            messages = [*fewshot_messages, {"role": "user", "content": prompt}]
            prompt_tokens = self._chat_prompt_token_len(messages)
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
                to_run.append((row, messages))

        responses = []
        if to_run:
            messages_list = [m for _, m in to_run]
            start = time.time()
            responses = self.llm.chat(messages_list, sampling_params=self.sampling_params)
            elapsed = time.time() - start
            print(f"Generated {len(to_run)} prompts in {elapsed:.1f}s", flush=True)

        out = []
        resp_idx = 0
        for row in rows:
            row_index = int(row["row_index"])
            if row_index in skipped_by_row:
                out.append(skipped_by_row[row_index])
                continue
            raw = responses[resp_idx].outputs[0].text
            resp_idx += 1
            out.append(
                {
                    "row_index": row_index,
                    "status": "ok",
                    "raw": raw,
                    "asm": extract_assembly(raw),
                }
            )
        return out


def main() -> None:
    global MODEL_NAME
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", required=True)
    parser.add_argument("--summary", required=True)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--batch-size", type=int, default=32)
    parser.add_argument("--write-mode", choices=["overwrite", "skip"], default="overwrite")
    parser.add_argument("--prompt-key", choices=["main", "c_only"], default="main")
    parser.add_argument("--ds-name", default="random1123anonymized/supercoder")
    parser.add_argument("--num-fs", type=int, default=0)
    parser.add_argument("--model-name", default="Qwen/Qwen2.5-Coder-7B-Instruct")
    args = parser.parse_args()
    MODEL_NAME = args.model_name

    manifest = Path(args.manifest)
    summary = Path(args.summary)
    prompt_filename = "prompt_supercoder_main.txt" if args.prompt_key == "main" else "prompt_supercoder_c_only.txt"

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
            if args.write_mode == "skip" and raw_file.exists() and asm_file.exists():
                rows.append(
                    {
                        "row_index": rec["row_index"],
                        "row_dir": rec["row_dir"],
                        "skip": True,
                    }
                )
                continue
            prompt = (row_dir / prompt_filename).read_text(encoding="utf-8", errors="replace")
            rows.append(
                {
                    "row_index": rec["row_index"],
                    "row_dir": rec["row_dir"],
                    "skip": False,
                    "prompt": prompt,
                }
            )

    to_generate = [r for r in rows if not r["skip"]]
    skipped = [r for r in rows if r["skip"]]
    fewshot_messages = build_fewshot_messages(args.ds_name, args.num_fs)

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

    batches = [to_generate[i : i + args.batch_size] for i in range(0, len(to_generate), args.batch_size)]
    with app.run():
        engines = [Vllm() for _ in range(args.workers)]
        jobs = []
        for i, batch in enumerate(batches):
            engine = engines[i % args.workers]
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


if __name__ == "__main__":
    main()
