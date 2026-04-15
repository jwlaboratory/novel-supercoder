```bash

# Usage:
#   bash run_rl.sh --qwen-debug
#   bash run_rl.sh --qwen-supercoder-debug
#   bash run_rl.sh --qwen-debug-supercoder    # prints TO BE IMPLEMENTED

reward it based on:
  -1.0  → compile failure
  -0.5  → runtime error on any test
   0.0  → wrong output on any test (all-or-nothing: must pass ALL tests)
   1.0  → all tests passed

```