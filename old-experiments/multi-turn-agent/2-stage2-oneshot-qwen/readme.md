# Stage 2: One-shot assembly generation (Qwen2.5-Coder-7B-Instruct)

Runs Qwen2.5-Coder-7B-Instruct on each row's `prompt_one_shot` to generate
optimized assembly in a single pass. Output column: `output_one_shot_qwen`.

```bash
# Run on val set
modal run run_qwen_oneshot.py --split val

# Run on train set with more parallelism
modal run run_qwen_oneshot.py --split train --batch-size 64 --workers 2
```
