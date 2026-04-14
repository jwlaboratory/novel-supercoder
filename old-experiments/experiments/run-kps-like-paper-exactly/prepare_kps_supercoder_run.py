#!/usr/bin/env python3
"""Materialize a SuperCoder-style run directory from KrishPS/codenet-accepted-c (KPS)."""

from __future__ import annotations

import argparse
import csv
import json
import os
import subprocess
import sys
from pathlib import Path

from datasets import load_dataset

PROMPT_MAIN = """Given the following C code and assembly code, your task is to generate highly optimized x86-64 assembly code.
C Code:

```c
{c_code}
```

Assembly Code:

```assembly
{asm_o0}
```

Only output the optimized assembly code. Do not include any other text. Do not write any comments in the assembly code. Wrap the assembly code in ```assembly``` tags.
Optimized Assembly Code:
"""

PROMPT_C_ONLY = """Given the following C code, your task is to generate highly optimized x86-64 assembly code.
C Code:

```c
{c_code}
```

Only output the optimized assembly code. Do not include any other text. Do not write any comments in the assembly code. Wrap the assembly code in ```assembly``` tags.
Optimized Assembly Code:
"""


def _load_split(ds_name: str, split: str):
    cache_dir = os.environ.get("HF_CACHE")
    if cache_dir:
        return load_dataset(ds_name, split=split, cache_dir=cache_dir)
    return load_dataset(ds_name, split=split)


def _compile_o0_docker(*, run_dir: Path, jwlabs: Path, image: str) -> None:
    run_res = run_dir.resolve()
    root = jwlabs.resolve()
    rel = run_res.relative_to(root)
    inner = "/workspace/" + rel.as_posix()
    # Loop in container; gcc failures leave stderr in row dir
    inner_bash = f"""
set +e
shopt -s nullglob
for c in {inner}/rows/row_*/inputC.c; do
  dir=$(dirname "$c")
  gcc -S -O0 -o "$dir/inputo0.s" "$c" 2>"$dir/gcc_o0_stderr.txt" || true
  if [[ ! -s "$dir/inputo0.s" ]]; then
    : > "$dir/inputo0.s"
  fi
done
exit 0
"""
    cmd = [
        "docker",
        "run",
        "--rm",
        "--platform",
        "linux/amd64",
        "-v",
        f"{root}:/workspace",
        image,
        "bash",
        "-lc",
        inner_bash.strip(),
    ]
    print("Running:", " ".join(cmd[:6]), "...", flush=True)
    subprocess.run(cmd, check=True)


def _parse_bucket_edges(s: str) -> list[int]:
    s = (s or "").strip()
    if not s:
        return []
    parts = [p.strip() for p in s.split(",") if p.strip()]
    edges: list[int] = []
    for p in parts:
        edges.append(int(p, 10))
    for a, b in zip(edges, edges[1:]):
        if not (a < b):
            raise ValueError(f"length-bucket-edges must be strictly increasing, got {edges}")
    if edges and edges[0] <= 0:
        raise ValueError("length-bucket-edges values must be positive upper bounds")
    return edges


def _c_len_bucket_index(char_len: int, edges: list[int]) -> int:
    for i, hi in enumerate(edges):
        if char_len < hi:
            return i
    return len(edges)


def _c_len_bucket_label(char_len: int, edges: list[int]) -> str:
    if not edges:
        return "[0,inf)"
    b = _c_len_bucket_index(char_len, edges)
    lo = 0 if b == 0 else edges[b - 1]
    hi = edges[b] if b < len(edges) else None
    if hi is None:
        return f"[{lo},inf)"
    return f"[{lo},{hi})"


def _length_stratified_indices(ds, edges: list[int], per_bucket: int) -> tuple[list[int], list[int]]:
    """Scan ds in order; pick up to per_bucket rows per C-length bucket. Returns (indices, final_counts)."""
    n_b = len(edges) + 1
    counts = [0] * n_b
    picked: list[int] = []

    for i in range(len(ds)):
        if all(c >= per_bucket for c in counts):
            break
        row = ds[i]
        code = row.get("code") or ""
        L = len(code)
        b = _c_len_bucket_index(L, edges)
        if counts[b] >= per_bucket:
            continue
        picked.append(i)
        counts[b] += 1

    return picked, counts


def _write_main_prompts(rows_dir: Path) -> None:
    for row_dir in sorted(rows_dir.glob("row_*")):
        if not row_dir.is_dir():
            continue
        c_path = row_dir / "inputC.c"
        o0_path = row_dir / "inputo0.s"
        c_code = c_path.read_text(encoding="utf-8", errors="replace")
        asm_o0 = o0_path.read_text(encoding="utf-8", errors="replace") if o0_path.exists() else ""
        (row_dir / "prompt_supercoder_main.txt").write_text(
            PROMPT_MAIN.format(c_code=c_code.rstrip("\n"), asm_o0=asm_o0.rstrip("\n")),
            encoding="utf-8",
        )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-dir", required=True)
    parser.add_argument("--ds-name", default="KrishPS/codenet-accepted-c")
    parser.add_argument("--split", default="train")
    parser.add_argument("--offset", type=int, default=0)
    parser.add_argument("--limit", type=int, default=200, help="Number of rows (0 = all from offset)")
    parser.add_argument(
        "--shuffle-seed",
        type=int,
        default=None,
        help="Shuffle full split with this seed before offset/limit (recommended for KPS train; else order clusters by problem).",
    )
    parser.add_argument(
        "--jwlabs-root",
        type=Path,
        default=None,
        help="Repo root (parent of novel-supercoder). Required for --compile-o0-docker.",
    )
    parser.add_argument(
        "--compile-o0-docker",
        action="store_true",
        help="After writing C files, run gcc -S -O0 per row inside the benchmark Docker image.",
    )
    parser.add_argument(
        "--docker-image",
        default="supercoder-x86-bench",
        help="Image used for -O0 assembly (same as run-their-paper-exactly Linux bench).",
    )
    parser.add_argument(
        "--length-stratify-per-bucket",
        type=int,
        default=None,
        metavar="N",
        help=(
            "If set, scan the (shuffled) split and take up to N rows per C source length bucket. "
            "Buckets are defined by --length-bucket-edges. Implies you should set --shuffle-seed. "
            "When set, --offset and --limit are ignored for sampling (full split is scanned)."
        ),
    )
    parser.add_argument(
        "--length-bucket-edges",
        default="800,2500,8000",
        help=(
            "Comma-separated upper bounds for C source char-length buckets: [0,e0), [e0,e1), …, last unbounded. "
            "K edges define K+1 buckets. Example: 800,2500,8000 (3 edges) → 4 buckets; "
            "500,1500,4000,10000 (4 edges) → 5 buckets."
        ),
    )
    args = parser.parse_args()

    length_edges = _parse_bucket_edges(args.length_bucket_edges)
    strat_counts: list[int] | None = None
    if args.length_stratify_per_bucket is not None:
        if args.length_stratify_per_bucket <= 0:
            print("error: --length-stratify-per-bucket must be positive", file=sys.stderr)
            sys.exit(1)
        if args.shuffle_seed is None:
            print(
                "warning: length stratify without --shuffle-seed scans HF order (clustered by problem). "
                "Using --shuffle-seed 42.",
                file=sys.stderr,
            )
            args.shuffle_seed = 42
    elif args.limit > 0 and args.shuffle_seed is None:
        print(
            "warning: KPS train order is not i.i.d.; the first rows often repeat the same problem_id. "
            "Prefer --shuffle-seed 42 (run_autonomous.sh default) for a representative slice.",
            file=sys.stderr,
        )

    run_dir = Path(args.run_dir).resolve()
    rows_dir = run_dir / "rows"
    manifest = run_dir / "manifest.jsonl"
    meta = run_dir / "meta.json"
    dataset_csv = run_dir / "paper_dataset.csv"
    o3_summary = run_dir / "o3_summary.jsonl"
    rows_dir.mkdir(parents=True, exist_ok=True)

    ds = _load_split(args.ds_name, args.split)
    if args.shuffle_seed is not None:
        ds = ds.shuffle(seed=args.shuffle_seed)

    if args.length_stratify_per_bucket is not None:
        idxs, strat_counts = _length_stratified_indices(
            ds, length_edges, args.length_stratify_per_bucket
        )
        ds = ds.select(idxs)
        n_b = len(length_edges) + 1
        for b in range(n_b):
            got = strat_counts[b]
            want = args.length_stratify_per_bucket
            if got < want:
                label = (
                    f"[0,{length_edges[0]})"
                    if b == 0
                    else (
                        f"[{length_edges[b - 1]},{length_edges[b]})"
                        if b < len(length_edges)
                        else f"[{length_edges[-1]},inf)"
                    )
                )
                print(
                    f"warning: length bucket {label} only collected {got}/{want} rows (dataset scan ended)",
                    file=sys.stderr,
                )
    else:
        if args.offset > 0:
            ds = ds.select(range(args.offset, len(ds)))
        if args.limit > 0:
            ds = ds.select(range(0, min(args.limit, len(ds))))

    with dataset_csv.open("w", encoding="utf-8", newline="") as f_csv, manifest.open(
        "w", encoding="utf-8"
    ) as f_manifest, o3_summary.open("w", encoding="utf-8") as f_o3:
        writer = csv.DictWriter(
            f_csv, fieldnames=["idx", "answer", "test_cases", "question", "c_only_question"]
        )
        writer.writeheader()

        for row_index, item in enumerate(ds, start=1):
            code = item.get("code") or ""
            c_chars = len(code)
            problem_id = item.get("problem_id", "")
            submission_id = item.get("submission_id", "")
            raw_tests = item.get("test_cases") or "[]"
            try:
                tests = json.loads(raw_tests)
            except json.JSONDecodeError:
                tests = []
            if not isinstance(tests, list):
                tests = []
            tests = [t for t in tests if isinstance(t, dict)][:10]

            row_dir = rows_dir / f"row_{row_index:05d}"
            row_dir.mkdir(parents=True, exist_ok=True)
            (row_dir / "inputC.c").write_text(code, encoding="utf-8")
            (row_dir / "input_tests.json").write_text(
                json.dumps(tests, ensure_ascii=False, indent=2), encoding="utf-8"
            )
            (row_dir / "inputo0.s").write_text("", encoding="utf-8")
            (row_dir / "inputo3.s").write_text("", encoding="utf-8")

            c_only = PROMPT_C_ONLY.format(c_code=code.rstrip("\n"))
            (row_dir / "prompt_supercoder_c_only.txt").write_text(c_only, encoding="utf-8")
            (row_dir / "prompt_supercoder_main.txt").write_text(
                PROMPT_MAIN.format(c_code=code.rstrip("\n"), asm_o0=""),
                encoding="utf-8",
            )

            f_manifest.write(
                json.dumps(
                    {
                        "row_index": row_index,
                        "problem_idx": row_index - 1,
                        "row_dir": str(row_dir),
                        "has_tests": 1 if tests else 0,
                        "kps_problem_id": problem_id,
                        "kps_submission_id": submission_id,
                        "c_code_chars": c_chars,
                        "c_len_bucket_index": _c_len_bucket_index(c_chars, length_edges),
                        "c_len_bucket_label": _c_len_bucket_label(c_chars, length_edges),
                    },
                    ensure_ascii=False,
                )
                + "\n"
            )

            f_o3.write(
                json.dumps(
                    {
                        "row_index": row_index,
                        "status": "kps_no_o3_reference",
                        "o3_file": str(row_dir / "inputo3.s"),
                    },
                    ensure_ascii=False,
                )
                + "\n"
            )

            writer.writerow(
                {
                    "idx": row_index - 1,
                    "answer": code,
                    "test_cases": json.dumps(tests, ensure_ascii=False),
                    "question": PROMPT_MAIN.format(c_code=code.rstrip("\n"), asm_o0=""),
                    "c_only_question": c_only,
                }
            )

    if args.compile_o0_docker:
        if not args.jwlabs_root:
            print("error: --compile-o0-docker requires --jwlabs-root", file=sys.stderr)
            sys.exit(1)
        try:
            run_dir.resolve().relative_to(Path(args.jwlabs_root).resolve())
        except ValueError:
            print(
                "error: --run-dir must be inside --jwlabs-root so Docker can mount it at /workspace/...",
                file=sys.stderr,
            )
            sys.exit(1)
        _compile_o0_docker(run_dir=run_dir, jwlabs=args.jwlabs_root, image=args.docker_image)
        _write_main_prompts(rows_dir)

    src_meta: dict = {
        "dataset": args.ds_name,
        "split": args.split,
        "offset": args.offset,
        "limit": args.limit,
        "shuffle_seed": args.shuffle_seed,
        "compile_o0_docker": bool(args.compile_o0_docker),
        "length_bucket_edges": length_edges,
    }
    if args.length_stratify_per_bucket is not None:
        src_meta["length_stratify_per_bucket"] = args.length_stratify_per_bucket
        src_meta["length_stratify_bucket_counts"] = strat_counts
        src_meta["sampling"] = "length_stratified_scan"
        src_meta["offset_limit_ignored"] = True
        src_meta["limit_effective_rows"] = len(ds)
    else:
        src_meta["sampling"] = "offset_limit_slice"

    meta.write_text(
        json.dumps(
            {
                "data_csv": str(dataset_csv),
                "total_rows": len(ds),
                "source": src_meta,
            },
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )

    print(f"Prepared KPS run dir: {run_dir}")
    print(f"Rows: {len(ds)}")
    print(f"Manifest: {manifest}")


if __name__ == "__main__":
    main()
