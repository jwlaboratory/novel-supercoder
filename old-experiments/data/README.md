# CodeNet C (accepted) — data pipeline

Build a Hugging Face dataset: IBM CodeNet C submissions that were **Accepted**, plus each problem’s **test inputs/outputs**.

**Published copy:** [KrishPS/codenet-accepted-c](https://huggingface.co/datasets/KrishPS/codenet-accepted-c) (~313k rows, train split; each row is one submission).

---

## Run it (3 steps)

Run everything from this folder (`src/data`).

### 1. Download

```bash
./setup.sh --download
```

Pulls **CodeNet** (big tar) and **merged test cases** (smaller tar), then decompresses. Data sits next to the scripts (e.g. `Project_CodeNet.tar.gz.download/`, `merged_testcases.tar`).

### 2. Filter

```bash
./setup.sh --filter
```

Keeps only **C** + **Accepted** submissions and attaches the matching **test case files** per problem. Output: `filtered_codenet_c/` (plus `codenet_accepted_c.jsonl` by default).

Or one shot after clone: `./setup.sh` (download, then filter).

Quick try: `./setup.sh --filter -n 20 -s 10`

### 3. Build + push to Hugging Face

```bash
huggingface-cli login   # once
python3 to_hf_dataset.py --push yourname/codenet-accepted-c
```

Reads `filtered_codenet_c/`, merges code and tests into **one table row per submission**, uploads to the Hub. Local-only: `python3 to_hf_dataset.py` (Arrow dir + parquet).

---

## What’s in the dataset

| Column | Meaning |
|--------|---------|
| `problem_id` | Problem id, e.g. `p00144` |
| `submission_id` | Submission id, e.g. `s012222112` |
| `code` | Full C source |
| `test_cases` | JSON string: list of `{ "input": "...", "output": "..." }` |
| `num_test_cases` | Count of pairs |

Same `problem_id` repeats across many rows (many accepted solutions); `test_cases` is the same for all rows of that problem.

---

## Scripts

- `setup.sh` — download and/or filter  
- `filter.py` — filter logic  
- `to_hf_dataset.py` — table + Hugging Face push  

Needs: Python 3.10+, `curl`, and for push: `pip install datasets pandas pyarrow`.
