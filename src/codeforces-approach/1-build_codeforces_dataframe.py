from __future__ import annotations

import argparse
from pathlib import Path
from typing import Iterable

import pandas as pd
from datasets import load_dataset

PROBLEMS_DATASET = "open-r1/codeforces"
SUBMISSIONS_DATASET = "open-r1/codeforces-submissions"
TARGET_LANGUAGE_LABEL = "C++"
TARGET_VERDICT = "OK"
DEFAULT_LIMIT = 100
DEFAULT_OUTPUT_FILENAME = "codeforces_join.csv"
KEY_COLUMNS = ["contest_id", "index"]


def load_problem_frame(split: str = "train", subset: str = "default") -> pd.DataFrame:
    """Load problem metadata/tests from the Codeforces dataset."""
    problem_columns = ["contest_id", "index", "official_tests"]
    problems = load_dataset(PROBLEMS_DATASET, name=subset, split=split).to_pandas()
    return problems.loc[:, problem_columns].copy()


def load_submission_frame(
    split: str = "train",
    subset: str = "selected_accepted",
) -> Iterable[dict]:
    """Stream submissions from the accepted subset for practical joins."""
    return load_dataset(SUBMISSIONS_DATASET, name=subset, split=split, streaming=True)


def is_cpp_submission(programming_language: str | None) -> bool:
    """Treat mainstream Codeforces C++ variants as valid C++ solutions."""
    if programming_language is None:
        return False
    return "C++" in programming_language


def pick_one_solution_per_problem(
    problem_keys: set[tuple[str, str]],
    submissions: Iterable[dict],
) -> dict[tuple[str, str], str]:
    """Select one accepted C++ solution per requested problem."""
    paired: dict[tuple[str, str], str] = {}

    for submission in submissions:
        if not is_cpp_submission(submission.get("programmingLanguage")):
            continue
        if submission.get("verdict") != TARGET_VERDICT:
            continue

        key = (
            str(submission.get("contestId")),
            str(submission.get("problem_index")),
        )
        if key not in problem_keys or key in paired:
            continue

        paired[key] = submission["source"]

    return paired


def build_codeforces_dataframe(
    limit: int = DEFAULT_LIMIT,
    problems_split: str = "train",
    problems_subset: str = "default",
    submissions_split: str = "train",
    submissions_subset: str = "selected_accepted",
) -> tuple[pd.DataFrame, int]:
    """Build the first `limit` joined rows and count skipped problems."""
    problems = load_problem_frame(split=problems_split, subset=problems_subset)
    problems["contest_id"] = problems["contest_id"].astype(str)
    problems["index"] = problems["index"].astype(str)

    problem_keys = set(zip(problems["contest_id"], problems["index"]))
    paired_solutions = pick_one_solution_per_problem(
        problem_keys=problem_keys,
        submissions=load_submission_frame(
            split=submissions_split,
            subset=submissions_subset,
        ),
    )

    rows: list[dict] = []
    skipped_rows = 0

    for problem in problems.itertuples(index=False):
        key = (problem.contest_id, problem.index)
        solution = paired_solutions.get(key)

        if solution is None:
            skipped_rows += 1
            continue

        rows.append(
            {
                "contest_id": problem.contest_id,
                "index": problem.index,
                "official_tests": problem.official_tests,
                "accepted_cpp_solution": solution,
            }
        )

        if len(rows) == limit:
            break

    return pd.DataFrame(rows).reset_index(drop=True), skipped_rows


def merge_with_existing_output(
    dataframe: pd.DataFrame,
    output_path: Path,
) -> tuple[pd.DataFrame, int, int]:
    """
    Preserve previously saved rows and append only truly new problems.

    Existing rows win by default so downstream columns like dataset splits,
    generated assembly, scores, or other annotations are not wiped out by a
    future rebuild of the base Codeforces join.
    """
    if not output_path.exists():
        return dataframe, 0, 0

    existing = pd.read_csv(output_path, keep_default_na=False)
    if existing.empty:
        return dataframe, 0, 0

    for column in KEY_COLUMNS:
        if column not in existing.columns:
            raise ValueError(
                f"Existing output is missing required key column {column!r}: {output_path}"
            )

    existing = existing.copy()
    dataframe = dataframe.copy()
    for column in KEY_COLUMNS:
        existing[column] = existing[column].astype(str)
        dataframe[column] = dataframe[column].astype(str)

    existing_duplicate_count = int(existing.duplicated(subset=KEY_COLUMNS, keep="first").sum())
    if existing_duplicate_count:
        existing = existing.drop_duplicates(subset=KEY_COLUMNS, keep="first").reset_index(drop=True)

    new_duplicate_count = int(dataframe.duplicated(subset=KEY_COLUMNS, keep="first").sum())
    if new_duplicate_count:
        dataframe = dataframe.drop_duplicates(subset=KEY_COLUMNS, keep="first").reset_index(drop=True)

    existing_keys = existing.loc[:, KEY_COLUMNS].drop_duplicates()
    new_rows = dataframe.merge(
        existing_keys.assign(_existing_row=True),
        on=KEY_COLUMNS,
        how="left",
    )
    new_rows = new_rows[new_rows["_existing_row"] != True].drop(columns="_existing_row").reset_index(drop=True)

    combined = pd.concat([existing, new_rows], ignore_index=True, sort=False)
    return combined, len(new_rows), existing_duplicate_count + new_duplicate_count


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a pandas DataFrame that pairs Codeforces problems and official "
            "tests with one accepted C++ solution."
        )
    )
    parser.add_argument("--limit", type=int, default=DEFAULT_LIMIT, help="Rows to keep.")
    parser.add_argument(
        "--problems-split",
        default="train",
        help="Split for open-r1/codeforces.",
    )
    parser.add_argument(
        "--problems-subset",
        default="default",
        help="Subset for open-r1/codeforces.",
    )
    parser.add_argument(
        "--submissions-split",
        default="train",
        help="Split for open-r1/codeforces-submissions.",
    )
    parser.add_argument(
        "--submissions-subset",
        default="selected_accepted",
        help=(
            "Subset for open-r1/codeforces-submissions. "
            "Defaults to the accepted-only subset for a faster C++ join."
        ),
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Optional CSV path for saving the resulting DataFrame.",
    )
    return parser.parse_args()


def resolve_output_path(output: Path) -> Path:
    """Allow --output to be either a filename or a directory."""
    if output.exists() and output.is_dir():
        return output / DEFAULT_OUTPUT_FILENAME
    if output.suffix:
        return output
    return output / DEFAULT_OUTPUT_FILENAME


def main() -> None:
    args = parse_args()
    dataframe, skipped_rows = build_codeforces_dataframe(
        limit=args.limit,
        problems_split=args.problems_split,
        problems_subset=args.problems_subset,
        submissions_split=args.submissions_split,
        submissions_subset=args.submissions_subset,
    )

    if args.output is not None:
        output_path = resolve_output_path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        dataframe, appended_rows, dropped_duplicate_rows = merge_with_existing_output(
            dataframe=dataframe,
            output_path=output_path,
        )
        dataframe.to_csv(output_path, index=False)
        print(f"Saved CSV to: {output_path}")
        print(f"Rows appended to existing CSV: {appended_rows}")
        print(f"Duplicate rows dropped during merge: {dropped_duplicate_rows}")

    print(dataframe.head())
    print(f"\nRows: {len(dataframe)}")
    print(f"Skipped rows before reaching limit: {skipped_rows}")


if __name__ == "__main__":
    main()
