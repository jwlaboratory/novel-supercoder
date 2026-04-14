#!/usr/bin/env python3
"""
Filter the Project CodeNet dataset to extract:
  1. Only C-language submissions with "Accepted" status
  2. Corresponding input/output test cases for each problem

Produces a flat output directory:
  output/
    {problem_id}/
      solutions/
        {submission_id}.c
      test_cases/
        input.0.txt
        output.0.txt
        ...
    manifest.json

Strategy
--------
The CodeNet tar is ~40 GB, so we minimise passes:

  Phase A  – single sequential scan of Project_CodeNet.tar
             • read every metadata/*.csv  → build accepted set
             • simultaneously buffer any C source file encountered
               whose submission_id is already known to be accepted
             • for C files encountered *before* their metadata CSV,
               we note the tar offset and do a targeted seek in Phase B

  Phase B  – (only if needed) targeted extraction of C files we missed

  Phase C  – scan merged_testcases.tar for relevant problem test I/O
"""

import argparse
import csv
import io
import json
import os
import sys
import tarfile
from collections import defaultdict
from pathlib import Path


def parse_args():
    p = argparse.ArgumentParser(
        description="Filter CodeNet for accepted C submissions + test cases"
    )
    p.add_argument(
        "--codenet-tar",
        default="Project_CodeNet.tar.gz.download/Project_CodeNet.tar",
        help="Path to Project_CodeNet.tar (uncompressed)",
    )
    p.add_argument(
        "--testcases-tar",
        default="merged_testcases.tar",
        help="Path to merged_testcases.tar",
    )
    p.add_argument(
        "--output-dir",
        default="filtered_codenet_c",
        help="Output directory for filtered data",
    )
    p.add_argument(
        "--max-solutions-per-problem",
        type=int,
        default=5,
        help="Max accepted solutions kept per problem (0 = no limit)",
    )
    p.add_argument(
        "--max-problems",
        type=int,
        default=0,
        help="Stop metadata scan after N problems (0 = all)",
    )
    p.add_argument(
        "--format",
        choices=["dir", "jsonl"],
        default="dir",
        help="Output format: 'dir' = directory tree (default), 'jsonl' = one JSON object per problem",
    )
    p.add_argument(
        "--dry-run",
        action="store_true",
        help="Only scan metadata; report stats, don't extract files",
    )
    p.add_argument(
        "--preview",
        type=int,
        default=0,
        metavar="N",
        help="Extract N problems and print a preview to stdout (implies --max-problems N)",
    )
    return p.parse_args()


# ── Phase A: single-pass metadata + C extraction ───────────────────────────

def single_pass_codenet(codenet_tar_path: str, output_dir: str,
                        max_problems: int, cap: int, dry_run: bool):
    """
    One sequential scan of the CodeNet tar.

    Because tar entries for data/ and metadata/ are interleaved, we handle
    two cases:
      • metadata CSV arrives first → we know which submission_ids are
        accepted C, and can immediately write any matching C file we see later.
      • C source file arrives first → we stash its bytes in memory; when we
        later see the metadata CSV and confirm it's accepted, we flush to disk.

    To keep memory bounded, we only stash C files (they're small, typically <50 KB).
    """
    print("[Phase A] Single-pass scan of CodeNet tar …")

    # problem_id → set of accepted C submission_ids (populated from metadata)
    accepted: dict[str, list[str]] = defaultdict(list)
    # problems whose metadata has been read
    metadata_seen: set[str] = set()
    # C file bytes stashed before we've read that problem's metadata
    # key = (problem_id, submission_id), value = bytes
    stashed_c: dict[tuple[str, str], bytes] = {}
    # track how many solutions we've kept per problem
    kept_count: dict[str, int] = defaultdict(int)

    extracted = 0
    meta_count = 0
    out = Path(output_dir)

    def _should_keep(pid, sid):
        if cap and kept_count[pid] >= cap:
            return False
        return True

    def _write_solution(pid, sid, data: bytes):
        dest = out / pid / "solutions"
        dest.mkdir(parents=True, exist_ok=True)
        (dest / f"{sid}.c").write_bytes(data)

    with tarfile.open(codenet_tar_path, "r") as tar:
        for member in tar:
            name = member.name

            # ── metadata CSV ────────────────────────────────────────
            if name.startswith("Project_CodeNet/metadata/") and name.endswith(".csv"):
                f = tar.extractfile(member)
                if f is None:
                    continue
                text = io.TextIOWrapper(f, encoding="utf-8", errors="replace")
                reader = csv.DictReader(text)
                pid = None
                for row in reader:
                    pid = row.get("problem_id")
                    if row.get("language") == "C" and row.get("status") == "Accepted":
                        accepted[pid].append(row["submission_id"])
                if pid:
                    metadata_seen.add(pid)

                # flush any stashed C files for this problem
                if pid and pid in accepted and not dry_run:
                    acc_set = set(accepted[pid])
                    to_del = []
                    for (sp, ss), data in stashed_c.items():
                        if sp == pid and ss in acc_set and _should_keep(sp, ss):
                            _write_solution(sp, ss, data)
                            kept_count[sp] += 1
                            extracted += 1
                            to_del.append((sp, ss))
                    for k in to_del:
                        del stashed_c[k]

                meta_count += 1
                if meta_count % 500 == 0:
                    print(f"  … scanned {meta_count} metadata CSVs, "
                          f"{sum(len(v) for v in accepted.values())} accepted C so far, "
                          f"{extracted} files written")
                if max_problems and meta_count >= max_problems:
                    break
                continue

            # ── C source file ───────────────────────────────────────
            if "/C/" in name and name.endswith(".c") and name.startswith("Project_CodeNet/data/"):
                parts = name.split("/")
                if len(parts) < 5:
                    continue
                pid = parts[2]   # problem id
                sid = parts[4].removesuffix(".c")  # submission id

                if dry_run:
                    continue

                if pid in metadata_seen:
                    # we already have metadata → check if accepted
                    if sid in set(accepted.get(pid, [])) and _should_keep(pid, sid):
                        f = tar.extractfile(member)
                        if f:
                            _write_solution(pid, sid, f.read())
                            kept_count[pid] += 1
                            extracted += 1
                else:
                    # metadata not yet seen → stash in memory
                    f = tar.extractfile(member)
                    if f:
                        stashed_c[(pid, sid)] = f.read()

    total_accepted = sum(len(v) for v in accepted.values())
    print(f"  Done. {total_accepted} accepted C submissions across {len(accepted)} problems.")
    if not dry_run:
        print(f"  Extracted {extracted} C source files so far.")
        # flush any remaining stashed files (metadata appeared after data in tar)
        flushed = 0
        for (pid, sid), data in stashed_c.items():
            if sid in set(accepted.get(pid, [])) and _should_keep(pid, sid):
                _write_solution(pid, sid, data)
                kept_count[pid] += 1
                flushed += 1
        if flushed:
            print(f"  Flushed {flushed} stashed files.")
            extracted += flushed
        stashed_c.clear()

    return accepted, extracted


# ── Phase C: extract test cases ─────────────────────────────────────────────

def extract_test_cases(testcases_tar_path: str, problem_ids: set, output_dir: str):
    print("[Phase B] Extracting test cases from merged_testcases.tar …")
    extracted = 0
    out = Path(output_dir)

    with tarfile.open(testcases_tar_path, "r") as tar:
        for member in tar:
            parts = member.name.split("/")
            if len(parts) < 3:
                continue
            pid = parts[1]
            if pid not in problem_ids:
                continue
            fname = parts[-1]
            if not (fname.startswith("input.") or fname.startswith("output.")):
                continue

            dest = out / pid / "test_cases"
            dest.mkdir(parents=True, exist_ok=True)
            f = tar.extractfile(member)
            if f:
                (dest / fname).write_bytes(f.read())
                extracted += 1
                if extracted % 5000 == 0:
                    print(f"  … {extracted} test-case files extracted")

    print(f"  Done. {extracted} test-case files extracted.")
    return extracted


# ── Manifest ────────────────────────────────────────────────────────────────

def write_manifest(accepted: dict, output_dir: str, cap: int):
    print("[Phase C] Writing manifest.json …")
    out = Path(output_dir)
    manifest = {}
    for pid in sorted(accepted):
        sol_dir = out / pid / "solutions"
        tc_dir = out / pid / "test_cases"
        solutions = sorted(sol_dir.glob("*.c")) if sol_dir.exists() else []
        inputs = sorted(tc_dir.glob("input.*.txt")) if tc_dir.exists() else []
        outputs = sorted(tc_dir.glob("output.*.txt")) if tc_dir.exists() else []
        if not solutions and not inputs:
            continue
        manifest[pid] = {
            "num_solutions": len(solutions),
            "num_test_inputs": len(inputs),
            "num_test_outputs": len(outputs),
            "solution_files": [s.name for s in solutions],
        }

    (out / "manifest.json").write_text(json.dumps(manifest, indent=2))

    total_problems = len(manifest)
    total_solutions = sum(v["num_solutions"] for v in manifest.values())
    total_tc = sum(v["num_test_inputs"] + v["num_test_outputs"] for v in manifest.values())
    print(f"\n{'='*60}")
    print(f"  Problems with accepted C code : {total_problems}")
    print(f"  Total C source files          : {total_solutions}")
    print(f"  Total test-case files         : {total_tc}")
    print(f"  Output directory              : {output_dir}")
    print(f"{'='*60}\n")


# ── JSONL export ────────────────────────────────────────────────────────────

def export_jsonl(accepted: dict, output_dir: str, cap: int):
    """
    Convert the extracted directory tree into a single .jsonl file.
    Each line is one problem:
    {
      "problem_id": "p02791",
      "solutions": [{"submission_id": "s123...", "code": "..."}],
      "test_cases": [{"input": "...", "output": "..."}, ...]
    }
    """
    out = Path(output_dir)
    jsonl_path = out / "codenet_accepted_c.jsonl"
    print(f"[Phase D] Exporting to JSONL → {jsonl_path} …")

    count = 0
    with open(jsonl_path, "w", encoding="utf-8") as fout:
        for pid in sorted(accepted):
            sol_dir = out / pid / "solutions"
            tc_dir = out / pid / "test_cases"
            if not sol_dir.exists():
                continue

            solutions = []
            for cfile in sorted(sol_dir.glob("*.c")):
                solutions.append({
                    "submission_id": cfile.stem,
                    "code": cfile.read_text(encoding="utf-8", errors="replace"),
                })

            test_cases = []
            if tc_dir.exists():
                input_files = sorted(tc_dir.glob("input.*.txt"),
                                     key=lambda p: _tc_index(p.name))
                for inp in input_files:
                    idx = _tc_index(inp.name)
                    outp = tc_dir / f"output.{idx}.txt"
                    tc = {"input": inp.read_text(encoding="utf-8", errors="replace")}
                    if outp.exists():
                        tc["output"] = outp.read_text(encoding="utf-8", errors="replace")
                    test_cases.append(tc)

            record = {
                "problem_id": pid,
                "solutions": solutions,
                "test_cases": test_cases,
            }
            fout.write(json.dumps(record, ensure_ascii=False) + "\n")
            count += 1

    print(f"  Done. Wrote {count} problems to {jsonl_path}")
    size_mb = jsonl_path.stat().st_size / (1024 * 1024)
    print(f"  File size: {size_mb:.1f} MB")


def _tc_index(filename: str) -> int:
    """Extract the numeric index from 'input.3.txt' or 'output.3.txt'."""
    try:
        return int(filename.split(".")[1])
    except (IndexError, ValueError):
        return 0


# ── Preview ─────────────────────────────────────────────────────────────────

def preview(output_dir: str, n_problems: int):
    """Print a readable preview of the first N extracted problems."""
    out = Path(output_dir)
    problem_dirs = sorted(
        [d for d in out.iterdir() if d.is_dir()],
        key=lambda d: d.name,
    )[:n_problems]

    if not problem_dirs:
        print("  (no problems extracted to preview)")
        return

    for pdir in problem_dirs:
        pid = pdir.name
        sol_dir = pdir / "solutions"
        tc_dir = pdir / "test_cases"

        solutions = sorted(sol_dir.glob("*.c")) if sol_dir.exists() else []
        inputs = sorted(tc_dir.glob("input.*.txt"), key=lambda p: _tc_index(p.name)) if tc_dir.exists() else []
        outputs = sorted(tc_dir.glob("output.*.txt"), key=lambda p: _tc_index(p.name)) if tc_dir.exists() else []

        print(f"\n{'━'*70}")
        print(f"  Problem: {pid}")
        print(f"  Solutions: {len(solutions)}  |  Test cases: {len(inputs)} in / {len(outputs)} out")
        print(f"{'━'*70}")

        # show first solution (truncated)
        if solutions:
            code = solutions[0].read_text(encoding="utf-8", errors="replace")
            lines = code.splitlines()
            print(f"\n  ┌─ {solutions[0].name} ({len(lines)} lines) ─────────")
            for line in lines[:30]:
                print(f"  │ {line}")
            if len(lines) > 30:
                print(f"  │ … ({len(lines) - 30} more lines)")
            print(f"  └{'─'*50}")

        # show first 2 test cases
        for i, inp in enumerate(inputs[:2]):
            idx = _tc_index(inp.name)
            inp_text = inp.read_text(encoding="utf-8", errors="replace").strip()
            outp_file = tc_dir / f"output.{idx}.txt"
            outp_text = outp_file.read_text(encoding="utf-8", errors="replace").strip() if outp_file.exists() else "(missing)"

            print(f"\n  Test case {idx}:")
            print(f"    Input:  {inp_text[:200]}{'…' if len(inp_text) > 200 else ''}")
            print(f"    Output: {outp_text[:200]}{'…' if len(outp_text) > 200 else ''}")

        if len(inputs) > 2:
            print(f"\n  … and {len(inputs) - 2} more test cases")


# ── main ────────────────────────────────────────────────────────────────────

def main():
    args = parse_args()
    base = Path(__file__).resolve().parent

    codenet_tar = base / args.codenet_tar
    testcases_tar = base / args.testcases_tar
    output_dir = base / args.output_dir

    if not codenet_tar.exists():
        sys.exit(f"CodeNet tar not found: {codenet_tar}")
    if not testcases_tar.exists():
        sys.exit(f"Test-cases tar not found: {testcases_tar}")

    # --preview implies --max-problems and forces extraction
    if args.preview:
        args.max_problems = args.max_problems or args.preview
        args.dry_run = False

    cap = args.max_solutions_per_problem

    accepted, n_extracted = single_pass_codenet(
        str(codenet_tar), str(output_dir),
        args.max_problems, cap, args.dry_run,
    )

    if not accepted:
        sys.exit("No accepted C submissions found.")

    if args.dry_run:
        print("\n[dry-run] Top problems:")
        for pid in sorted(accepted, key=lambda k: len(accepted[k]), reverse=True)[:30]:
            print(f"  {pid}: {len(accepted[pid])} accepted C submissions")
        if len(accepted) > 30:
            print(f"  … and {len(accepted) - 30} more problems")
        return

    problem_ids = set(accepted.keys())
    extract_test_cases(str(testcases_tar), problem_ids, str(output_dir))
    write_manifest(accepted, str(output_dir), cap)

    if args.format == "jsonl":
        export_jsonl(accepted, str(output_dir), cap)

    if args.preview:
        print("\n" + "="*70)
        print("  PREVIEW")
        print("="*70)
        preview(str(output_dir), args.preview)


if __name__ == "__main__":
    main()
