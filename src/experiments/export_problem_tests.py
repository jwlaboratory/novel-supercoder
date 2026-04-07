"""
Export one row per problem_id with its test cases to CSV.

Output columns:
  problem_id, num_test_cases, test_cases (JSON string)
"""

import argparse

import pandas as pd
from datasets import load_dataset

DATASET = "KrishPS/codenet-accepted-c"
SPLIT = "train"
DEFAULT_OUT = "src/experiments/problem_tests.csv"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-o", "--output", default=DEFAULT_OUT,
                        help=f"Output CSV path (default: {DEFAULT_OUT})")
    args = parser.parse_args()

    print(f"Loading {DATASET} …")
    ds = load_dataset(DATASET, split=SPLIT)
    df = ds.to_pandas()

    problems = (
        df.drop_duplicates(subset="problem_id")
          .sort_values("problem_id")
          [["problem_id", "num_test_cases", "test_cases"]]
          .reset_index(drop=True)
    )

    problems.to_csv(args.output, index=False)
    print(f"Wrote {len(problems):,} problems → {args.output}")


if __name__ == "__main__":
    main()
