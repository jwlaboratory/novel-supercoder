motivation: going to check if we can manually put through LLM and see if it actually works/ improves

1. generate inputo3.s from docker linux from inputC.c
```bash
docker run --rm --platform linux/arm64 -v "$(pwd)":/work -w /work gcc:13 gcc -S -O3 -std=c17 -o inputo3.s inputC.c
```

prompt: 
```
Given the following C code and 03 optimized code, edit the code to make it run faster. Only output the new assembly, for linux aarch64 gnu asm
```

benchmark pipeline:
```bash
hyperfine-bench out/deepseekv3.s \
  --reference ./inputC.c \
  --tests input_tests.json \
  --language c \
  --use-docker \
  --docker-image gcc:13 \
  --docker-platform linux/arm64 \
  --runs 10 \
  --hyperfine-warmup 3 \
  --hyperfine-prepare "sync" \
  --timing-summary \
  --timing-chart \
  --pretty
```