"""
Analyze the KrishPS/codenet-accepted-c HuggingFace dataset.

Produces:
  - Overall dataset shape & column stats
  - Test-case quality breakdown (empty, trivial, real)
  - Distribution of num_test_cases
  - Per-problem aggregation (how many problems have real tests)
  - Sample rows with the richest test cases
"""

import json
import sys
from collections import Counter

import pandas as pd
from datasets import load_dataset

DATASET = "KrishPS/codenet-accepted-c"
SPLIT = "train"


def is_trivial_test(tc: dict) -> bool:
    """A test case whose input AND output are whitespace-only."""
    inp = tc.get("input", "").strip()
    out = tc.get("output", "").strip()
    return inp == "" and out == ""


def classify_test_cases(raw: str) -> dict:
    """Parse the JSON test_cases string and classify."""
    try:
        cases = json.loads(raw)
    except (json.JSONDecodeError, TypeError):
        return {"parse_ok": False, "total": 0, "trivial": 0, "real": 0, "cases": []}

    trivial = sum(1 for c in cases if is_trivial_test(c))
    real = len(cases) - trivial
    return {"parse_ok": True, "total": len(cases), "trivial": trivial, "real": real, "cases": cases}


def main():
    print(f"Loading {DATASET} ({SPLIT} split) …")
    ds = load_dataset(DATASET, split=SPLIT)
    df = ds.to_pandas()

    # ── 1.  Overall shape ────────────────────────────────────────────────
    print("\n" + "=" * 70)
    print("1.  OVERALL DATASET STATS")
    print("=" * 70)
    print(f"  Rows (submissions):  {len(df):,}")
    print(f"  Columns:             {list(df.columns)}")
    print(f"  Unique problem_ids:  {df['problem_id'].nunique():,}")
    print(f"  Unique submissions:  {df['submission_id'].nunique():,}")

    code_lens = df["code"].str.len()
    print(f"\n  Code length (chars): min={code_lens.min():,}  "
          f"median={int(code_lens.median()):,}  "
          f"mean={code_lens.mean():,.0f}  "
          f"max={code_lens.max():,}")

    print(f"\n  num_test_cases distribution:")
    print(df["num_test_cases"].describe().to_string())

    # ── 2.  Parse & classify every row's test_cases ──────────────────────
    print("\n" + "=" * 70)
    print("2.  TEST-CASE QUALITY (per row)")
    print("=" * 70)

    info = df["test_cases"].apply(classify_test_cases)
    df["tc_parse_ok"] = info.apply(lambda x: x["parse_ok"])
    df["tc_total"]    = info.apply(lambda x: x["total"])
    df["tc_trivial"]  = info.apply(lambda x: x["trivial"])
    df["tc_real"]     = info.apply(lambda x: x["real"])

    parse_fail = (~df["tc_parse_ok"]).sum()
    print(f"  Rows where JSON parse failed:      {parse_fail:,}")

    all_trivial = (df["tc_real"] == 0).sum()
    has_some_real = (df["tc_real"] > 0).sum()
    print(f"  Rows with ONLY trivial tests:      {all_trivial:,}  "
          f"({all_trivial / len(df) * 100:.1f}%)")
    print(f"  Rows with ≥1 real test case:       {has_some_real:,}  "
          f"({has_some_real / len(df) * 100:.1f}%)")

    print(f"\n  tc_real distribution (across all rows):")
    print(df["tc_real"].describe().to_string())

    # Distribution of real test-case counts
    real_counts = Counter(df["tc_real"])
    print(f"\n  Frequency of 'tc_real' values (top 20):")
    for val, cnt in sorted(real_counts.items(), key=lambda x: -x[1])[:20]:
        print(f"    tc_real={val:>4d} → {cnt:>8,} rows  ({cnt / len(df) * 100:.2f}%)")

    # ── 3.  Per-problem view ─────────────────────────────────────────────
    print("\n" + "=" * 70)
    print("3.  PER-PROBLEM BREAKDOWN")
    print("=" * 70)

    # test_cases is the same for all submissions of a given problem,
    # so we can just take the first row per problem
    prob = df.groupby("problem_id").first().reset_index()

    prob_all_trivial = (prob["tc_real"] == 0).sum()
    prob_has_real = (prob["tc_real"] > 0).sum()
    print(f"  Total unique problems:                   {len(prob):,}")
    print(f"  Problems with ONLY trivial/empty tests:  {prob_all_trivial:,}  "
          f"({prob_all_trivial / len(prob) * 100:.1f}%)")
    print(f"  Problems with ≥1 real test case:         {prob_has_real:,}  "
          f"({prob_has_real / len(prob) * 100:.1f}%)")

    print(f"\n  num_test_cases per problem (first row):")
    print(prob["num_test_cases"].describe().to_string())

    print(f"\n  tc_real per problem:")
    print(prob["tc_real"].describe().to_string())

    # Distribution buckets
    buckets = pd.cut(prob["tc_real"],
                     bins=[-1, 0, 1, 5, 10, 50, 100, float("inf")],
                     labels=["0", "1", "2-5", "6-10", "11-50", "51-100", "100+"])
    print(f"\n  Problem count by real-test-case bucket:")
    for label, cnt in buckets.value_counts().sort_index().items():
        print(f"    {label:>6s}  → {cnt:>6,} problems")

    # ── 4.  Submissions-per-problem distribution ─────────────────────────
    print("\n" + "=" * 70)
    print("4.  SUBMISSIONS PER PROBLEM")
    print("=" * 70)
    subs_per_prob = df.groupby("problem_id").size()
    print(subs_per_prob.describe().to_string())
    print(f"\n  Top 10 problems by submission count:")
    for pid, cnt in subs_per_prob.nlargest(10).items():
        print(f"    {pid}  → {cnt:,} submissions")

    # ── 5.  Peek at rows with the most real test cases ───────────────────
    print("\n" + "=" * 70)
    print("5.  SAMPLE ROWS WITH RICHEST TEST CASES")
    print("=" * 70)

    richest = prob.nlargest(10, "tc_real")[
        ["problem_id", "num_test_cases", "tc_total", "tc_trivial", "tc_real"]
    ]
    print(richest.to_string(index=False))

    # Show an actual test-case snippet for the top problem
    top_pid = richest.iloc[0]["problem_id"]
    top_row = df[df["problem_id"] == top_pid].iloc[0]
    cases = json.loads(top_row["test_cases"])
    print(f"\n  First 3 test cases for {top_pid}:")
    for i, c in enumerate(cases[:3]):
        inp_preview = c["input"][:120].replace("\n", "\\n")
        out_preview = c["output"][:120].replace("\n", "\\n")
        print(f"    [{i}] input:  {inp_preview}")
        print(f"        output: {out_preview}")

    # ── 6.  Quick trend: problem_id prefix vs test quality ───────────────
    print("\n" + "=" * 70)
    print("6.  TREND: problem-id range vs real test-case availability")
    print("=" * 70)

    prob["pid_num"] = prob["problem_id"].str.replace("p", "").astype(int)
    prob["pid_bucket"] = pd.cut(prob["pid_num"],
                                bins=10, precision=0)
    trend = prob.groupby("pid_bucket", observed=True).agg(
        problems=("problem_id", "size"),
        avg_real_tc=("tc_real", "mean"),
        pct_with_real=("tc_real", lambda s: (s > 0).mean() * 100),
    )
    print(trend.to_string())

    print("\nDone.")


if __name__ == "__main__":
    main()
