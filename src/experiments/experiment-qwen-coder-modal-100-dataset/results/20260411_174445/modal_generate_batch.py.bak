from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

import modal

GPU_SPEC = "h100"

app = modal.App("qwen-coder-bench-generate-all")
image = (
    modal.Image.debian_slim(python_version="3.11")
    .apt_install("git")
    .pip_install("torch", "transformers", "accelerate", "sentencepiece")
)


def sanitize_assembly_text(raw: str) -> str:
    fenced = re.findall(r"```(?:[a-zA-Z0-9_+-]*)\n(.*?)```", raw, flags=re.S)
    text = max(fenced, key=len) if fenced else raw
    cleaned = []
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("```"):
            continue
        if s.startswith("# ") or s.startswith("## "):
            continue
        if s.startswith("- "):
            continue
        if s.lower().startswith(("here is", "explanation", "note:", "output:")):
            continue
        cleaned.append(line.rstrip())
    start = 0
    asm_re = re.compile(r'^\s*(\.|[A-Za-z_.$][\w.$]*:|\t[a-z]|[a-z]{2,}\s)')
    for i, line in enumerate(cleaned):
        if asm_re.match(line):
            start = i
            break
    return ("\n".join(cleaned[start:]).strip() + "\n")


@app.cls(image=image, gpu=GPU_SPEC, timeout=24 * 60 * 60)
class Generator:
    def __init__(self, model_name_or_path: str):
        self.model_name_or_path = model_name_or_path

    @modal.enter()
    def load(self) -> None:
        import torch
        from transformers import AutoModelForCausalLM, AutoTokenizer

        self.torch = torch
        self.tokenizer = AutoTokenizer.from_pretrained(self.model_name_or_path)
        if self.tokenizer.pad_token is None:
            self.tokenizer.pad_token = self.tokenizer.eos_token

        self.model = AutoModelForCausalLM.from_pretrained(
            self.model_name_or_path,
            torch_dtype=torch.float16 if torch.cuda.is_available() else torch.float32,
        )
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.model.to(self.device)
        self.model.eval()

    @modal.method()
    def generate_one(self, prompt: str) -> dict:
        with self.torch.no_grad():
            encoded = self.tokenizer(prompt, return_tensors="pt", truncation=True, max_length=4096)
            encoded = {k: v.to(self.device) for k, v in encoded.items()}
            out_ids = self.model.generate(
                **encoded,
                do_sample=True,
                temperature=0.2,
                top_p=0.95,
                max_new_tokens=2048,
                pad_token_id=self.tokenizer.pad_token_id,
                eos_token_id=self.tokenizer.eos_token_id,
            )
        prompt_len = encoded["input_ids"].shape[1]
        raw = self.tokenizer.decode(out_ids[0][prompt_len:], skip_special_tokens=True)
        return {"raw": raw, "asm": sanitize_assembly_text(raw)}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", required=True)
    parser.add_argument("--model", required=True)
    parser.add_argument("--summary", required=True)
    parser.add_argument("--workers", type=int, default=1)
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
            c_content = (row_dir / "inputC.c").read_text(encoding="utf-8", errors="replace")
            o3_content = (row_dir / "inputo3.s").read_text(encoding="utf-8", errors="replace")
            prompt = (
                "Given the following C code and assembly code, your task is to generate highly\n"
                "optimized x86-64 assembly code.\n"
                "C Code:\n"
                f"{c_content}\n"
                "Assembly Code:\n"
                f"{o3_content}\n"
                "Only output the optimized assembly code. Do not include any other text. Do not\n"
                "write any comments in the assembly code. Wrap the assembly code in assembly tags.\n"
                "Optimized Assembly Code:\n"
            )
            records.append({"row_index": rec["row_index"], "row_dir": rec["row_dir"], "prompt": prompt})

    total = len(records)
    summary.parent.mkdir(parents=True, exist_ok=True)
    with app.run():
        workers = max(1, args.workers)
        generators = [Generator(args.model) for _ in range(workers)]
        tasks = []
        for i, rec in enumerate(records):
            g = generators[i % workers]
            call = g.generate_one.spawn(rec["prompt"])
            tasks.append((i + 1, rec, call))

        with summary.open("w", encoding="utf-8") as out:
            for i, rec, call in tasks:
                row_idx = int(rec["row_index"])
                row_dir = Path(rec["row_dir"])
                out_dir = row_dir / "out"
                out_dir.mkdir(parents=True, exist_ok=True)
                raw_file = out_dir / "qwen25_coder_7b_instruct.raw.txt"
                asm_file = out_dir / "qwen25_coder_7b_instruct.s"

                if args.write_mode == "skip" and raw_file.exists() and asm_file.exists():
                    line = {
                        "row_index": row_idx,
                        "model": args.model,
                        "status": "skipped_existing",
                        "raw_file": str(raw_file),
                        "asm_file": str(asm_file),
                    }
                    out.write(json.dumps(line, ensure_ascii=False) + "\n")
                    out.flush()
                    print(f"[{i}/{total}] modal -> row_{row_idx:05d} (skipped_existing)", flush=True)
                    continue

                try:
                    generated = call.get()
                    raw_file.write_text(generated.get("raw", ""), encoding="utf-8")
                    asm_file.write_text(generated.get("asm", ""), encoding="utf-8")
                    line = {
                        "row_index": row_idx,
                        "model": args.model,
                        "status": "ok",
                        "raw_file": str(raw_file),
                        "asm_file": str(asm_file),
                    }
                except Exception as exc:  # noqa: BLE001
                    line = {
                        "row_index": row_idx,
                        "model": args.model,
                        "status": "modal_error",
                        "error": str(exc),
                        "raw_file": str(raw_file),
                        "asm_file": str(asm_file),
                    }
                out.write(json.dumps(line, ensure_ascii=False) + "\n")
                out.flush()
                print(f"[{i}/{total}] modal -> row_{row_idx:05d} ({line['status']})", flush=True)


if __name__ == "__main__":
    main()
