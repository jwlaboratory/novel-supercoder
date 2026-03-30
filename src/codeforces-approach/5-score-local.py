from __future__ import annotations

import argparse
import json
import subprocess
from collections import Counter
from pathlib import Path

DEFAULT_INPUT_PATH = Path("src/codeforces-approach/data/generated_candidates.jsonl")
DEFAULT_OUTPUT_PATH = Path("src/codeforces-approach/data/scored_rollouts.jsonl")
DEFAULT_SCORER_COMMAND = (
    "uv run python src/codeforces-approach/6-scorer.py "
    "--use-docker --docker-image gcc:13 --docker-platform linux/arm64"
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Score generated candidates locally (where assembly execution happens) "
            "and write scored rollouts for Modal offline RL training."
        )
    )
    parser.add_argument("--input-path", default=str(DEFAULT_INPUT_PATH))
    parser.add_argument("--output-path", default=str(DEFAULT_OUTPUT_PATH))
    parser.add_argument("--scorer-command", default=DEFAULT_SCORER_COMMAND)
    parser.add_argument("--max-records", type=int, default=0)
    parser.add_argument("--scorer-timeout-seconds", type=int, default=300)
    parser.add_argument("--reward-on-scorer-error", type=float, default=-1000.0)
    return parser.parse_args()


def load_candidates(path: Path, max_records: int) -> list[dict]:
    if not path.exists():
        raise FileNotFoundError(f"Input candidates file not found: {path}")

    candidates: list[dict] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_number, line in enumerate(handle, start=1):
            text = line.strip()
            if not text:
                continue
            try:
                item = json.loads(text)
            except json.JSONDecodeError as exc:
                raise ValueError(
                    f"Invalid JSON in {path} at line {line_number}: {exc}"
                ) from exc
            if not isinstance(item, dict):
                continue
            candidates.append(item)
            if max_records > 0 and len(candidates) >= max_records:
                break
    return candidates


def score_candidate(payload: dict, args: argparse.Namespace) -> dict:
    try:
        result = subprocess.run(
            ["bash", "-lc", args.scorer_command],
            input=json.dumps(payload),
            text=True,
            capture_output=True,
            timeout=args.scorer_timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "reward": args.reward_on_scorer_error,
            "status": "scorer_timeout",
            "scorer_stdout": "",
            "scorer_stderr": "",
        }

    if result.returncode != 0:
        return {
            "reward": args.reward_on_scorer_error,
            "status": f"scorer_failed_{result.returncode}",
            "scorer_stdout": result.stdout.strip(),
            "scorer_stderr": result.stderr.strip(),
        }

    try:
        score = json.loads(result.stdout)
    except json.JSONDecodeError:
        return {
            "reward": args.reward_on_scorer_error,
            "status": "scorer_invalid_json",
            "scorer_stdout": result.stdout.strip(),
            "scorer_stderr": result.stderr.strip(),
        }

    if "reward" not in score:
        score["reward"] = args.reward_on_scorer_error
        score["status"] = "missing_reward"
    return score


def infer_correct(score: dict) -> bool | None:
    explicit = score.get("correct")
    if isinstance(explicit, bool):
        return explicit

    correctness = score.get("correctness")
    if isinstance(correctness, dict):
        all_passed = correctness.get("all_passed")
        if isinstance(all_passed, bool):
            return all_passed
    return None


def clean_candidate_assembly(text: str) -> str:
    cleaned = str(text).strip()
    if "<OPTIMIZED_ASSEMBLY>" in cleaned:
        cleaned = cleaned.split("<OPTIMIZED_ASSEMBLY>", 1)[1]
    if "</OPTIMIZED_ASSEMBLY>" in cleaned:
        cleaned = cleaned.split("</OPTIMIZED_ASSEMBLY>", 1)[0]
    cleaned = cleaned.strip()

    if cleaned.startswith("```"):
        lines = cleaned.splitlines()
        if lines and lines[0].startswith("```"):
            lines = lines[1:]
        if lines and lines[-1].strip().startswith("```"):
            lines = lines[:-1]
        cleaned = "\n".join(lines).strip()

    return cleaned


def main() -> None:
    args = parse_args()
    candidates = load_candidates(Path(args.input_path), args.max_records)
    if not candidates:
        raise RuntimeError("No candidate records found in input file.")

    output_path = Path(args.output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    records: list[dict] = []
    status_counter: Counter[str] = Counter()
    compile_ok_counter: Counter[str] = Counter()
    sample_compile_error: str = ""

    for item in candidates:
        payload = {
            "contest_id": item.get("contest_id"),
            "index": item.get("index"),
            "official_tests": item.get("official_tests", ""),
            "accepted_cpp_solution": item.get("accepted_cpp_solution", ""),
            "assembly_o0": item.get("assembly_o0", ""),
            "assembly_o3": item.get("assembly_o3", ""),
            "candidate_assembly": clean_candidate_assembly(item.get("candidate_assembly", "")),
        }
        if not str(payload["candidate_assembly"]).strip():
            continue

        score = score_candidate(payload, args)
        status_counter[str(score.get("status", "<none>"))] += 1
        compile_ok_counter[str(score.get("candidate_compile_ok", "<none>"))] += 1
        if not sample_compile_error and score.get("candidate_compile_error"):
            sample_compile_error = str(score["candidate_compile_error"])
        records.append(
            {
                "contest_id": item.get("contest_id"),
                "index": item.get("index"),
                "row_id": item.get("row_id"),
                "prompt": item.get("prompt", ""),
                "candidate_assembly": item.get("candidate_assembly", ""),
                "reward": float(score.get("reward", args.reward_on_scorer_error)),
                "correct": infer_correct(score),
                "score": score,
            }
        )

    with output_path.open("w", encoding="utf-8") as handle:
        for record in records:
            handle.write(json.dumps(record) + "\n")

    rewards = [record["reward"] for record in records]
    avg_reward = (sum(rewards) / len(rewards)) if rewards else 0.0
    print(f"scored {len(records)} candidates -> {output_path}")
    print(f"avg_reward={avg_reward:.4f}")
    if rewards:
        print(f"best_reward={max(rewards):.4f}")
    print(f"status_counts={dict(status_counter)}")
    print(f"candidate_compile_ok_counts={dict(compile_ok_counter)}")
    if sample_compile_error:
        preview = sample_compile_error.replace("\n", "\\n")
        print(f"sample_compile_error={preview[:280]}")


if __name__ == "__main__":
    main()
