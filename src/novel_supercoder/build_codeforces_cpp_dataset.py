from __future__ import annotations

import argparse
import json
import platform
import subprocess
import tempfile
from pathlib import Path
from typing import Any, Iterable

import pandas as pd
from datasets import load_dataset

PROBLEMS_DATASET = "open-r1/codeforces"
SUBMISSIONS_DATASET = "open-r1/codeforces-submissions"
TARGET_VERDICT = "OK"
DEFAULT_LIMIT = 100
DEFAULT_OUTPUT_FILENAME = "codeforces_cpp_assembly.csv"
KEY_COLUMNS = ["contest_id", "index"]
OFFICIAL_TESTS_COLUMN = "official_tests"

ASSEMBLY_COLUMNS = ["assembly_o0", "assembly_o1", "assembly_o2", "assembly_o3"]
COMPILE_OK_COLUMN = "assembly_compile_ok"
COMPILE_ERROR_COLUMN = "assembly_compile_error"
COMPILER_IMAGE_COLUMN = "assembly_compiler_image"
COMPILER_PLATFORM_COLUMN = "assembly_compiler_platform"
COMPILER_VERSION_COLUMN = "assembly_compiler_version"
COMPILER_TARGET_COLUMN = "assembly_compiler_target"
CONTAINER_UNAME_COLUMN = "assembly_container_uname"
COMMAND_COLUMNS = [
    "assembly_command_o0",
    "assembly_command_o1",
    "assembly_command_o2",
    "assembly_command_o3",
]
SOURCE_COLUMN = "accepted_cpp_solution"

PROJECT_ROOT = Path(__file__).resolve().parents[2]


def load_problem_frame(split: str = "train", subset: str = "default") -> pd.DataFrame:
    problem_columns = ["contest_id", "index", OFFICIAL_TESTS_COLUMN]
    problems = load_dataset(PROBLEMS_DATASET, name=subset, split=split).to_pandas()
    return problems.loc[:, problem_columns].copy()


def load_submission_frame(
    split: str = "train",
    subset: str = "selected_accepted",
) -> Iterable[dict]:
    return load_dataset(SUBMISSIONS_DATASET, name=subset, split=split, streaming=True)


def is_cpp_submission(programming_language: str | None) -> bool:
    if programming_language is None:
        return False
    return "C++" in programming_language


def pick_one_solution_per_problem(
    problem_keys: set[tuple[str, str]],
    submissions: Iterable[dict],
) -> dict[tuple[str, str], str]:
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


def problem_url(contest_id: str, index: str) -> str:
    return f"https://codeforces.com/contest/{contest_id}/problem/{index}"


def problem_id(contest_id: str, index: str) -> str:
    return f"{contest_id}/{index}"


def _json_safe(obj: Any) -> Any:
    """Recursively convert numpy / pandas leaves so json.dumps succeeds."""
    if isinstance(obj, dict):
        return {str(k): _json_safe(v) for k, v in obj.items()}
    if isinstance(obj, (list, tuple)):
        return [_json_safe(x) for x in obj]
    if hasattr(obj, "tolist") and not isinstance(obj, (bytes, str, bytearray)):
        return _json_safe(obj.tolist())
    return obj


def official_tests_to_cell(value: Any) -> str:
    """Serialize official tests (list of {input, output}) for CSV."""
    if value is None or (isinstance(value, float) and pd.isna(value)):
        return ""
    if isinstance(value, str):
        return value
    return json.dumps(_json_safe(value), ensure_ascii=False)


def build_codeforces_cpp_dataframe(
    limit: int = DEFAULT_LIMIT,
    problems_split: str = "train",
    problems_subset: str = "default",
    submissions_split: str = "train",
    submissions_subset: str = "selected_accepted",
) -> tuple[pd.DataFrame, int]:
    problems = load_problem_frame(split=problems_split, subset=problems_subset)
    problems["contest_id"] = problems["contest_id"].astype(str)
    problems["index"] = problems["index"].astype(str)

    problem_keys = set(zip(problems["contest_id"], problems["index"], strict=True))
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

        cid, idx = problem.contest_id, problem.index
        rows.append(
            {
                "problem_id": problem_id(cid, idx),
                "problem_url": problem_url(cid, idx),
                "contest_id": cid,
                "index": idx,
                OFFICIAL_TESTS_COLUMN: official_tests_to_cell(getattr(problem, OFFICIAL_TESTS_COLUMN)),
                SOURCE_COLUMN: solution,
            }
        )

        if len(rows) == limit:
            break

    return pd.DataFrame(rows).reset_index(drop=True), skipped_rows


def merge_with_existing_output(
    dataframe: pd.DataFrame,
    output_path: Path,
) -> tuple[pd.DataFrame, int, int]:
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


def resolve_output_path(output: Path) -> Path:
    if output.exists() and output.is_dir():
        return output / DEFAULT_OUTPUT_FILENAME
    if output.suffix:
        return output
    return output / DEFAULT_OUTPUT_FILENAME


def run_command(command: list[str], cwd: Path | None = None) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        command,
        cwd=str(cwd) if cwd is not None else None,
        text=True,
        capture_output=True,
    )


def ensure_docker_access() -> None:
    check = run_command(["docker", "info"])
    if check.returncode != 0:
        raise RuntimeError(
            "Docker is installed but not usable. Start the Docker daemon/Desktop and "
            "rerun this script.\n\n"
            f"docker info stderr:\n{check.stderr.strip()}"
        )


def collect_toolchain_info(docker_image: str, docker_platform: str) -> dict[str, str]:
    script = (
        "set -euo pipefail; "
        "printf 'COMPILER_VERSION='; g++ --version | head -n 1; "
        "printf 'COMPILER_TARGET='; g++ -dumpmachine; "
        "printf 'CONTAINER_UNAME='; uname -a"
    )
    result = run_command(
        [
            "docker",
            "run",
            "--rm",
            "--platform",
            docker_platform,
            docker_image,
            "bash",
            "-lc",
            script,
        ]
    )
    if result.returncode != 0:
        raise RuntimeError(
            "Unable to inspect the Linux g++ toolchain.\n\n"
            f"stdout:\n{result.stdout}\n\nstderr:\n{result.stderr}"
        )

    info: dict[str, str] = {}
    for line in result.stdout.splitlines():
        if "=" not in line:
            continue
        key, value = line.split("=", 1)
        info[key] = value.strip()
    return info


def build_container_compile_script(cpp_std: str) -> str:
    return (
        "set -uo pipefail; "
        "shopt -s nullglob; "
        "for source in submission_*.cpp; do "
        'base="${source%.cpp}"; '
        "ok_all=1; "
        "for opt in 0 1 2 3; do "
        f'g++ -std={cpp_std} -O$opt -S "$source" -o "${{base}}_O$opt.s" 2>"${{base}}_O$opt.err" || ok_all=0; '
        "done; "
        'if [ "$ok_all" -eq 1 ]; then '
        'touch "${base}.ok"; '
        'rm -f "${base}_O0.err" "${base}_O1.err" "${base}_O2.err" "${base}_O3.err"; '
        "else "
        'cat "${base}_O0.err" "${base}_O1.err" "${base}_O2.err" "${base}_O3.err" > "${base}.err" 2>/dev/null || true; '
        "fi; "
        "done"
    )


def compile_batch_to_assembly(
    batch_rows: list[tuple[int, str]],
    docker_image: str,
    docker_platform: str,
    cpp_std: str,
) -> dict[int, tuple[bool, str, str, str, str, str]]:
    container_script = build_container_compile_script(cpp_std)
    with tempfile.TemporaryDirectory() as temp_dir_str:
        temp_dir = Path(temp_dir_str)

        batch_entries: list[tuple[int, str]] = []
        for offset, (row_index, source_code) in enumerate(batch_rows):
            base_name = f"submission_{offset:04d}"
            source_path = temp_dir / f"{base_name}.cpp"
            source_path.write_text(source_code)
            batch_entries.append((row_index, base_name))

        result = run_command(
            [
                "docker",
                "run",
                "--rm",
                "--platform",
                docker_platform,
                "-v",
                f"{temp_dir}:/work",
                "-w",
                "/work",
                docker_image,
                "bash",
                "-lc",
                container_script,
            ]
        )

        if result.returncode != 0:
            batch_error = result.stderr.strip() or result.stdout.strip() or "Unknown Docker batch compile error"
            return {
                row_index: (False, "", "", "", "", batch_error)
                for row_index, _ in batch_rows
            }

        compiled_results: dict[int, tuple[bool, str, str, str, str, str]] = {}
        for row_index, base_name in batch_entries:
            ok_marker = temp_dir / f"{base_name}.ok"
            paths = [temp_dir / f"{base_name}_O{opt}.s" for opt in (0, 1, 2, 3)]
            error_path = temp_dir / f"{base_name}.err"

            if ok_marker.exists():
                texts = [p.read_text() for p in paths]
                compiled_results[row_index] = (True, *texts, "")
                continue

            error_text = "Unknown compile error"
            if error_path.exists():
                error_text = error_path.read_text().strip() or error_text
            compiled_results[row_index] = (False, "", "", "", "", error_text)

        return compiled_results


def write_checkpoint_csv(dataframe: pd.DataFrame, csv_path: Path) -> None:
    temp_path = csv_path.with_name(f"{csv_path.name}.tmp")
    dataframe.to_csv(temp_path, index=False)
    temp_path.replace(csv_path)


def iter_batches(items: list[int], batch_size: int) -> list[list[int]]:
    return [items[start : start + batch_size] for start in range(0, len(items), batch_size)]


def ensure_assembly_columns(dataframe: pd.DataFrame) -> None:
    for column in ASSEMBLY_COLUMNS + [COMPILE_OK_COLUMN, COMPILE_ERROR_COLUMN]:
        if column not in dataframe.columns:
            dataframe[column] = ""
    for column in COMMAND_COLUMNS:
        if column not in dataframe.columns:
            dataframe[column] = ""


def populate_metadata_columns(
    dataframe: pd.DataFrame,
    docker_image: str,
    docker_platform: str,
    toolchain: dict[str, str],
    cpp_std: str,
) -> None:
    dataframe[COMPILER_IMAGE_COLUMN] = docker_image
    dataframe[COMPILER_PLATFORM_COLUMN] = docker_platform
    dataframe[COMPILER_VERSION_COLUMN] = toolchain.get("COMPILER_VERSION", "")
    dataframe[COMPILER_TARGET_COLUMN] = toolchain.get("COMPILER_TARGET", "")
    dataframe[CONTAINER_UNAME_COLUMN] = toolchain.get("CONTAINER_UNAME", "")
    for opt, column in zip((0, 1, 2, 3), COMMAND_COLUMNS, strict=True):
        dataframe[column] = f"g++ -std={cpp_std} -O{opt} -S submission.cpp -o submission_O{opt}.s"


def update_row_with_compile_result(
    dataframe: pd.DataFrame,
    index: int,
    result: tuple[bool, str, str, str, str, str],
) -> tuple[bool, str]:
    ok, o0, o1, o2, o3, error_text = result

    dataframe.at[index, COMPILE_OK_COLUMN] = "true" if ok else "false"
    dataframe.at[index, COMPILE_ERROR_COLUMN] = error_text

    if ok:
        dataframe.at[index, ASSEMBLY_COLUMNS[0]] = o0
        dataframe.at[index, ASSEMBLY_COLUMNS[1]] = o1
        dataframe.at[index, ASSEMBLY_COLUMNS[2]] = o2
        dataframe.at[index, ASSEMBLY_COLUMNS[3]] = o3
    else:
        for column in ASSEMBLY_COLUMNS:
            dataframe.at[index, column] = ""

    return ok, error_text


def run_fetch(args: argparse.Namespace) -> Path:
    dataframe, skipped_rows = build_codeforces_cpp_dataframe(
        limit=args.limit,
        problems_split=args.problems_split,
        problems_subset=args.problems_subset,
        submissions_split=args.submissions_split,
        submissions_subset=args.submissions_subset,
    )

    output_path = resolve_output_path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    dataframe, appended_rows, dropped_dupes = merge_with_existing_output(
        dataframe=dataframe,
        output_path=output_path,
    )
    ensure_assembly_columns(dataframe)
    dataframe.to_csv(output_path, index=False)

    n = len(dataframe)
    print(f"Saved CSV to: {output_path}")
    print(f"Total rows in CSV after save: {n}")
    print(f"Rows appended to existing CSV: {appended_rows}")
    print(f"Duplicate rows dropped during merge: {dropped_dupes}")
    print(f"Skipped problems (no accepted C++) while building this fetch batch: {skipped_rows}")
    preview_n = min(5, n)
    print(
        f"\nPreview: first {preview_n} of {n} rows "
        f"(pandas DataFrame.head(); the file on disk has all {n})."
    )
    print(dataframe.head(preview_n).to_string())
    return output_path


def run_compile(args: argparse.Namespace) -> None:
    if args.batch_size <= 0:
        raise ValueError("--batch-size must be a positive integer.")

    ensure_docker_access()
    toolchain = collect_toolchain_info(args.docker_image, args.docker_platform)

    csv_path = args.csv_path
    print("Reproducibility info")
    print(f"CSV path: {csv_path}")
    print(f"Source column: {SOURCE_COLUMN}")
    print(f"Host platform: {platform.platform()}")
    print(f"Host architecture: {platform.machine()}")
    print(f"Docker image: {args.docker_image}")
    print(f"Docker platform: {args.docker_platform}")
    print(f"Compiler version: {toolchain.get('COMPILER_VERSION', 'unknown')}")
    print(f"Compiler target: {toolchain.get('COMPILER_TARGET', 'unknown')}")
    print(f"Container uname: {toolchain.get('CONTAINER_UNAME', 'unknown')}")
    for opt in (0, 1, 2, 3):
        print(f"Compile command O{opt}: g++ -std={args.cpp_std} -O{opt} -S submission.cpp -o submission_O{opt}.s")
    print()

    dataframe = pd.read_csv(csv_path, keep_default_na=False)
    ensure_assembly_columns(dataframe)
    populate_metadata_columns(
        dataframe=dataframe,
        docker_image=args.docker_image,
        docker_platform=args.docker_platform,
        toolchain=toolchain,
        cpp_std=args.cpp_std,
    )

    total_rows = len(dataframe) if args.limit is None else min(len(dataframe), args.limit)
    compiled_rows = 0
    skipped_rows = 0
    failed_rows = 0
    pending_indices: list[int] = []

    for index in range(total_rows):
        contest_id = dataframe.at[index, "contest_id"]
        problem_idx = dataframe.at[index, "index"]

        already = all(bool(dataframe.at[index, col]) for col in ASSEMBLY_COLUMNS)
        if already and not args.force:
            skipped_rows += 1
            print(f"[{index + 1}/{total_rows}] {contest_id}/{problem_idx}: skipped existing assembly")
            continue

        pending_indices.append(index)

    if not pending_indices:
        print("No rows need compilation.")
        _print_compile_summary(csv_path, total_rows, compiled_rows, skipped_rows, failed_rows)
        return

    pending_batches = iter_batches(pending_indices, args.batch_size)
    total_batches = len(pending_batches)

    for batch_number, batch_indices in enumerate(pending_batches, start=1):
        batch_rows = [
            (idx, dataframe.at[idx, SOURCE_COLUMN])
            for idx in batch_indices
        ]
        batch_results = compile_batch_to_assembly(
            batch_rows=batch_rows,
            docker_image=args.docker_image,
            docker_platform=args.docker_platform,
            cpp_std=args.cpp_std,
        )

        for idx in batch_indices:
            contest_id = dataframe.at[idx, "contest_id"]
            problem_idx = dataframe.at[idx, "index"]
            ok, error_text = update_row_with_compile_result(
                dataframe=dataframe,
                index=idx,
                result=batch_results[idx],
            )

            if ok:
                compiled_rows += 1
                print(f"[{idx + 1}/{total_rows}] {contest_id}/{problem_idx}: compiled")
            else:
                failed_rows += 1
                print(f"[{idx + 1}/{total_rows}] {contest_id}/{problem_idx}: failed")
                if error_text:
                    print(error_text)

        write_checkpoint_csv(dataframe, csv_path)
        print(
            f"Checkpoint written after batch {batch_number}/{total_batches} "
            f"({len(batch_indices)} rows)."
        )

    _print_compile_summary(csv_path, total_rows, compiled_rows, skipped_rows, failed_rows)


def _print_compile_summary(
    csv_path: Path,
    total_rows: int,
    compiled_rows: int,
    skipped_rows: int,
    failed_rows: int,
) -> None:
    print()
    print("Summary")
    print(f"CSV written to: {csv_path}")
    print(f"Rows considered: {total_rows}")
    print(f"Rows compiled this run: {compiled_rows}")
    print(f"Rows skipped with existing assembly: {skipped_rows}")
    print(f"Rows failed: {failed_rows}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a Codeforces dataset: official tests, accepted C++, and g++ assembly "
            "at -O0..-O3 (Docker), aligned with gen-optimize-assembly."
        )
    )
    parser.add_argument(
        "--steps",
        choices=("fetch", "compile", "all"),
        default="all",
        help="fetch: HF join only; compile: fill assembly columns; all: fetch then compile.",
    )
    parser.add_argument("--limit", type=int, default=DEFAULT_LIMIT, help="Problems to keep (fetch).")
    parser.add_argument(
        "--compile-limit",
        type=int,
        default=None,
        help="Max rows to consider when compiling (default: all rows in CSV).",
    )
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
        help="Subset for open-r1/codeforces-submissions (same default as gen-optimize-assembly).",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=PROJECT_ROOT / "data",
        help="Output directory or CSV path for the dataset (default: ./data/).",
    )
    parser.add_argument(
        "--csv-path",
        type=Path,
        default=None,
        help="CSV to compile (default: same as fetch output).",
    )
    parser.add_argument(
        "--docker-image",
        default="gcc:13",
        help="Docker image that provides g++.",
    )
    parser.add_argument(
        "--docker-platform",
        default="linux/arm64",
        help="Docker platform to compile for.",
    )
    parser.add_argument(
        "--cpp-std",
        default="gnu++17",
        help="C++ standard flag, without the -std= prefix.",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Recompile rows even if assembly columns are already populated.",
    )
    parser.add_argument(
        "--batch-size",
        type=int,
        default=50,
        help="Rows to compile per Docker container and checkpoint write.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    output_path = resolve_output_path(args.output)
    csv_path = args.csv_path or output_path

    if args.steps in ("fetch", "all"):
        output_path = run_fetch(args)

    if args.steps in ("compile", "all"):
        compile_args = argparse.Namespace(
            **{**vars(args), "csv_path": csv_path if args.csv_path else output_path, "limit": args.compile_limit}
        )
        run_compile(compile_args)


if __name__ == "__main__":
    main()
