# Run on val set (200 rows)
modal run run_qwen_inference.py --split val

# Run on train set (7872 rows) with more parallelism
modal run run_qwen_inference.py --split train --batch-size 64 --workers 2