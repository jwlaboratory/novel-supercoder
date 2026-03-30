# Gen Optimize Assembly

## Motivation
<img width="775" height="375" alt="Screenshot 2026-03-30 at 1 51 07 AM" src="https://github.com/user-attachments/assets/7213ef77-8579-4ca8-94d3-9ef86f6059c8" />

#

> "By the end of this year, [we'll get to] a point you don't even bother coding, the AI just creates the binary directly and it can create a much more efficient binary than by any compiler. So just say create optimized binary for this particular outcome and you actually bypass even traditional coding. [Coding] is an intermediate step that actually will not be needed"
Elon Musk, 11:50 https://www.youtube.com/watch?v=aOVnB88Cd1A

#

Elon states that one day AI will directly generate optimized binaries of programs. This repo is a small research prototype in that direction.

## Core Idea
We compile accepted competitive-programming solutions at two optimization levels:

- `-O0` assembly as the input program
- `-O3` assembly as a strong baseline and SFT target

We then train a small model in two stages:

1. `SFT`: learn the shape of valid optimized assembly by mapping `O0 -> O3`
2. `RL`: optimize beyond imitation by rewarding outputs that are correct and faster than baseline

## Why Competitive Programming Data
Competitive-programming datasets are useful here because they give us:

- lots of short, self-contained programs
- official input/output tests for correctness checking
- accepted source code we can compile under a fixed toolchain

That makes it possible to score candidate assembly automatically:

- first for correctness
- then for efficiency

## Current Pipeline
The active workflow lives in `src/codeforces-approach`.

### 1. Build the base dataset
`1-build_codeforces_dataframe.py` joins Codeforces problem metadata with one accepted C++ solution per problem.

Each row contains:

- `contest_id`
- `index`
- `official_tests`
- `accepted_cpp_solution`

Important behavior:

- rerunning the script with the same output CSV preserves existing rows
- only truly new `(contest_id, index)` rows are appended
- existing rows win so downstream annotations are not wiped out

### 2. Generate assembly pairs
`2-generate_assembly.py` compiles each accepted solution under a fixed Linux ARM64 Docker toolchain and stores:

- `assembly_o0`
- `assembly_o3`
- compile metadata

Important behavior:

- rerunning the script skips rows that already have both assembly columns
- use `--force` only when you explicitly want to regenerate existing rows

### 3. Split the dataset
`3-split-dataset.py` assigns a persistent split label per row:

- `SFT`
- `RL`
- `VAL`
- `TEST`
- `SKIP`

Current target ratios:

- `60%` SFT
- `15%` RL
- `10%` VAL
- `15%` TEST

Important behavior:

- only previously unlabeled rows are assigned
- rows missing required fields are marked `SKIP`
- new rows are used to rebalance toward the target ratios

### 4. Run supervised fine-tuning
`4-sft.py` runs Modal-based SFT on the `SFT` split and evaluates on `VAL`.

The current setup uses:

- a small coder model
- `assembly_o0` as the prompt
- `assembly_o3` as the target

The purpose of SFT is not to solve the whole problem. It is mainly there to teach:

- valid assembly syntax
- ABI / calling-convention patterns
- the general shape of optimized assembly

## Why SFT Before RL
Starting with RL from scratch is possible, but it is very inefficient.

Without SFT, a small model will mostly generate invalid assembly early on:

- it may fail to assemble
- it may break calling conventions
- it may fail correctness checks

That creates a very sparse reward signal. SFT moves the model into the neighborhood of valid optimized assembly before RL begins.

## Planned RL Stage
The goal of RL is not to copy `-O3` more faithfully. The goal is to beat the baseline when possible.

### Proposed RL design
Use the `RL` split only.

For each RL row:

1. load the `assembly_o0` input
2. sample multiple candidate assembly outputs from the SFT checkpoint
3. score each candidate with a separate scoring script
4. keep the reward and structured metrics
5. train on those scored candidates with an offline RL style objective

### Why offline RL first
Offline RL is the safest first version because it is easier to debug than a fully online loop.

A good first pass is:

1. generate `k` candidates per RL row
2. score them all
3. keep rewards and metadata
4. fine-tune toward higher-reward outputs or preferences

That gives us a practical research loop without needing to run expensive online updates after every single sample.

## Scoring Plan
RL depends on a separate scorer.

The scorer should evaluate a candidate assembly program in stages:

1. assemble / link successfully
2. pass correctness checks on official tests
3. if correct, benchmark runtime against `O0` and `O3`
4. compute a final reward

### Reward philosophy
Correctness dominates everything.

A wrong program should receive a large negative reward. A correct program is then ranked by efficiency.

The reward should mainly depend on:

- correctness pass/fail
- speedup vs baseline
- a small secondary bonus for code size reduction

## Benchmarking Plan
Use:

- `VAL` during development
- `TEST` only at the very end

Final reported metrics should include:

- assemble rate
- correctness pass rate
- median speedup vs `O0`
- median speedup vs `O3`
- fraction of tasks that beat `O3`

## Environment
This project currently assumes a fixed Linux ARM64 compilation target to keep evaluation consistent across runs.

## Running The Pipeline
```bash
uv sync

uv run python "src/codeforces-approach/1-build_codeforces_dataframe.py" --limit 1000000 --output "src/codeforces-approach/data"
uv run python "src/codeforces-approach/2-generate_assembly.py"
uv run python "src/codeforces-approach/3-split-dataset.py"

modal run "src/codeforces-approach/4-sft.py" --max-train-rows 200 --max-val-rows 50 --num-train-epochs 1
```

## Near-Term Roadmap
1. Finish and validate SFT on the `SFT` split.
2. Build a standalone scorer for correctness and runtime.
3. Implement `5-RL.py` for offline RL on the `RL` split.
4. Benchmark on `VAL`.
5. Run one final untouched evaluation on `TEST`.
