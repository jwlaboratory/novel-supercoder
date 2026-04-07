# CodeNet C Dataset Pipeline

End-to-end pipeline to download IBM's Project CodeNet, filter for accepted C submissions with test cases, and push to Hugging Face.

## Quick Start

```bash
# Do everything in one shot (download + filter + JSONL)
./setup.sh

# Then push to Hugging Face
python3 to_hf_dataset.py --push yourname/codenet-accepted-c
```

## Step-by-Step

### 1. Download the raw data

```bash
./setup.sh --download
```

This downloads two datasets:
- **Project CodeNet** (~7.8 GB `.tar.gz` / ~40 GB uncompressed) — 14M code submissions across 4,000+ competitive programming problems
- **Merged test cases** (~1.4 GB) — input/output pairs for each problem, sourced from a [Google Drive mirror](https://drive.google.com/file/d/1evBDJapwRvCQK6VUCTV8ZE9WG2k3QJQr/view)

Both are decompressed automatically. Files land in:
```
approach2/data/
  Project_CodeNet.tar.gz.download/
    Project_CodeNet.tar.gz     # compressed archive
    Project_CodeNet.tar         # uncompressed (~40 GB)
  merged_testcases.tar          # test case archive
```

### 2. Filter for accepted C submissions

```bash
./setup.sh --filter
```

This runs `filter.py` which does a single-pass scan of the 40 GB tar and extracts:
- Only **C language** submissions
- Only those with **"Accepted"** status
- Plus matching **input/output test cases** from the test case archive

Output:
```
filtered_codenet_c/
  p00144/
    solutions/
      s012222112.c
      s590419264.c
      ...
    test_cases/
      input.0.txt
      output.0.txt
      input.1.txt
      output.1.txt
      ...
  p02791/
    ...
  manifest.json                # summary stats
  codenet_accepted_c.jsonl     # one JSON object per problem (if --format jsonl)
```

**Filter options:**

| Flag | Description | Default |
|------|-------------|---------|
| `-n, --max-problems N` | Only process first N problems | all |
| `-s, --max-solutions N` | Max solutions kept per problem (0 = no limit) | 5 |
| `--format dir\|jsonl` | Output format | jsonl |
| `--preview N` | Extract N problems and print a readable preview | off |

```bash
# Quick test run
./setup.sh --filter -n 20 -s 10

# Keep all solutions, no cap
./setup.sh --filter -s 0

# Preview 3 problems in the terminal
./setup.sh --filter -n 10 --preview 3
```

### 3. Push to Hugging Face

```bash
# Login first (one time)
huggingface-cli login

# Build dataset + push (public)
python3 to_hf_dataset.py --push yourname/codenet-accepted-c

# Or push as private
python3 to_hf_dataset.py --push yourname/codenet-accepted-c --private

# Just build locally without pushing
python3 to_hf_dataset.py
```

This reads the filtered directory and produces a flat dataset where **each row is one submission**:

| Column | Type | Example |
|--------|------|---------|
| `problem_id` | string | `p00144` |
| `submission_id` | string | `s012222112` |
| `code` | string | `#include<stdio.h>\nint main(){...}` |
| `test_cases` | string (JSON array) | `[{"input":"7\n1 4...","output":"2\n..."},...]` |
| `num_test_cases` | int | `102` |

The same `problem_id` appears in multiple rows (one per accepted submission), and they all share the same `test_cases`.

Local output:
```
codenet_c_dataset/          # Arrow format (datasets library)
codenet_c_dataset.parquet   # Parquet file for easy inspection
```

## Requirements

- Python 3.10+
- `curl` (for downloads)
- `gdown` (optional, for Google Drive — falls back to curl)
- `pip install datasets pandas pyarrow` (for HF push)

## Scripts

| File | Purpose |
|------|---------|
| `setup.sh` | Orchestrates download + filter in one command |
| `filter.py` | Scans CodeNet tar, extracts accepted C + test cases |
| `to_hf_dataset.py` | Converts filtered output → HF dataset / parquet / push to Hub |
| `build_dataframe.py` | Standalone dataframe builder (pandas) |
