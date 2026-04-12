#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path


MODEL_SLUG = "qwen25_coder_7b_instruct"


def _read_jsonl_by_row(path: Path) -> dict[int, dict]:
    out: dict[int, dict] = {}
    if not path.exists():
        return out
    with path.open("r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rec = json.loads(line)
            out[int(rec.get("row_index", -1))] = rec
    return out


def _read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8", errors="replace")


def _read_tests(path: Path) -> str:
    if not path.exists():
        return "[]"
    try:
        obj = json.loads(path.read_text(encoding="utf-8"))
        return json.dumps(obj, ensure_ascii=False)
    except json.JSONDecodeError:
        return "[]"


def _extract_errors_from_bench(bench_json: dict) -> tuple[str, str, str, str]:
    if not bench_json:
        return "", "", "", ""

    compile_err = ""
    run_err = ""
    test_err = ""
    score = ""

    phases = bench_json.get("phases", [])
    if isinstance(phases, list):
        for phase in phases:
            if not isinstance(phase, dict):
                continue
            name = phase.get("name", "")
            stderr = (phase.get("stderr") or "").strip()
            if name == "correctness" and stderr and not compile_err:
                compile_err = stderr
                break

    correctness = bench_json.get("correctness", {})
    cases = correctness.get("cases", []) if isinstance(correctness, dict) else []
    if isinstance(cases, list):
        for c in cases:
            if not isinstance(c, dict):
                continue
            if int(c.get("exit_code", 0)) not in (0,):
                run_err = (c.get("stderr") or "").strip()
                if not run_err:
                    run_err = f"exit_code={c.get('exit_code')}"
                break
        for c in cases:
            if not isinstance(c, dict):
                continue
            if not bool(c.get("passed", False)):
                expected = c.get("expected", "")
                actual = c.get("actual", "")
                test_err = f"case={c.get('index')} expected={expected!r} actual={actual!r}"
                break

    timing = bench_json.get("timing", {})
    if isinstance(timing, dict):
        asm = timing.get("asm", {})
        if isinstance(asm, dict) and asm.get("mean_s") is not None:
            score = str(asm.get("mean_s"))
    if not score:
        timing_summary = bench_json.get("timing_summary", {})
        if isinstance(timing_summary, dict):
            by_label = timing_summary.get("by_label", {})
            if isinstance(by_label, dict):
                asm = by_label.get("asm", {})
                if isinstance(asm, dict) and asm.get("mean_s") is not None:
                    score = str(asm.get("mean_s"))

    return compile_err, run_err, test_err, score


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-dir", required=True)
    parser.add_argument("--output", default="")
    parser.add_argument("--prompt-key", choices=["main", "c_only"], default="main")
    args = parser.parse_args()

    run_dir = Path(args.run_dir).resolve()
    manifest_path = run_dir / "manifest.jsonl"
    modal_by_row = _read_jsonl_by_row(run_dir / "modal_summary.jsonl")
    paper_by_row = _read_jsonl_by_row(run_dir / "supercoder_bench" / "row_summary.jsonl")
    prompt_filename = "prompt_supercoder_main.txt" if args.prompt_key == "main" else "prompt_supercoder_c_only.txt"

    output_csv = Path(args.output).resolve() if args.output else (run_dir / "requested_report.csv")
    output_csv.parent.mkdir(parents=True, exist_ok=True)

    fieldnames = [
        "Problem id",
        "answer",
        "test cases",
        "o3 assembly",
        "generated assembly",
        "prompt to generate assembly",
        "error in generation",
        "err in assmebling",
        "err when running",
        "err passing test cases",
        "benchmark score",
    ]

    with manifest_path.open("r", encoding="utf-8") as f, output_csv.open(
        "w", encoding="utf-8", newline=""
    ) as out:
        writer = csv.DictWriter(out, fieldnames=fieldnames)
        writer.writeheader()
        for line in f:
            line = line.strip()
            if not line:
                continue
            rec = json.loads(line)
            row_index = int(rec["row_index"])
            row_dir = Path(rec["row_dir"])

            modal = modal_by_row.get(row_index, {})
            paper = paper_by_row.get(row_index, {})

            gen_error = ""
            modal_status = modal.get("status", "")
            if modal_status and modal_status != "ok":
                gen_error = f"status={modal_status}; error={modal.get('error', '')}".strip()

            bench_file = row_dir / "results" / f"{MODEL_SLUG}.bench.json"
            bench_json = {}
            if bench_file.exists():
                try:
                    bench_json = json.loads(bench_file.read_text(encoding="utf-8"))
                except json.JSONDecodeError:
                    bench_json = {}

            assemble_err, run_err, test_err, score = _extract_errors_from_bench(bench_json)
            if not score and paper:
                speedup = paper.get("paper_best_speedup")
                if speedup not in (None, ""):
                    score = f"paper_speedup={speedup}"

            writer.writerow(
                {
                    "Problem id": row_index,
                    "answer": _read_text(row_dir / "inputC.c"),
                    "test cases": _read_tests(row_dir / "input_tests.json"),
                    "o3 assembly": _read_text(row_dir / "inputo3.s"),
                    "generated assembly": _read_text(row_dir / "out" / f"{MODEL_SLUG}.s"),
                    "prompt to generate assembly": _read_text(row_dir / prompt_filename),
                    "error in generation": gen_error,
                    "err in assmebling": assemble_err,
                    "err when running": run_err,
                    "err passing test cases": test_err,
                    "benchmark score": score,
                }
            )

    print(f"Wrote requested CSV: {output_csv}")


if __name__ == "__main__":
    main()
