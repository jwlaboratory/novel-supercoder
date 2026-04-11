1. take 100 random rows from the data
2. use modal to run qwen2.5-coder-7b-instruct to generate x86 on linux with gcc
3. it should save the benchmark in a new column for each


generation
1. Generate Linux x86_64 `-O3` assembly for all rows (single shared Docker container)
2. Generate optimized assembly with Modal + Qwen2.5-Coder-7B-Instruct for all rows
3. Run local benchmarks row-by-row and export merged CSV


```bash
cd /Users/shreybirmiwal/projects/jwlabs/novel-supercoder/src/experiments/experiment-qwen-coder-modal-100-dataset

./1_generate_o3_all.sh --data-csv ./data.csv

./2_generate_modal_all.sh \
  --run-dir ./results/20260411_174445 \
  --modal-model Qwen/Qwen2.5-Coder-7B-Instruct \
  --modal-gpu h100

./3_run_benchmark_all.sh \
  --run-dir ./results/<run_id> \
  --runs 10 \
  --warmup 3
  ```


  20260411_174445