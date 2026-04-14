#!/usr/bin/env python3
"""Compile generated .s and run up to 10 I/O tests (no hyperfine, single-threaded)."""

from __future__ import annotations

import argparse
import json
import subprocess
import tempfile
from pathlib import Path

MODEL_SLUG = "qwen25_coder_7b_instruct"


def _clean_asm(s: str) -> str:
    return s.replace("```assembly\n", "").replace("```", "").strip()


def _same_asm(a: str, b: str) -> bool:
    return _clean_asm(a) == _clean_asm(b)


def _compile(asm: str, work: Path) -> Path | None:
    asm_path = work / "g.s"
    bin_path = work / "g.bin"
    asm_path.write_text(asm, encoding="utf-8")
    r = subprocess.run(
        ["gcc", str(asm_path), "-o", str(bin_path), "-lm"],
        capture_output=True,
        text=True,
        timeout=45,
    )
    if r.returncode != 0:
        return None
    return bin_path


def _run_case(bin_path: Path, inp: str, work: Path, timeout: int = 8) -> tuple[int, str, str]:
    """Run binary with stdin/stdout as temp files so chatty programs cannot fill a PIPE and deadlock."""
    in_path = work / "stdin.txt"
    out_path = work / "stdout.txt"
    err_path = work / "stderr.txt"
    in_path.write_text(inp, encoding="utf-8")
    out_path.write_bytes(b"")
    err_path.write_bytes(b"")
    with in_path.open("rb") as inf, out_path.open("wb") as outf, err_path.open("wb") as errf:
        r = subprocess.run(
            [str(bin_path)],
            stdin=inf,
            stdout=outf,
            stderr=errf,
            timeout=timeout,
        )
    cap = 4_000_000
    raw = out_path.read_bytes()[:cap]
    out = raw.decode("utf-8", errors="replace")
    err = err_path.read_text(encoding="utf-8", errors="replace")
    return r.returncode, out, err


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-dir", type=Path, required=True)
    parser.add_argument("--max-tests", type=int, default=10)
    parser.add_argument(
        "--write-summary",
        type=Path,
        default=None,
        help="If set, write enriched simple_io_summary.json (merges run-dir/meta.json).",
    )
    parser.add_argument(
        "--model-name",
        default="Qwen/Qwen2.5-Coder-7B-Instruct",
        help="Recorded in --write-summary only.",
    )
    parser.add_argument(
        "--write-per-row",
        type=Path,
        default=None,
        help="If set, append one JSON object per row (compile/correct/bucket join keys) for downstream analysis.",
    )
    args = parser.parse_args()

    run_dir = args.run_dir.resolve()
    manifest = run_dir / "manifest.jsonl"
    lines = [json.loads(l) for l in manifest.read_text(encoding="utf-8").splitlines() if l.strip()]

    compiled = 0
    correct = 0
    total = len(lines)
    failures: list[tuple[int, str]] = []
    per_row: list[dict] = []

    for rec in lines:
        ri = int(rec["row_index"])
        primary = Path(rec["row_dir"])
        row_dir = primary if primary.is_dir() else (run_dir / "rows" / f"row_{ri:05d}")
        asm_path = row_dir / "out" / f"{MODEL_SLUG}.s"
        o0_path = row_dir / "inputo0.s"
        tests_path = row_dir / "input_tests.json"
        c_path = row_dir / "inputC.c"
        c_chars = len(c_path.read_text(encoding="utf-8", errors="replace")) if c_path.exists() else None
        asm = asm_path.read_text(encoding="utf-8", errors="replace") if asm_path.exists() else ""
        o0 = o0_path.read_text(encoding="utf-8", errors="replace") if o0_path.exists() else ""
        tests = json.loads(tests_path.read_text(encoding="utf-8")) if tests_path.exists() else []
        tests = [t for t in tests if isinstance(t, dict)][: args.max_tests]

        def _emit(**kwargs: object) -> None:
            base = {
                "row_index": ri,
                "problem_idx": int(rec.get("problem_idx", ri - 1)),
                "c_code_chars_disk": c_chars,
                "c_len_bucket_label": rec.get("c_len_bucket_label"),
                "c_len_bucket_index": rec.get("c_len_bucket_index"),
                "num_tests_ran_cap": len(tests),
            }
            base.update(kwargs)
            per_row.append(base)

        if _same_asm(asm, o0) and o0.strip():
            compiled += 1
            correct += 1
            _emit(
                compiled=True,
                correct=True,
                outcome="correct_identical_o0",
                failure_tag=None,
            )
            continue

        if not _clean_asm(asm):
            failures.append((ri, "empty_asm"))
            _emit(compiled=False, correct=False, outcome="fail", failure_tag="empty_asm")
            continue

        with tempfile.TemporaryDirectory() as td:
            work = Path(td)
            bin_path = _compile(asm, work)
            if bin_path is None:
                failures.append((ri, "compile_fail"))
                _emit(compiled=False, correct=False, outcome="fail", failure_tag="compile_fail")
                continue
            compiled += 1
            bin_path.chmod(0o755)
            all_ok = True
            for t in tests:
                inp = t.get("input", "")
                exp = t.get("output", "")
                try:
                    code, out, _err = _run_case(bin_path, inp, work, timeout=8)
                except subprocess.TimeoutExpired:
                    all_ok = False
                    break
                if code != 0 or out != exp:
                    all_ok = False
                    break
            if all_ok and tests:
                correct += 1
                _emit(compiled=True, correct=True, outcome="correct_tests", failure_tag=None)
            elif not tests:
                failures.append((ri, "no_tests"))
                _emit(compiled=True, correct=False, outcome="fail", failure_tag="no_tests")
            else:
                _emit(compiled=True, correct=False, outcome="fail", failure_tag="io_or_timeout")

    metrics = {
        "total_problems": total,
        "compiled_problems": compiled,
        "compilation_rate_pct": round(100.0 * compiled / total, 2) if total else 0.0,
        "correct_problems": correct,
        "accuracy_pct": round(100.0 * correct / total, 2) if total else 0.0,
        "note": "I/O-only, no hyperfine; identical-to-O0 counts as correct without running tests.",
    }
    print(json.dumps(metrics, indent=2))

    if args.write_summary is not None:
        meta_path = run_dir / "meta.json"
        meta = json.loads(meta_path.read_text(encoding="utf-8")) if meta_path.exists() else {}
        src = meta.get("source") or {}
        seed = src.get("shuffle_seed")
        if seed is not None:
            kps_sampling = f"shuffled_train_seed_{seed}_offset_{src.get('offset', 0)}_limit_{src.get('limit', total)}"
            caveat = (
                "Train split shuffled with fixed seed before offset/limit; broader problem mix than sequential head."
            )
        else:
            kps_sampling = "sequential_hf_train_after_offset_limit_no_shuffle"
            caveat = (
                "Train order clusters submissions (often same problem_id). Not representative; prefer shuffle_seed."
            )
        out = {
            "run_dir": run_dir.name,
            "kps_sampling": kps_sampling,
            "kps_sampling_caveat": caveat,
            "dataset": src.get("dataset", "KrishPS/codenet-accepted-c"),
            "split": src.get("split", "train"),
            "offset": src.get("offset", 0),
            "limit": src.get("limit", total),
            "shuffle_seed": seed,
            "model": args.model_name,
            "evaluation": {
                "tool": "bench_correctness_simple.py",
                "description": (
                    "Single-threaded gcc of generated .s, then up to 10 KPS tests per row; "
                    "stdout to temp files (avoids PIPE deadlock). No hyperfine. "
                    "Identical-to-O0 assembly counts as correct without running tests."
                ),
                **{k: metrics[k] for k in metrics if k != "note"},
            },
            "notes": [
                metrics["note"],
                "Prefer full SuperCoder test_benchmark when the Docker environment has enough RAM (BENCH_MODE=full).",
            ],
        }
        args.write_summary.parent.mkdir(parents=True, exist_ok=True)
        args.write_summary.write_text(json.dumps(out, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    if args.write_per_row is not None:
        args.write_per_row.parent.mkdir(parents=True, exist_ok=True)
        with args.write_per_row.open("w", encoding="utf-8") as f:
            for row in per_row:
                f.write(json.dumps(row, ensure_ascii=False) + "\n")


if __name__ == "__main__":
    main()
