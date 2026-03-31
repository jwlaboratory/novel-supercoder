from __future__ import annotations

import argparse
import platform
import subprocess
import tempfile
from pathlib import Path

import pandas as pd

DEFAULT_CSV_PATH = Path(__file__).parent / "data" / "codeforces_join.csv"
SOURCE_COLUMN = "accepted_cpp_solution"
DEFAULT_STD = "gnu++17"
DEFAULT_DOCKER_IMAGE = "gcc:13"
DEFAULT_DOCKER_PLATFORM = "linux/arm64"
DEFAULT_LIMIT = None
DEFAULT_BATCH_SIZE = 50

ASSEMBLY_O0_COLUMN = "assembly_o0"
ASSEMBLY_O3_COLUMN = "assembly_o3"
COMPILE_OK_COLUMN = "assembly_compile_ok"
COMPILE_ERROR_COLUMN = "assembly_compile_error"
COMPILER_IMAGE_COLUMN = "assembly_compiler_image"
COMPILER_PLATFORM_COLUMN = "assembly_compiler_platform"
COMPILER_VERSION_COLUMN = "assembly_compiler_version"
COMPILER_TARGET_COLUMN = "assembly_compiler_target"
CONTAINER_UNAME_COLUMN = "assembly_container_uname"
COMMAND_O0_COLUMN = "assembly_command_o0"
COMMAND_O3_COLUMN = "assembly_command_o3"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Read the joined Codeforces CSV, compile each accepted C++ solution in "
            "Linux ARM64 at -O0 and -O3, and write the assembly back to the CSV."
        )
    )
    parser.add_argument(
        "--csv-path",
        type=Path,
        default=DEFAULT_CSV_PATH,
        help="Path to the joined Codeforces CSV.",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=DEFAULT_LIMIT,
        help="Optional row limit for a smaller run.",
    )
    parser.add_argument(
        "--docker-image",
        default=DEFAULT_DOCKER_IMAGE,
        help="Docker image that provides g++.",
    )
    parser.add_argument(
        "--docker-platform",
        default=DEFAULT_DOCKER_PLATFORM,
        help="Docker platform to compile for.",
    )
    parser.add_argument(
        "--cpp-std",
        default=DEFAULT_STD,
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
        default=DEFAULT_BATCH_SIZE,
        help="Number of rows to compile per Docker container and checkpoint write.",
    )
    return parser.parse_args()


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
            "Unable to inspect the Linux compiler toolchain.\n\n"
            f"stdout:\n{result.stdout}\n\nstderr:\n{result.stderr}"
        )

    info: dict[str, str] = {}
    for line in result.stdout.splitlines():
        if "=" not in line:
            continue
        key, value = line.split("=", 1)
        info[key] = value.strip()
    return info


def print_reproducibility_info(args: argparse.Namespace, toolchain: dict[str, str]) -> None:
    command_o0 = f"g++ -std={args.cpp_std} -O0 -S submission.cpp -o submission_O0.s"
    command_o3 = f"g++ -std={args.cpp_std} -O3 -S submission.cpp -o submission_O3.s"

    print("Reproducibility info")
    print(f"CSV path: {args.csv_path}")
    print(f"Source column: {SOURCE_COLUMN}")
    print(f"Host platform: {platform.platform()}")
    print(f"Host architecture: {platform.machine()}")
    print(f"Docker image: {args.docker_image}")
    print(f"Docker platform: {args.docker_platform}")
    print(f"Compiler version: {toolchain.get('COMPILER_VERSION', 'unknown')}")
    print(f"Compiler target: {toolchain.get('COMPILER_TARGET', 'unknown')}")
    print(f"Container uname: {toolchain.get('CONTAINER_UNAME', 'unknown')}")
    print(f"Compile command O0: {command_o0}")
    print(f"Compile command O3: {command_o3}")
    print()


def compile_batch_to_assembly(
    batch_rows: list[tuple[int, str]],
    docker_image: str,
    docker_platform: str,
    cpp_std: str,
) -> dict[int, tuple[bool, str, str, str]]:
    with tempfile.TemporaryDirectory() as temp_dir_str:
        temp_dir = Path(temp_dir_str)

        batch_entries: list[tuple[int, str]] = []
        for offset, (row_index, source_code) in enumerate(batch_rows):
            base_name = f"submission_{offset:04d}"
            source_path = temp_dir / f"{base_name}.cpp"
            source_path.write_text(source_code)
            batch_entries.append((row_index, base_name))

        container_script = (
            "set -uo pipefail; "
            "shopt -s nullglob; "
            "for source in submission_*.cpp; do "
            'base="${source%.cpp}"; '
            f'g++ -std={cpp_std} -O0 -S "$source" -o "${{base}}_O0.s" 2>"${{base}}_O0.err"; '
            "status_o0=$?; "
            f'g++ -std={cpp_std} -O3 -S "$source" -o "${{base}}_O3.s" 2>"${{base}}_O3.err"; '
            "status_o3=$?; "
            'if [ "$status_o0" -eq 0 ] && [ "$status_o3" -eq 0 ]; then '
            'touch "${base}.ok"; '
            'rm -f "${base}_O0.err" "${base}_O3.err"; '
            "else "
            'cat "${base}_O0.err" "${base}_O3.err" > "${base}.err"; '
            "fi; "
            "done"
        )
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
                row_index: (False, "", "", batch_error)
                for row_index, _ in batch_rows
            }

        compiled_results: dict[int, tuple[bool, str, str, str]] = {}
        for row_index, base_name in batch_entries:
            ok_marker = temp_dir / f"{base_name}.ok"
            o0_path = temp_dir / f"{base_name}_O0.s"
            o3_path = temp_dir / f"{base_name}_O3.s"
            error_path = temp_dir / f"{base_name}.err"

            if ok_marker.exists():
                compiled_results[row_index] = (True, o0_path.read_text(), o3_path.read_text(), "")
                continue

            error_text = "Unknown compile error"
            if error_path.exists():
                error_text = error_path.read_text().strip() or error_text
            compiled_results[row_index] = (False, "", "", error_text)

        return compiled_results


def write_checkpoint_csv(dataframe: pd.DataFrame, csv_path: Path) -> None:
    temp_path = csv_path.with_name(f"{csv_path.name}.tmp")
    dataframe.to_csv(temp_path, index=False)
    temp_path.replace(csv_path)


def iter_batches(items: list[int], batch_size: int) -> list[list[int]]:
    return [items[start : start + batch_size] for start in range(0, len(items), batch_size)]


def update_row_with_compile_result(
    dataframe: pd.DataFrame,
    index: int,
    command_o0: str,
    command_o3: str,
    result: tuple[bool, str, str, str],
) -> tuple[bool, str]:
    ok, assembly_o0, assembly_o3, error_text = result

    dataframe.at[index, COMMAND_O0_COLUMN] = command_o0
    dataframe.at[index, COMMAND_O3_COLUMN] = command_o3
    dataframe.at[index, COMPILE_OK_COLUMN] = "true" if ok else "false"
    dataframe.at[index, COMPILE_ERROR_COLUMN] = error_text

    if ok:
        dataframe.at[index, ASSEMBLY_O0_COLUMN] = assembly_o0
        dataframe.at[index, ASSEMBLY_O3_COLUMN] = assembly_o3
    else:
        dataframe.at[index, ASSEMBLY_O0_COLUMN] = ""
        dataframe.at[index, ASSEMBLY_O3_COLUMN] = ""

    return ok, error_text


def generate_assembly(args: argparse.Namespace) -> None:
    if args.batch_size <= 0:
        raise ValueError("--batch-size must be a positive integer.")

    ensure_docker_access()
    toolchain = collect_toolchain_info(args.docker_image, args.docker_platform)
    print_reproducibility_info(args, toolchain)

    dataframe = pd.read_csv(args.csv_path, keep_default_na=False)
    command_o0, command_o3 = populate_metadata_columns(dataframe, args, toolchain)

    for column in [ASSEMBLY_O0_COLUMN, ASSEMBLY_O3_COLUMN, COMPILE_OK_COLUMN, COMPILE_ERROR_COLUMN]:
        if column not in dataframe.columns:
            dataframe[column] = ""

    total_rows = len(dataframe) if args.limit is None else min(len(dataframe), args.limit)
    compiled_rows = 0
    skipped_rows = 0
    failed_rows = 0
    pending_indices: list[int] = []

    for index in range(total_rows):
        contest_id = dataframe.at[index, "contest_id"]
        problem_index = dataframe.at[index, "index"]

        already_compiled = bool(dataframe.at[index, ASSEMBLY_O0_COLUMN]) and bool(
            dataframe.at[index, ASSEMBLY_O3_COLUMN]
        )
        if already_compiled and not args.force:
            skipped_rows += 1
            print(f"[{index + 1}/{total_rows}] {contest_id}/{problem_index}: skipped existing assembly")
            continue

        pending_indices.append(index)

    if not pending_indices:
        print("No rows need compilation.")
        print()
        print("Summary")
        print(f"CSV written to: {args.csv_path}")
        print(f"Rows considered: {total_rows}")
        print(f"Rows compiled this run: {compiled_rows}")
        print(f"Rows skipped with existing assembly: {skipped_rows}")
        print(f"Rows failed: {failed_rows}")
        return

    pending_batches = iter_batches(pending_indices, args.batch_size)
    total_batches = len(pending_batches)

    for batch_number, batch_indices in enumerate(pending_batches, start=1):
        batch_rows = [
            (index, dataframe.at[index, SOURCE_COLUMN])
            for index in batch_indices
        ]
        batch_results = compile_batch_to_assembly(
            batch_rows=batch_rows,
            docker_image=args.docker_image,
            docker_platform=args.docker_platform,
            cpp_std=args.cpp_std,
        )

        for index in batch_indices:
            contest_id = dataframe.at[index, "contest_id"]
            problem_index = dataframe.at[index, "index"]
            ok, error_text = update_row_with_compile_result(
                dataframe=dataframe,
                index=index,
                command_o0=command_o0,
                command_o3=command_o3,
                result=batch_results[index],
            )

            if ok:
                compiled_rows += 1
                print(f"[{index + 1}/{total_rows}] {contest_id}/{problem_index}: compiled")
            else:
                failed_rows += 1
                print(f"[{index + 1}/{total_rows}] {contest_id}/{problem_index}: failed")
                if error_text:
                    print(error_text)

        write_checkpoint_csv(dataframe, args.csv_path)
        print(
            f"Checkpoint written after batch {batch_number}/{total_batches} "
            f"({len(batch_indices)} rows)."
        )

    print()
    print("Summary")
    print(f"CSV written to: {args.csv_path}")
    print(f"Rows considered: {total_rows}")
    print(f"Rows compiled this run: {compiled_rows}")
    print(f"Rows skipped with existing assembly: {skipped_rows}")
    print(f"Rows failed: {failed_rows}")


def populate_metadata_columns(
    dataframe: pd.DataFrame,
    args: argparse.Namespace,
    toolchain: dict[str, str],
) -> tuple[str, str]:
    command_o0 = f"g++ -std={args.cpp_std} -O0 -S submission.cpp -o submission_O0.s"
    command_o3 = f"g++ -std={args.cpp_std} -O3 -S submission.cpp -o submission_O3.s"

    dataframe[COMPILER_IMAGE_COLUMN] = args.docker_image
    dataframe[COMPILER_PLATFORM_COLUMN] = args.docker_platform
    dataframe[COMPILER_VERSION_COLUMN] = toolchain.get("COMPILER_VERSION", "")
    dataframe[COMPILER_TARGET_COLUMN] = toolchain.get("COMPILER_TARGET", "")
    dataframe[CONTAINER_UNAME_COLUMN] = toolchain.get("CONTAINER_UNAME", "")
    dataframe[COMMAND_O0_COLUMN] = command_o0
    dataframe[COMMAND_O3_COLUMN] = command_o3
    return command_o0, command_o3


def main() -> None:
    generate_assembly(parse_args())


if __name__ == "__main__":
    main()
