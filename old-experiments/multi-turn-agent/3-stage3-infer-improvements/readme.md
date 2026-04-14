# Stage 3: Infer potential improvements (Qwen2.5-Coder-7B-Instruct)

Sends each row's `prompt_infer_improvement` to Qwen2.5-Coder-7B-Instruct to
identify concrete optimization opportunities. Output column: `improvements`.

```bash
# Run on val set (200 rows)
modal run run_qwen_inference.py --split val

# Run on train set (7872 rows) with more parallelism
modal run run_qwen_inference.py --split train --batch-size 64 --workers 2
```
