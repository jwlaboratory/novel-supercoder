# Gen Optimize Assembly

Assembly optimization research pipeline:
- Build Codeforces dataset with tests and accepted C++.
- Compile Linux ARM64 `-O0` / `-O3` assembly pairs.
- SFT on `O0 -> O3`.
- RL with generated candidates + scored rewards.

## Repo Structure

```text
src/
  1-build_codeforces_dataframe.py   # create/merge base CSV
  2-generate_assembly.py            # docker Linux ARM64 compile (-O0/-O3)
  3-split-dataset.py                # assign SFT/RL/VAL/TEST/SKIP
  4-sft.py                          # Modal SFT training
  5-generate-candidates.py          # Modal candidate generation for RL rows
  5-score-local.py                  # local scoring loop over candidates
  6-scorer.py                       # correctness+benchmark+reward scorer
  5-RL.py                           # Modal offline reward-weighted training
  data/
```

## Setup

```bash
uv sync
```

Requirements:
- `docker` running locally (for `2-generate_assembly.py` and scorer docker mode)
- `modal` auth configured (`uv run modal setup`)

## End-to-End Run

Use explicit paths (recommended; some script defaults still point to legacy locations).

### 1) Build CSV

```bash
uv run python src/1-build_codeforces_dataframe.py \
  --limit 1000000 \
  --output src/data/codeforces_join.csv
```

### 2) Generate assembly pairs (`-O0`, `-O3`) in Docker Linux ARM64

```bash
uv run python src/2-generate_assembly.py \
  --csv-path src/data/codeforces_join.csv \
  --docker-image gcc:13 \
  --docker-platform linux/arm64
```

### 3) Assign dataset splits

```bash
uv run python src/3-split-dataset.py \
  --csv-path src/data/codeforces_join.csv
```

### 4) Train SFT on Modal

```bash
uv run modal run src/4-sft.py \
  --csv-path src/data/codeforces_join.csv \
  --output-subdir sft/qwen2.5-coder-0.5b \
  --max-train-rows 200 \
  --max-val-rows 50 \
  --num-train-epochs 1
```

### 5) Generate RL candidates on Modal

```bash
uv run modal run src/5-generate-candidates.py \
  --csv-path src/data/codeforces_join.csv \
  --model-name-or-path /vol/sft/qwen2.5-coder-0.5b \
  --output-subdir rl/qwen2.5-coder-0.5b-localreward \
  --max-rows 50 \
  --num-candidates-per-row 4
```

Download `generated_candidates.jsonl` from:
- `/vol/rl/qwen2.5-coder-0.5b-localreward/generated_candidates.jsonl`
to:
- `src/data/generated_candidates.jsonl`

### 6) Score candidates locally (Docker Linux ARM64 toolchain)

```bash
uv run python src/5-score-local.py \
  --input-path src/data/generated_candidates.jsonl \
  --output-path src/data/scored_rollouts.jsonl
```

### 7) Train offline RL on Modal from scored rollouts

```bash
uv run modal run src/5-RL.py \
  --scored-rollouts-path src/data/scored_rollouts.jsonl \
  --model-name-or-path /vol/sft/qwen2.5-coder-0.5b \
  --output-subdir rl/qwen2.5-coder-0.5b-localreward \
  --min-reward-for-training 0
```

## Scoring Model

`6-scorer.py` evaluates each candidate in this order:
1. compile candidate assembly
2. run official tests (correctness)
3. if correct, benchmark vs `O0` and `O3`
4. compute reward

Current penalties:
- compile failure: `-1500`
- correctness failure: `-1000 + 250 * correctness_fraction`

## Notes

- Keep generation prompt format aligned with SFT prompt format.
- If compile pass rate is low, inspect:
  - candidate text format
  - scorer status counts from `5-score-local.py`
  - docker toolchain consistency (`gcc:13`, `linux/arm64`)
