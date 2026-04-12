#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path


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


def _rate(rows: list[dict], key: str) -> float:
    if not rows:
        return 0.0
    return 100.0 * sum(1 for r in rows if bool(r.get(key, False))) / len(rows)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-dir", required=True)
    args = parser.parse_args()

    run_dir = Path(args.run_dir).resolve()
    paper_rows = _read_jsonl_by_row(run_dir / "supercoder_bench" / "row_summary.jsonl")
    our_rows = _read_jsonl_by_row(run_dir / "bench_summary.jsonl")
    total = max(len(paper_rows), len(our_rows))
    row_ids = sorted(set(paper_rows.keys()) | set(our_rows.keys()))

    compare_csv = run_dir / "paper_vs_ours.csv"
    fields = [
        "row_index",
        "paper_compiled",
        "paper_overall_correct",
        "paper_best_speedup",
        "our_asm_ok",
        "our_all_passed",
        "our_asm_mean_s",
        "our_script_exit_code",
        "compile_agree",
        "correctness_agree",
    ]
    rows_out = []
    with compare_csv.open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        for row_index in row_ids:
            p = paper_rows.get(row_index, {})
            o = our_rows.get(row_index, {})
            rec = {
                "row_index": row_index,
                "paper_compiled": p.get("paper_compiled", False),
                "paper_overall_correct": p.get("paper_overall_correct", False),
                "paper_best_speedup": p.get("paper_best_speedup", ""),
                "our_asm_ok": o.get("asm_ok", False),
                "our_all_passed": o.get("all_passed", False),
                "our_asm_mean_s": o.get("asm_mean_s", ""),
                "our_script_exit_code": o.get("script_exit_code", -1),
            }
            rec["compile_agree"] = bool(rec["paper_compiled"]) == bool(rec["our_asm_ok"])
            rec["correctness_agree"] = bool(rec["paper_overall_correct"]) == bool(rec["our_all_passed"])
            rows_out.append(rec)
            writer.writerow(rec)

    summary = {
        "rows_total": total,
        "paper_compilation_rate_pct": _rate(rows_out, "paper_compiled"),
        "our_compilation_rate_pct": _rate(rows_out, "our_asm_ok"),
        "paper_correct_rate_pct": _rate(rows_out, "paper_overall_correct"),
        "our_correct_rate_pct": _rate(rows_out, "our_all_passed"),
        "compile_agreement_rate_pct": _rate(rows_out, "compile_agree"),
        "correctness_agreement_rate_pct": _rate(rows_out, "correctness_agree"),
        "artifacts": {
            "paper_problem_results": str(run_dir / "supercoder_bench" / "problem_results.json"),
            "paper_row_summary": str(run_dir / "supercoder_bench" / "row_summary.jsonl"),
            "our_bench_summary": str(run_dir / "bench_summary.jsonl"),
            "side_by_side_csv": str(compare_csv),
        },
    }
    out_summary = run_dir / "paper_vs_ours_summary.json"
    out_summary.write_text(json.dumps(summary, ensure_ascii=False, indent=2), encoding="utf-8")

    print("Side-by-side summary:")
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    print(f"Wrote: {compare_csv}")
    print(f"Wrote: {out_summary}")


if __name__ == "__main__":
    main()
