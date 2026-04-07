# novel-supercoder

## Approach 1 (Codeforces C++)
```bash
cd novel-supercoder
uv run build-cpp-dataset --steps fetch --limit 100    # HF join + tests column
uv run build-cpp-dataset --steps compile              # fill assembly_o0..o3
```

## Approach 2 (CodeNet — Accepted C + test cases)

### Data setup
Download the two archives into `approach2/data/`:
1. **Project CodeNet** (~8 GB compressed / ~40 GB tar): https://developer.ibm.com/exchanges/data/all/project-codenet/
2. **Merged test cases** (~1.4 GB tar): https://zenodo.org/records/7665808

```bash
# Place files so you have:
#   approach2/data/Project_CodeNet.tar.gz.download/Project_CodeNet.tar
#   approach2/data/merged_testcases.tar
```

### Filter & extract
```bash
cd approach2/data

# Preview a small sample (3 problems)
python3 filter.py --preview 3 --max-problems 10

# Full extraction to directory tree
python3 filter.py

# Full extraction + JSONL export (one JSON object per problem)
python3 filter.py --format jsonl

# Partial run (first 100 problems, faster)
python3 filter.py --format jsonl --max-problems 100
```

Output lands in `approach2/data/filtered_codenet_c/` with:
- `{problem_id}/solutions/*.c` — accepted C source files
- `{problem_id}/test_cases/input.N.txt` / `output.N.txt` — test I/O
- `manifest.json` — summary stats
- `codenet_accepted_c.jsonl` — (if `--format jsonl`) single file for ML pipelines

