#!/usr/bin/env python3
"""
Convert the filtered CodeNet output into a Hugging Face dataset.

Each row = one C submission:
  problem_id  | submission_id | code            | test_cases (JSON array)
  p00144      | s012222112    | #include <st... | [{"input":"7\n1 4...","output":"2\n2\n..."},...]

Usage:
  python3 to_hf_dataset.py                                   # build parquet locally
  python3 to_hf_dataset.py --push user/dataset-name          # push to HF Hub
  python3 to_hf_dataset.py --push user/dataset-name --private # push as private
"""

import argparse
import json
import sys
from pathlib import Path


def parse_args():
    p = argparse.ArgumentParser(description="Build HF dataset from filtered CodeNet data")
    p.add_argument(
        "--input-dir",
        default="filtered_codenet_c",
        help="Path to filtered output directory (default: filtered_codenet_c)",
    )
    p.add_argument(
        "--output",
        default="codenet_c_dataset",
        help="Output path for local dataset (parquet/arrow dir)",
    )
    p.add_argument(
        "--push",
        metavar="REPO_ID",
        help="Push to HF Hub (e.g. 'username/codenet-accepted-c')",
    )
    p.add_argument(
        "--private",
        action="store_true",
        help="Make the HF dataset private",
    )
    return p.parse_args()


def build_rows(input_dir: Path):
    """Yield one dict per submission."""
    problem_dirs = sorted([d for d in input_dir.iterdir() if d.is_dir()])

    for pdir in problem_dirs:
        pid = pdir.name
        sol_dir = pdir / "solutions"
        tc_dir = pdir / "test_cases"

        if not sol_dir.exists():
            continue

        # build test_cases list once per problem (shared across submissions)
        test_cases = []
        if tc_dir.exists():
            indices = set()
            for f in tc_dir.iterdir():
                if f.name.startswith("input."):
                    try:
                        indices.add(int(f.name.split(".")[1]))
                    except (IndexError, ValueError):
                        pass

            for idx in sorted(indices):
                inp_file = tc_dir / f"input.{idx}.txt"
                out_file = tc_dir / f"output.{idx}.txt"
                tc = {}
                if inp_file.exists():
                    tc["input"] = inp_file.read_text(encoding="utf-8", errors="replace")
                if out_file.exists():
                    tc["output"] = out_file.read_text(encoding="utf-8", errors="replace")
                if tc:
                    test_cases.append(tc)

        test_cases_json = json.dumps(test_cases, ensure_ascii=False)

        for cfile in sorted(sol_dir.glob("*.c")):
            yield {
                "problem_id": pid,
                "submission_id": cfile.stem,
                "code": cfile.read_text(encoding="utf-8", errors="replace"),
                "test_cases": test_cases_json,
                "num_test_cases": len(test_cases),
            }


def main():
    args = parse_args()
    base = Path(__file__).resolve().parent
    input_dir = base / args.input_dir
    output_path = base / args.output

    if not input_dir.exists():
        sys.exit(f"Input directory not found: {input_dir}\nRun filter.py first.")

    # collect rows
    print("Building rows …")
    rows = list(build_rows(input_dir))
    if not rows:
        sys.exit("No data found. Run filter.py first.")

    n_problems = len(set(r["problem_id"] for r in rows))
    print(f"  {len(rows)} rows ({n_problems} problems)")

    # try datasets library first, fall back to pandas
    try:
        from datasets import Dataset

        ds = Dataset.from_list(rows)
        print(f"\nDataset:\n{ds}")
        print(f"\nSample row:")
        sample = ds[0]
        print(f"  problem_id:    {sample['problem_id']}")
        print(f"  submission_id: {sample['submission_id']}")
        print(f"  code:          {sample['code'][:80]}…")
        print(f"  num_test_cases:{sample['num_test_cases']}")
        tc_preview = json.loads(sample["test_cases"])
        if tc_preview:
            print(f"  test_cases[0]: input={tc_preview[0].get('input','')[:60]}…")

        # save locally
        ds.save_to_disk(str(output_path))
        print(f"\nSaved to {output_path}/")

        # also save as parquet for easy inspection
        parquet_path = output_path.with_suffix(".parquet")
        ds.to_parquet(str(parquet_path))
        size_mb = parquet_path.stat().st_size / (1024 * 1024)
        print(f"Saved parquet: {parquet_path} ({size_mb:.1f} MB)")

        # push to hub
        if args.push:
            print(f"\nPushing to HF Hub: {args.push} …")
            ds.push_to_hub(args.push, private=args.private)
            print(f"Done! https://huggingface.co/datasets/{args.push}")

    except ImportError:
        import pandas as pd

        print("  (datasets library not found, using pandas)")
        df = pd.DataFrame(rows)
        print(f"\n{df.head()}")
        print(f"\nShape: {df.shape}")

        parquet_path = output_path.with_suffix(".parquet")
        df.to_parquet(str(parquet_path), index=False)
        size_mb = parquet_path.stat().st_size / (1024 * 1024)
        print(f"\nSaved: {parquet_path} ({size_mb:.1f} MB)")

        if args.push:
            print("\nInstall 'datasets' to push to HF Hub: pip install datasets")


if __name__ == "__main__":
    main()
