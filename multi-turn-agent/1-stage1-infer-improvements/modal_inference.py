"""Generic Modal vLLM batch inference.

Provides a reusable Modal app that loads any HuggingFace model with vLLM
on a GPU and runs batched inference. Can be imported and invoked from other
scripts, or run directly with `modal run modal_inference.py`.
"""
from __future__ import annotations

import time
from typing import List, Optional

import modal

MINUTES = 60

app = modal.App("generic-vllm-inference")

vllm_image = (
    modal.Image.from_registry(
        "nvidia/cuda:12.9.0-devel-ubuntu22.04", add_python="3.13"
    )
    .entrypoint([])
    .uv_pip_install(
        "vllm==0.13.0",
        "huggingface-hub==0.36.0",
        "transformers==4.57.1",
    )
    .env({"HF_XET_HIGH_PERFORMANCE": "1"})
)

hf_cache_vol = modal.Volume.from_name("huggingface-cache", create_if_missing=True)
vllm_cache_vol = modal.Volume.from_name("vllm-cache", create_if_missing=True)

DEFAULT_GPU = "b200"
DEFAULT_MAX_MODEL_LEN = 32768
DEFAULT_MAX_OUTPUT_TOKENS = 2048


@app.cls(
    image=vllm_image,
    gpu=DEFAULT_GPU,
    timeout=120 * MINUTES,
    volumes={
        "/root/.cache/huggingface": hf_cache_vol,
        "/root/.cache/vllm": vllm_cache_vol,
    },
)
class VllmEngine:
    model_name: str = "Qwen/Qwen2.5-Coder-7B-Instruct"
    max_model_len: int = DEFAULT_MAX_MODEL_LEN
    max_output_tokens: int = DEFAULT_MAX_OUTPUT_TOKENS
    temperature: float = 0.0

    @modal.enter()
    def start(self):
        import vllm
        from transformers import AutoTokenizer

        self.llm = vllm.LLM(
            model=self.model_name,
            max_model_len=self.max_model_len,
            attention_backend="flashinfer",
            async_scheduling=True,
        )
        self.tokenizer = AutoTokenizer.from_pretrained(
            self.model_name, trust_remote_code=True
        )
        self.sampling_params = vllm.SamplingParams(
            temperature=self.temperature,
            max_tokens=self.max_output_tokens,
            n=1,
        )
        self._max_prompt_tokens = self.max_model_len - self.max_output_tokens
        _ = self.llm.generate(["warmup"], sampling_params=self.sampling_params)

    def _apply_chat_template(
        self,
        user_prompt: str,
        system_prompt: Optional[str] = None,
    ) -> str:
        messages: list[dict] = []
        if system_prompt:
            messages.append({"role": "system", "content": system_prompt})
        messages.append({"role": "user", "content": user_prompt})
        return self.tokenizer.apply_chat_template(
            messages, tokenize=False, add_generation_prompt=True
        )

    def _prompt_token_len(self, prompt_text: str) -> int:
        return len(self.tokenizer.encode(prompt_text))

    @modal.method()
    def generate_batch(
        self,
        items: List[dict],
        system_prompt: Optional[str] = None,
    ) -> List[dict]:
        """Run inference on a batch of items.

        Each item must have at minimum: {"id": ..., "prompt": "..."}
        Returns list of dicts: {"id": ..., "status": ..., "output": ...}
        """
        limit = self._max_prompt_tokens
        skipped = {}
        prompts: List[str] = []
        to_run: List[dict] = []

        for item in items:
            full_prompt = self._apply_chat_template(item["prompt"], system_prompt)
            token_len = self._prompt_token_len(full_prompt)
            if token_len > limit:
                skipped[item["id"]] = {
                    "id": item["id"],
                    "status": "skipped_prompt_too_long",
                    "prompt_tokens": token_len,
                    "output": "",
                }
            else:
                to_run.append(item)
                prompts.append(full_prompt)

        outputs = []
        if prompts:
            t0 = time.time()
            outputs = self.llm.generate(prompts, sampling_params=self.sampling_params)
            elapsed = time.time() - t0
            print(
                f"Generated {len(prompts)} prompts in {elapsed:.1f}s",
                flush=True,
            )

        results = []
        out_idx = 0
        for item in items:
            if item["id"] in skipped:
                results.append(skipped[item["id"]])
                continue
            raw = outputs[out_idx].outputs[0].text
            out_idx += 1
            results.append({
                "id": item["id"],
                "status": "ok",
                "output": raw,
            })
        return results
