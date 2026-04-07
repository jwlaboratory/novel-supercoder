
# Novel super coder

1. src/data:
this generates the dataset
The dataset can be found https://huggingface.co/datasets/KrishPS/codenet-accepted-c

more info on how it was created is in the README.md file in the src/data folder


2. rl 

3. experiment
random experiments to see if we can improve the model


# OLD

```bash
novel-supercoder

## Approach 1 (Codeforces C++)

cd novel-supercoder
uv run build-cpp-dataset --steps fetch --limit 100    # HF join + tests column
uv run build-cpp-dataset --steps compile              # fill assembly_o0..o3


## Approach 2 (CodeNet — Accepted C + test cases)

### One-liner setup (downloads everything + filters)
cd approach2/data
./setup.sh

This will:
1. Download **Project CodeNet** (~7.8 GB `.tar.gz` → ~40 GB uncompressed)
2. Download **merged test cases** (~1.4 GB) from Google Drive
3. Run `filter.py` to extract accepted C solutions + test I/O → JSONL

### Manual / partial runs
cd approach2/data

# Preview a small sample (3 problems)
python3 filter.py --preview 3 --max-problems 10

# Full extraction + JSONL export
python3 filter.py --format jsonl

# Pass extra args through setup.sh
./setup.sh --max-problems 100

### Data sources
- **Project CodeNet**: https://codait-cos-dax.s3.us.cloud-object-storage.appdomain.cloud/dax-project-codenet/1.0.0/Project_CodeNet.tar.gz
- **Merged test cases**: https://drive.google.com/file/d/1evBDJapwRvCQK6VUCTV8ZE9WG2k3QJQr/view

### Output
`approach2/data/filtered_codenet_c/` with:
- `{problem_id}/solutions/*.c` — accepted C source files
- `{problem_id}/test_cases/input.N.txt` / `output.N.txt` — test I/O
- `manifest.json` — summary stats
- `codenet_accepted_c.jsonl` — single-file JSONL for ML pipelines

```