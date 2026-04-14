# Stage 1: One-shot assembly generation (SuperCoder PPO)

Runs the SuperCoder PPO model on each row's `prompt_one_shot` to generate
optimized assembly in a single pass. Output column: `output_one_shot_supercoder`.

```bash
# Run on val set
modal run run_supercoder_oneshot.py --split val

# Run on train set with more parallelism
modal run run_supercoder_oneshot.py --split train --batch-size 64 --workers 2
```
