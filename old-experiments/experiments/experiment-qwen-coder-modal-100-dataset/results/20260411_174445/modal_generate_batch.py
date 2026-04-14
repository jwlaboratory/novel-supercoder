from __future__ import annotations

import argparse
import json
import re
import time
from pathlib import Path

import modal

MINUTES = 60

app = modal.App("qwen-coder-bench-vllm")

vllm_image = (
    modal.Image.from_registry(
        "nvidia/cuda:12.9.0-devel-ubuntu22.04", add_python="3.13"
    )
    .entrypoint([])
    .uv_pip_install("vllm==0.13.0", "huggingface-hub==0.36.0")
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
)

hf_cache_vol = modal.Volume.from_name("huggingface-cache", create_if_missing=True)
vllm_cache_vol = modal.Volume.from_name("vllm-cache", create_if_missing=True)


def extract_assembly(raw: str) -> str:
    """Extract assembly from model output, matching SuperCoder's parsing logic."""
    text = raw
    if '```assembly' in text:
        text = text[text.rfind('```assembly') + len('```assembly'):]
    if '```' in text:
        text = text[:text.rfind('```')]
    return text.strip() + "\n" if text.strip() else "\n"


GPU_SPEC = "h100"
MODEL_NAME = "Qwen/Qwen2.5-Coder-7B-Instruct"

# One row = one chat request. Prompt is C + full gcc -O3 asm (+ fences); some rows tokenize
# far beyond typical limits. Rows over (max_model_len - max_output) are skipped, not failed.
MAX_OUTPUT_TOKENS = 2000
MAX_MODEL_LEN = 32768

VLLM_THROUGHPUT_KWARGS = {
    "max_model_len": MAX_MODEL_LEN,
    "attention_backend": "flashinfer",
    "async_scheduling": True,
}


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

        print(f"Loading model {MODEL_NAME} with vLLM ...", flush=True)
        self.llm = vllm.LLM(model=MODEL_NAME, **VLLM_THROUGHPUT_KWARGS)
        self.sampling_params = self.llm.get_default_sampling_params()
        self.sampling_params.max_tokens = MAX_OUTPUT_TOKENS
        self.sampling_params.temperature = 0.0
        self._max_prompt_tokens = MAX_MODEL_LEN - MAX_OUTPUT_TOKENS

        self.llm.chat(
            [{"role": "user", "content": "Is this thing on?"}],
            sampling_params=self.sampling_params,
        )
        print("Model loaded and warmed up.", flush=True)

    def _chat_prompt_token_len(self, user_text: str) -> int:
        tok = self.llm.get_tokenizer()
        messages = [{"role": "user", "content": user_text}]
        if hasattr(tok, "apply_chat_template"):
            try:
                ids = tok.apply_chat_template(
                    messages,
                    tokenize=True,
                    add_generation_prompt=True,
                )
                if hasattr(ids, "shape"):
                    return int(ids.shape[0])
                return len(ids)
            except Exception:
                pass
        return len(tok.encode(user_text))

    @modal.method()
    def process_batch(self, rows: list[dict]) -> list[dict]:
        limit = self._max_prompt_tokens
        to_run: list[dict] = []
        skipped_by_row: dict[int, dict] = {}

        for r in rows:
            rid = int(r["row_index"])
            n = self._chat_prompt_token_len(r["prompt"])
            if n > limit:
                skipped_by_row[rid] = {
                    "row_index": rid,
                    "raw": "",
                    "asm": "\n",
                    "status": "skipped_prompt_too_long",
                    "prompt_token_len": n,
                    "max_prompt_tokens": limit,
                }
            else:
                to_run.append(r)

        responses: list = []
        if to_run:
            messages_list = [[{"role": "user", "content": r["prompt"]}] for r in to_run]
            start = time.time()
            responses = self.llm.chat(messages_list, sampling_params=self.sampling_params)
            duration_s = time.time() - start
            in_toks = sum(len(r.prompt_token_ids) for r in responses)
            out_toks = sum(len(r.outputs[0].token_ids) for r in responses)
            print(
                f"batch vllm {len(to_run)}/{len(rows)} rows: {in_toks} in-tok, {out_toks} out-tok "
                f"in {duration_s:.1f}s",
                flush=True,
            )
        if skipped_by_row:
            print(
                f"batch skipped {len(skipped_by_row)} row(s) (chat prompt > {limit} tok): "
                f"{sorted(skipped_by_row.keys())}",
                flush=True,
            )

        ri = 0
        out: list[dict] = []
        for r in rows:
            rid = int(r["row_index"])
            if rid in skipped_by_row:
                out.append(skipped_by_row[rid])
                continue
            resp = responses[ri]
            ri += 1
            raw = resp.outputs[0].text
            out.append(
                {
                    "row_index": rid,
                    "raw": raw,
                    "asm": extract_assembly(raw),
                    "status": "ok",
                }
            )
        return out

    @modal.exit()
    def stop(self):
        del self.llm


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", required=True)
    parser.add_argument("--summary", required=True)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--batch-size", type=int, default=50)
    parser.add_argument("--write-mode", choices=["overwrite", "skip"], default="overwrite")
    args = parser.parse_args()

    manifest = Path(args.manifest)
    summary = Path(args.summary)

    records: list[dict] = []
    with manifest.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rec = json.loads(line)
            row_dir = Path(rec["row_dir"])
            out_dir = row_dir / "out"

            raw_file = out_dir / "qwen25_coder_7b_instruct.raw.txt"
            asm_file = out_dir / "qwen25_coder_7b_instruct.s"

            if args.write_mode == "skip" and raw_file.exists() and asm_file.exists():
                records.append(
                    {
                        "row_index": rec["row_index"],
                        "row_dir": rec["row_dir"],
                        "prompt": None,
                        "skip": True,
                    }
                )
                continue

            c_content = (row_dir / "inputC.c").read_text(encoding="utf-8", errors="replace")
            o3_content = (row_dir / "inputo3.s").read_text(encoding="utf-8", errors="replace")
            prompt = (
                "Given the following C code and assembly code, your task is to generate highly "
                "optimized x86-64 assembly code.\n"
                "C Code:\n\n"
                f"```c\n{c_content}```\n\n"
                "Assembly Code:\n\n"
                f"```assembly\n{o3_content}```\n\n"
                "Only output the optimized assembly code. Do not include any other text. Do not "
                "write any comments in the assembly code. Wrap the assembly code in ```assembly``` tags.\n"
                "Optimized Assembly Code:\n"
            )
            records.append(
                {
                    "row_index": rec["row_index"],
                    "row_dir": rec["row_dir"],
                    "prompt": prompt,
                    "skip": False,
                }
            )

    to_generate = [r for r in records if not r.get("skip")]
    skipped = [r for r in records if r.get("skip")]
    total = len(records)
    print(f"Total rows: {total}, to generate: {len(to_generate)}, skipped: {len(skipped)}", flush=True)

    if not to_generate:
        print("Nothing to generate.", flush=True)
        summary.parent.mkdir(parents=True, exist_ok=True)
        with summary.open("w", encoding="utf-8") as out:
            for rec in skipped:
                out.write(
                    json.dumps(
                        {
                            "row_index": rec["row_index"],
                            "model": MODEL_NAME,
                            "status": "skipped_existing",
                            "raw_file": str(Path(rec["row_dir"]) / "out" / "qwen25_coder_7b_instruct.raw.txt"),
                            "asm_file": str(Path(rec["row_dir"]) / "out" / "qwen25_coder_7b_instruct.s"),
                        },
                        ensure_ascii=False,
                    )
                    + "\n"
                )
        return

    batches: list[list[dict]] = []
    for i in range(0, len(to_generate), args.batch_size):
        batches.append(to_generate[i : i + args.batch_size])

    print(f"Dispatching {len(batches)} batch(es) across {args.workers} worker(s) ...", flush=True)

    summary.parent.mkdir(parents=True, exist_ok=True)
    with app.run():
        engines = [Vllm() for _ in range(args.workers)]

        jobs = []
        for batch_idx, batch in enumerate(batches):
            engine = engines[batch_idx % args.workers]
            call = engine.process_batch.spawn(batch)
            jobs.append((batch_idx, batch, call))

        with summary.open("w", encoding="utf-8") as out:
            for rec in skipped:
                out.write(
                    json.dumps(
                        {
                            "row_index": rec["row_index"],
                            "model": MODEL_NAME,
                            "status": "skipped_existing",
                            "raw_file": str(Path(rec["row_dir"]) / "out" / "qwen25_coder_7b_instruct.raw.txt"),
                            "asm_file": str(Path(rec["row_dir"]) / "out" / "qwen25_coder_7b_instruct.s"),
                        },
                        ensure_ascii=False,
                    )
                    + "\n"
                )

            done = 0
            for batch_idx, batch, call in jobs:
                try:
                    results = call.get()
                    for gen in results:
                        row_idx = int(gen["row_index"])
                        row_dir = Path(
                            next(r["row_dir"] for r in batch if int(r["row_index"]) == row_idx)
                        )
                        out_dir = row_dir / "out"
                        out_dir.mkdir(parents=True, exist_ok=True)
                        raw_file = out_dir / "qwen25_coder_7b_instruct.raw.txt"
                        asm_file = out_dir / "qwen25_coder_7b_instruct.s"
                        raw_file.write_text(gen.get("raw", ""), encoding="utf-8")
                        asm_file.write_text(gen.get("asm", ""), encoding="utf-8")
                        st = gen.get("status", "ok")
                        rec_out = {
                            "row_index": row_idx,
                            "model": MODEL_NAME,
                            "status": st,
                            "raw_file": str(raw_file),
                            "asm_file": str(asm_file),
                        }
                        if st == "skipped_prompt_too_long":
                            rec_out["prompt_token_len"] = gen.get("prompt_token_len")
                            rec_out["max_prompt_tokens"] = gen.get("max_prompt_tokens")
                        out.write(json.dumps(rec_out, ensure_ascii=False) + "\n")
                        out.flush()
                        done += 1
                        print(f"[{done}/{len(to_generate)}] row_{row_idx:05d} ({st})", flush=True)
                except Exception as exc:  # noqa: BLE001
                    for rec in batch:
                        row_idx = int(rec["row_index"])
                        row_dir = Path(rec["row_dir"])
                        raw_file = row_dir / "out" / "qwen25_coder_7b_instruct.raw.txt"
                        asm_file = row_dir / "out" / "qwen25_coder_7b_instruct.s"
                        rec_out = {
                            "row_index": row_idx,
                            "model": MODEL_NAME,
                            "status": "modal_error",
                            "error": str(exc),
                            "raw_file": str(raw_file),
                            "asm_file": str(asm_file),
                        }
                        out.write(json.dumps(rec_out, ensure_ascii=False) + "\n")
                        out.flush()
                        done += 1
                        print(f"[{done}/{len(to_generate)}] row_{row_idx:05d} (modal_error)", flush=True)


if __name__ == "__main__":
    main()
