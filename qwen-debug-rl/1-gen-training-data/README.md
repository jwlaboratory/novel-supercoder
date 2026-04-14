# 1-gen-training-data

Generate debug RL training data: download SuperCoder, run Qwen inference, identify failures.

```bash
./run.bash --1,2,3 --split=val   # full pipeline (download → inference → identify fails)
./run.bash --3 --split=val       # just stage 3 (needs inference CSV + Docker supercoder-x86-bench)
```

Stage 3 compiles/tests assembly inside `supercoder-x86-bench` Docker (Linux x86-64 gcc) — **do not** run gcc on macOS/ARM, results will be wrong.

TODO: Update to use our benchmarks
