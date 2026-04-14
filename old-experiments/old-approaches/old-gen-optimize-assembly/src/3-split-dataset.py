from __future__ import annotations

import argparse
import random
from pathlib import Path

import pandas as pd

DEFAULT_CSV_PATH = Path(__file__).parent / "data" / "codeforces_join.csv"
DEFAULT_LABEL_COLUMN = "dataset_split"
DEFAULT_SEED = 42

SOURCE_COLUMN = "accepted_cpp_solution"
TESTS_COLUMN = "official_tests"
ASSEMBLY_O0_COLUMN = "assembly_o0"
ASSEMBLY_O3_COLUMN = "assembly_o3"
COMPILE_OK_COLUMN = "assembly_compile_ok"

SKIP_LABEL = "SKIP"
TARGET_RATIOS = {
    "SFT": 0.60,
    "RL": 0.15,
    "VAL": 0.10,
    "TEST": 0.15,
}
ALLOWED_LABELS = {SKIP_LABEL, *TARGET_RATIOS.keys()}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Assign dataset split labels into the CSV without overwriting rows that "
            "already have a split."
        )
    )
    parser.add_argument(
        "--csv-path",
        type=Path,
        default=DEFAULT_CSV_PATH,
        help="Path to the joined Codeforces CSV.",
    )
    parser.add_argument(
        "--label-column",
        default=DEFAULT_LABEL_COLUMN,
        help="Column used to store split labels.",
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=DEFAULT_SEED,
        help="Random seed for shuffling newly assigned rows.",
    )
    return parser.parse_args()


def normalize_label(value: object) -> str:
    if value is None:
        return ""
    text = str(value).strip().upper()
    return text


def is_truthy(value: object) -> bool:
    return str(value).strip().lower() in {"true", "1", "yes"}


def has_text(value: object) -> bool:
    return bool(str(value).strip())


def row_is_eligible(row: pd.Series) -> bool:
    required_columns = [
        SOURCE_COLUMN,
        TESTS_COLUMN,
        ASSEMBLY_O0_COLUMN,
        ASSEMBLY_O3_COLUMN,
    ]
    if not all(has_text(row.get(column, "")) for column in required_columns):
        return False

    if COMPILE_OK_COLUMN in row.index and not is_truthy(row.get(COMPILE_OK_COLUMN, "")):
        return False

    return True


def choose_next_label(counts: dict[str, int]) -> str:
    # Normalize by the target ratio so new rows preferentially fill whichever
    # split is furthest behind its desired share.
    return min(TARGET_RATIOS, key=lambda label: counts[label] / TARGET_RATIOS[label])


def assign_splits(dataframe: pd.DataFrame, label_column: str, seed: int) -> pd.DataFrame:
    if label_column not in dataframe.columns:
        dataframe[label_column] = ""

    dataframe[label_column] = dataframe[label_column].map(normalize_label)

    invalid_labels = sorted(
        {label for label in dataframe[label_column].unique() if label and label not in ALLOWED_LABELS}
    )
    if invalid_labels:
        raise ValueError(
            f"Unexpected labels in {label_column}: {invalid_labels}. "
            f"Allowed labels: {sorted(ALLOWED_LABELS)}"
        )

    existing_counts = {
        label: int((dataframe[label_column] == label).sum())
        for label in TARGET_RATIOS
    }

    unmarked_indices = dataframe.index[dataframe[label_column] == ""].tolist()
    newly_skipped = 0
    eligible_unmarked: list[int] = []

    for index in unmarked_indices:
        if row_is_eligible(dataframe.loc[index]):
            eligible_unmarked.append(index)
            continue
        dataframe.at[index, label_column] = SKIP_LABEL
        newly_skipped += 1

    rng = random.Random(seed)
    rng.shuffle(eligible_unmarked)

    for index in eligible_unmarked:
        next_label = choose_next_label(existing_counts)
        dataframe.at[index, label_column] = next_label
        existing_counts[next_label] += 1

    total_counts = {
        label: int((dataframe[label_column] == label).sum())
        for label in ALLOWED_LABELS
    }

    assigned_total = sum(total_counts[label] for label in TARGET_RATIOS)

    print("Split summary")
    print(f"CSV rows: {len(dataframe)}")
    print(f"Newly assigned SKIP rows: {newly_skipped}")
    print(f"Newly assigned train/eval rows: {len(eligible_unmarked)}")
    print()

    print("Final counts")
    for label in ["SFT", "RL", "VAL", "TEST", "SKIP"]:
        count = total_counts.get(label, 0)
        if label in TARGET_RATIOS and assigned_total:
            actual_ratio = count / assigned_total
            print(f"{label}: {count} ({actual_ratio:.2%})")
        else:
            print(f"{label}: {count}")

    return dataframe


def main() -> None:
    args = parse_args()
    dataframe = pd.read_csv(args.csv_path, keep_default_na=False)
    updated = assign_splits(
        dataframe=dataframe,
        label_column=args.label_column,
        seed=args.seed,
    )
    updated.to_csv(args.csv_path, index=False)
    print()
    print(f"CSV updated in place: {args.csv_path}")


if __name__ == "__main__":
    main()
