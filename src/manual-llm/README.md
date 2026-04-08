going to check if we can manually put through LLM and see if it actually works/ improves

regen inputo3.s from docker linux (run inside example1):

docker run --rm --platform linux/arm64 -v "$(pwd)":/work -w /work gcc:13 gcc -S -O3 -std=c17 -o inputo3.s inputC.c

prompt: paste inputC.c and inputo3.s. want linux aarch64 gnu asm (what gcc -S makes in that docker), not mac/apple asm. only output the new .s

benchmark pipeline:
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
