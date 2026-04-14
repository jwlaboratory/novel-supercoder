#!/usr/bin/env python3
"""Summarize where run-their-paper-exactly val200 fails: compile (with gcc stderr) vs I/O (from problem_results).

Writes human-reviewable Markdown + JSON under run_dir/supercoder_bench/failure_analysis/.

Run inside supercoder-x86-bench (or Linux x86-64 gcc) so compile diagnostics match the benchmark."""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import tempfile
from collections import Counter
from pathlib import Path

MODEL_SLUG = "qwen25_coder_7b_instruct"


def _clean_asm(text: str) -> str:
    return text.replace("```assembly\n", "").replace("```", "").strip()


def _compile_stderr(asm: str, timeout: int = 45) -> tuple[int, str]:
    asm = _clean_asm(asm)
    if not asm:
        return -1, "(empty assembly after stripping fences)"
    with tempfile.TemporaryDirectory() as td:
        p = Path(td) / "g.s"
        p.write_text(asm, encoding="utf-8")
        bin_path = Path(td) / "g.bin"
        r = subprocess.run(
            ["gcc", str(p), "-o", str(bin_path), "-lm"],
            capture_output=True,
            text=True,
            timeout=timeout,
        )
        return r.returncode, (r.stderr or "").strip() or "(no stderr)"


def _classify_compile(stderr: str, returncode: int) -> str:
    if returncode == 0:
        return "unexpected_compile_ok"
    s = stderr.lower()
    if "empty assembly" in s:
        return "empty_asm"
    if "undefined reference" in s or "cannot find -l" in s:
        return "link_or_undefined_ref"
    if "multiple definition" in s:
        return "multiple_definition"
    if "assembler messages" in s or "assembling" in s and "error" in s:
        return "assembler_error"
    if "error:" in s or "fatal error" in s:
        if "expected" in s or "syntax" in s or "invalid" in s:
            return "syntax_or_invalid_insn"
        return "gcc_error_other"
    if "warning:" in s and "error" not in s:
        return "warnings_only_still_failed"
    return "other_compile"


def _classify_io(msg: str) -> str:
    if not msg:
        return "empty_error_msg"
    if msg.startswith("Output mismatch"):
        return "output_mismatch"
    if msg.startswith("Runtime error"):
        return "runtime_nonzero_or_signal"
    return "other_io"


def _truncate(s: str, n: int = 400) -> str:
    s = s.replace("\n", " ")
    return s if len(s) <= n else s[: n - 3] + "..."


def _read_c_head(path: Path, lines: int = 35) -> str:
    if not path.exists():
        return "(no inputC.c)"
    raw = path.read_text(encoding="utf-8", errors="replace").splitlines()
    body: list[str] = []
    for line in raw[:lines]:
        t = line.strip()
        if t in ("```c", "```", "```cpp"):
            continue
        body.append(line)
    return "\n".join(body)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--run-dir",
        type=Path,
        required=True,
        help="e.g. .../results/20260411_211823_val200_exactcheck",
    )
    parser.add_argument(
        "--max-compile-examples",
        type=int,
        default=12,
        help="Per compile-error bucket, how many rows to spell out in Markdown.",
    )
    parser.add_argument(
        "--max-io-examples",
        type=int,
        default=15,
        help="Per I/O error bucket, how many example rows in Markdown.",
    )
    args = parser.parse_args()

    run_dir = args.run_dir.resolve()
    run_dir_display = Path(os.environ.get("FAILURE_ANALYSIS_HOST_RUN_DIR", str(run_dir)))
    bench = run_dir / "supercoder_bench"
    pr_path = bench / "problem_results.json"
    if not pr_path.exists():
        raise SystemExit(f"Missing {pr_path}")

    data = json.loads(pr_path.read_text(encoding="utf-8"))
    summary = data.get("summary", {})
    problems = data.get("problems", {})

    out_dir = bench / "failure_analysis"
    out_dir.mkdir(parents=True, exist_ok=True)

    compile_rows: list[dict] = []
    io_rows: list[dict] = []
    correct = 0

    compile_kind = Counter()
    io_kind = Counter()
    io_subkind_detail = Counter()

    for key, rec in problems.items():
        try:
            pidx = int(key)
        except (ValueError, TypeError):
            continue
        row_index = pidx + 1
        row_dir = run_dir / "rows" / f"row_{row_index:05d}"
        asm_path = row_dir / "out" / f"{MODEL_SLUG}.s"
        raw_path = row_dir / "out" / f"{MODEL_SLUG}.raw.txt"

        if rec.get("compilation_failed"):
            asm = asm_path.read_text(encoding="utf-8", errors="replace") if asm_path.exists() else ""
            rc, stderr = _compile_stderr(asm)
            kind = _classify_compile(stderr, rc)
            compile_kind[kind] += 1
            compile_rows.append(
                {
                    "problem_idx": pidx,
                    "row_index": row_index,
                    "compile_bucket": kind,
                    "gcc_returncode": rc,
                    "gcc_stderr": stderr[:8000],
                    "asm_bytes": len(asm.encode("utf-8")),
                    "asm_head": _truncate(_clean_asm(asm), 220),
                    "raw_head": _truncate(raw_path.read_text(encoding="utf-8", errors="replace"), 200)
                    if raw_path.exists()
                    else "",
                }
            )
            continue

        if rec.get("overall_correct"):
            correct += 1
            continue

        # Compiled but not fully correct: use best sample's test cases
        samples = rec.get("samples") or {}
        best_id = rec.get("best_sample_id")
        if best_id is None and samples:
            best_id = min(int(k) for k in samples.keys())
        sample = samples.get(str(best_id)) if best_id is not None else None
        if not sample:
            io_rows.append(
                {
                    "problem_idx": pidx,
                    "row_index": row_index,
                    "io_bucket": "no_sample_metrics",
                    "first_error": "",
                    "passed_vs_total": None,
                }
            )
            io_kind["no_sample_metrics"] += 1
            continue

        tcs = sample.get("test_cases") or []
        failed = [t for t in tcs if t.get("status") != "success"]
        ok = len(tcs) - len(failed)
        first_err = ""
        if failed:
            first_err = failed[0].get("error_msg") or ""
        bucket = _classify_io(first_err)
        io_kind[bucket] += 1
        if bucket == "output_mismatch":
            if "Expected:" in first_err and "Actual:" in first_err:
                io_subkind_detail["has_expected_actual"] += 1
            else:
                io_subkind_detail["output_mismatch_other"] += 1
        elif bucket == "runtime_nonzero_or_signal":
            if "b''" in first_err or "b\"\"" in first_err:
                io_subkind_detail["runtime_empty_stderr"] += 1
            else:
                io_subkind_detail["runtime_with_stderr"] += 1

        io_rows.append(
            {
                "problem_idx": pidx,
                "row_index": row_index,
                "io_bucket": bucket,
                "first_error": first_err[:8000],
                "num_tests_passed": ok,
                "num_tests_total": len(tcs),
                "identical_to_unoptimized": sample.get("identical_to_unoptimized"),
            }
        )

    total = summary.get("total_problems", len(problems))
    compiled = summary.get("compiled_problems", total - summary.get("compilation_failures", 0))
    comp_fail_n = summary.get("compilation_failures", len(compile_rows))

    summary_out = {
        "run_dir": str(run_dir_display),
        "run_dir_container": str(run_dir),
        "source_problem_results": str(pr_path),
        "totals": {
            "total_problems": total,
            "correct_problems": summary.get("correct_problems", correct),
            "compiled_problems": compiled,
            "compilation_failures": comp_fail_n,
            "compiled_but_wrong": compiled - summary.get("correct_problems", correct),
        },
        "compile_failure_bucket_counts": dict(compile_kind),
        "io_failure_bucket_counts": dict(io_kind),
        "io_subcounts": dict(io_subkind_detail),
    }
    (out_dir / "summary.json").write_text(
        json.dumps(summary_out, indent=2, ensure_ascii=False) + "\n", encoding="utf-8"
    )
    with (out_dir / "compile_failures.jsonl").open("w", encoding="utf-8") as f:
        for row in compile_rows:
            f.write(json.dumps(row, ensure_ascii=False) + "\n")
    with (out_dir / "io_failures.jsonl").open("w", encoding="utf-8") as f:
        for row in io_rows:
            f.write(json.dumps(row, ensure_ascii=False) + "\n")

    # --- Markdown report ---
    lines: list[str] = []
    lines.append("# Val200 failure analysis (paper-exact pipeline)\n")
    lines.append(f"**Run directory:** `{run_dir_display}`  \n")
    lines.append(f"**Source:** `{pr_path.relative_to(run_dir)}`  \n\n")
    lines.append("## Headline counts\n\n")
    lines.append(
        f"| Metric | Count |\n|---|---:|\n"
        f"| Total problems | {total} |\n"
        f"| **Correct** (all tests pass) | {summary.get('correct_problems', correct)} |\n"
        f"| **Compiled** (gcc linked) | {compiled} |\n"
        f"| **Compile failed** (no binary) | {comp_fail_n} |\n"
        f"| **Compiled but wrong** | {compiled - summary.get('correct_problems', correct)} |\n\n"
    )

    lines.append("### Where the ~38.5% ‘failure mass’ goes\n\n")
    lines.append(
        "- **Compile failures** are cases where `gcc … -lm` never produced a runnable binary for the generated `.s`. "
        "Below we **re-run gcc** on the saved assembly and bucket stderr (syntax vs link vs other).\n"
        "- **I/O failures** are cases that **compiled** but at least one test case failed: wrong stdout, runtime exit code, etc. "
        "SuperCoder records the **first failing** test per sample in `error_msg`.\n\n"
    )

    lines.append("## Compile failures: buckets (from fresh `gcc` on disk `.s`)\n\n")
    for kind, n in compile_kind.most_common():
        lines.append(f"- **{kind}** — {n}\n")
    lines.append("\n### Example compile failures (read `gcc` stderr)\n\n")
    shown: dict[str, int] = {}
    for row in compile_rows:
        k = row["compile_bucket"]
        if shown.get(k, 0) >= args.max_compile_examples:
            continue
        shown[k] = shown.get(k, 0) + 1
        ri = row["row_index"]
        rd = run_dir / "rows" / f"row_{ri:05d}"
        lines.append(f"#### Row `row_{ri:05d}` (problem_idx {row['problem_idx']}) — `{k}`\n\n")
        rel_asm = (rd / "out" / f"{MODEL_SLUG}.s").relative_to(run_dir)
        lines.append(f"- **ASM file:** `{rel_asm}`\n")
        lines.append(f"- **gcc return code:** {row['gcc_returncode']}\n")
        lines.append("```\n" + row["gcc_stderr"][:3500] + "\n```\n")
        lines.append("<details><summary>Source C (first ~35 lines)</summary>\n\n```c\n")
        lines.append(_read_c_head(rd / "inputC.c"))
        lines.append("\n```\n</details>\n\n")

    lines.append("## I/O failures (compiled but not `overall_correct`)\n\n")
    for kind, n in io_kind.most_common():
        lines.append(f"- **{kind}** — {n}\n")
    if io_subkind_detail:
        lines.append("\n**Runtime / mismatch sub-notes:**\n\n")
        for k, v in io_subkind_detail.most_common():
            lines.append(f"- {k}: {v}\n")
    lines.append("\n### Example I/O failures\n\n")
    shown_io: dict[str, int] = {}
    for row in io_rows:
        k = row["io_bucket"]
        if shown_io.get(k, 0) >= args.max_io_examples:
            continue
        shown_io[k] = shown_io.get(k, 0) + 1
        ri = row["row_index"]
        rd = run_dir / "rows" / f"row_{ri:05d}"
        lines.append(f"#### Row `row_{ri:05d}` (problem_idx {row['problem_idx']}) — `{k}`\n\n")
        lines.append(f"- **ASM file:** `{(rd / 'out' / (MODEL_SLUG + '.s')).relative_to(run_dir)}`\n")
        pt = row.get("num_tests_total")
        pp = row.get("num_tests_passed")
        if pt is not None:
            lines.append(f"- Tests passed (benchmark subset): **{pp} / {pt}**\n")
        fe = row.get("first_error") or ""
        lines.append("- **First failing `error_msg`:**\n\n```\n")
        lines.append(_truncate(fe, 1200))
        lines.append("\n```\n")
        lines.append("<details><summary>Source C (first ~35 lines)</summary>\n\n```c\n")
        lines.append(_read_c_head(rd / "inputC.c"))
        lines.append("\n```\n</details>\n\n")

    lines.append("## Implications for multi-turn / agentic repair\n\n")
    lines.append(
        "- **Compile buckets** mix “trivial” issues (illegal insn, bad prologue, stray text) with **harder** link / ABI issues. "
        "An agent that sees **gcc stderr** can often fix syntax-level mistakes in a second turn.\n"
        "- **`output_mismatch`** is the classic “wrong algorithm / off-by-one / formatting” bucket — often needs **reasoning or test feedback**, not just the compiler.\n"
        "- **`runtime_nonzero_or_signal`** with empty stderr may be **silent crashes** (UB, segfault); multi-turn runs benefit from **running under gdb or sanitizers** (not in this script).\n\n"
    )

    md_path = out_dir / "FAILURES_REVIEW.md"
    md_path.write_text("".join(lines), encoding="utf-8")
    print(json.dumps(summary_out, indent=2))
    print(f"Wrote {md_path}")
    print(f"Wrote {out_dir / 'summary.json'}")


if __name__ == "__main__":
    main()
