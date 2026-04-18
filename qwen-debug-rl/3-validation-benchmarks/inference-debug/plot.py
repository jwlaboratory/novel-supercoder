"""Generate comparison charts from infer_results_*.csv and infer_summary.csv.

Usage:
    cd qwen-debug-rl/3-validation-benchmarks/inference-debug
    python plot.py                     # saves infer_comparison.png
    python plot.py --out my_chart.png
"""
from __future__ import annotations

import argparse
import ast
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np
import pandas as pd

HERE = Path(__file__).resolve().parent

MODEL_ORDER  = ["qwen-base", "supercoder-exp1", "debug1-exp3", "debug2-exp5"]
MODEL_LABELS = {
    "qwen-base":       "Qwen\nBase",
    "supercoder-exp1": "Supercoder\nExp1",
    "debug1-exp3":     "Debug1\nExp3",
    "debug2-exp5":     "Debug2\nExp5",
}
COLORS = ["#4C72B0", "#DD8452", "#55A868", "#C44E52"]


def load_data(here: Path) -> tuple[pd.DataFrame, dict[str, pd.DataFrame]]:
    summary = pd.read_csv(here / "infer_summary.csv")
    # Keep only last row per model (in case of duplicate runs)
    summary = summary.drop_duplicates("model", keep="last")
    summary["model_order"] = summary["model"].map(
        {m: i for i, m in enumerate(MODEL_ORDER)}
    )
    summary = summary.sort_values("model_order").reset_index(drop=True)

    details: dict[str, pd.DataFrame] = {}
    for model in summary["model"]:
        p = here / f"infer_results_{model}.csv"
        if p.exists():
            details[model] = pd.read_csv(p)

    return summary, details


def _parse_status_counts(raw: str) -> dict[str, int]:
    try:
        return ast.literal_eval(raw)
    except Exception:
        return {}


def plot(out: Path) -> None:
    summary, details = load_data(HERE)
    models  = list(summary["model"])
    labels  = [MODEL_LABELS.get(m, m) for m in models]
    palette = [COLORS[MODEL_ORDER.index(m)] if m in MODEL_ORDER else "#888888" for m in models]
    x       = np.arange(len(models))
    bar_w   = 0.55

    fig, axes = plt.subplots(3, 3, figsize=(16, 15))
    fig.suptitle("Model Comparison — Assembly Debug Task", fontsize=15, fontweight="bold", y=1.01)

    # ── 1. Compile rate ───────────────────────────────────────────────────────
    ax = axes[0, 0]
    vals = summary["compile_rate"].tolist()
    bars = ax.bar(x, vals, width=bar_w, color=palette, edgecolor="white", linewidth=0.8)
    ax.bar_label(bars, fmt="%.2f", padding=3, fontsize=9)
    ax.set_title("Compile Rate", fontweight="bold")
    ax.set_ylim(0, 1.15)
    ax.set_xticks(x); ax.set_xticklabels(labels, fontsize=9)
    ax.set_ylabel("fraction")
    ax.axhline(1.0, color="grey", lw=0.6, ls="--")
    ax.grid(axis="y", alpha=0.3)

    # ── 2. Test pass rate ─────────────────────────────────────────────────────
    ax = axes[0, 1]
    vals = summary["test_pass_rate"].tolist()
    bars = ax.bar(x, vals, width=bar_w, color=palette, edgecolor="white", linewidth=0.8)
    ax.bar_label(bars, fmt="%.2f", padding=3, fontsize=9)
    ax.set_title("All-Tests Pass Rate", fontweight="bold")
    ax.set_ylim(0, min(1.15, max(vals) * 2.5 + 0.05))
    ax.set_xticks(x); ax.set_xticklabels(labels, fontsize=9)
    ax.set_ylabel("fraction")
    ax.grid(axis="y", alpha=0.3)

    # ── 3. Mean correctness (clipped to [-1, 1]) ──────────────────────────────
    ax = axes[0, 2]
    vals = summary["mean_correctness"].tolist()
    bar_colors = [p if v >= 0 else "#d9534f" for v, p in zip(vals, palette)]
    bars = ax.bar(x, vals, width=bar_w, color=bar_colors, edgecolor="white", linewidth=0.8)
    ax.bar_label(bars, fmt="%.3f", padding=3, fontsize=9)
    ax.set_title("Mean Correctness Score\n(-1=compile fail, 1=all pass)", fontweight="bold")
    ax.set_ylim(min(vals) - 0.15, 1.1)
    ax.axhline(0, color="grey", lw=0.8)
    ax.set_xticks(x); ax.set_xticklabels(labels, fontsize=9)
    ax.set_ylabel("score")
    ax.grid(axis="y", alpha=0.3)

    # ── 4. Status breakdown (stacked bar) ─────────────────────────────────────
    ax = axes[1, 0]
    status_palette = {
        "ALL_PASS":    "#2ca02c",
        "RUNTIME_ERR": "#ff7f0e",
        "COMPILE_FAIL":"#d62728",
    }
    partial_color = "#9467bd"

    all_statuses_per_model = []
    for model in models:
        counts = _parse_status_counts(
            summary.loc[summary["model"] == model, "status_breakdown"].iloc[0]
        )
        all_statuses_per_model.append(counts)

    # Aggregate partial categories
    def _agg(counts: dict[str, int]) -> dict[str, int]:
        out = {}
        for k, v in counts.items():
            if k.startswith("PARTIAL"):
                out["PARTIAL"] = out.get("PARTIAL", 0) + v
            else:
                out[k] = v
        return out

    agg_counts = [_agg(c) for c in all_statuses_per_model]
    cat_order  = ["ALL_PASS", "PARTIAL", "RUNTIME_ERR", "COMPILE_FAIL"]
    cat_labels = {"ALL_PASS": "All Pass", "PARTIAL": "Partial", "RUNTIME_ERR": "Runtime Err", "COMPILE_FAIL": "Compile Fail"}
    cat_colors = {"ALL_PASS": "#2ca02c", "PARTIAL": "#9467bd", "RUNTIME_ERR": "#ff7f0e", "COMPILE_FAIL": "#d62728"}

    bottoms = np.zeros(len(models))
    for cat in cat_order:
        vals_cat = np.array([c.get(cat, 0) for c in agg_counts], dtype=float)
        ax.bar(x, vals_cat, bottom=bottoms, width=bar_w,
               color=cat_colors[cat], label=cat_labels[cat], edgecolor="white", linewidth=0.5)
        bottoms += vals_cat

    ax.set_title("Status Breakdown (counts)", fontweight="bold")
    ax.set_xticks(x); ax.set_xticklabels(labels, fontsize=9)
    ax.set_ylabel("samples")
    ax.legend(loc="upper right", fontsize=8)
    ax.grid(axis="y", alpha=0.3)

    # ── 5. Correctness distribution (box plot) ────────────────────────────────
    ax = axes[1, 1]
    box_data = []
    for model in models:
        if model in details:
            box_data.append(details[model]["correctness"].tolist())
        else:
            box_data.append([])

    bp = ax.boxplot(
        box_data, patch_artist=True, widths=0.5,
        medianprops=dict(color="black", linewidth=2),
        whiskerprops=dict(linewidth=1.2),
        capprops=dict(linewidth=1.2),
        flierprops=dict(marker="o", markersize=3, alpha=0.4),
    )
    for patch, color in zip(bp["boxes"], palette):
        patch.set_facecolor(color)
        patch.set_alpha(0.75)

    ax.set_title("Correctness Score Distribution\n(-1=compile fail … 1=all pass)", fontweight="bold")
    ax.set_xticks(range(1, len(models) + 1))
    ax.set_xticklabels(labels, fontsize=9)
    ax.set_ylabel("correctness score")
    ax.axhline(0, color="grey", lw=0.6, ls="--")
    ax.grid(axis="y", alpha=0.3)

    # ── 6. Partial-pass breakdown (what fraction pass k/N tests) ─────────────
    ax = axes[1, 2]
    # Show histogram of correctness for samples that at least compiled (>-1)
    bins = np.linspace(0, 1, 11)
    for model, color, label in zip(models, palette, labels):
        if model not in details:
            continue
        compiled_df = details[model][details[model]["correctness"] > -1]
        # Only use non-runtime-error, non-compile-fail rows (correctness >= 0)
        passing = compiled_df[compiled_df["correctness"] >= 0]["correctness"]
        if len(passing) == 0:
            continue
        ax.hist(passing, bins=bins, alpha=0.55, color=color, label=label.replace("\n", " "), edgecolor="white")

    ax.set_title("Correctness Distribution\n(compiled samples only, ≥0)", fontweight="bold")
    ax.set_xlabel("fraction of tests passed")
    ax.set_ylabel("count")
    ax.legend(fontsize=8)
    ax.grid(axis="y", alpha=0.3)

    # ── 7. Mean speedup (passing samples only) ───────────────────────────────
    ax = axes[2, 0]
    has_speedup = summary["n_speedup_measured"].sum() > 0
    if has_speedup:
        sp_means = summary["mean_speedup"].fillna(0).tolist()
        bars = ax.bar(x, sp_means, width=bar_w, color=palette, edgecolor="white", linewidth=0.8)
        ax.bar_label(bars, fmt="%.3f", padding=3, fontsize=9)
        ax.axhline(1.0, color="grey", lw=0.8, ls="--", label="baseline (1×)")
        ax.set_ylim(0, max(sp_means) * 1.3 + 0.1)
        ax.legend(fontsize=8)
    else:
        ax.text(0.5, 0.5, "No speedup data\n(re-run without --no-do-speedup)",
                ha="center", va="center", transform=ax.transAxes, fontsize=10, color="grey")
    ax.set_title("Mean Speedup\n(ALL_PASS samples only)", fontweight="bold")
    ax.set_xticks(x); ax.set_xticklabels(labels, fontsize=9)
    ax.set_ylabel("speedup vs unoptimized")
    ax.grid(axis="y", alpha=0.3)

    # ── 8. Speedup distribution (box plot, passing samples only) ─────────────
    ax = axes[2, 1]
    if has_speedup:
        sp_box_data = []
        sp_labels   = []
        sp_colors   = []
        for model, color, label in zip(models, palette, labels):
            if model not in details:
                continue
            vals_sp = details[model]["raw_speedup"].dropna().tolist()
            if vals_sp:
                sp_box_data.append(vals_sp)
                sp_labels.append(label)
                sp_colors.append(color)

        if sp_box_data:
            bp = ax.boxplot(
                sp_box_data, patch_artist=True, widths=0.5,
                medianprops=dict(color="black", linewidth=2),
                whiskerprops=dict(linewidth=1.2),
                capprops=dict(linewidth=1.2),
                flierprops=dict(marker="o", markersize=4, alpha=0.5),
            )
            for patch, color in zip(bp["boxes"], sp_colors):
                patch.set_facecolor(color); patch.set_alpha(0.75)
            ax.set_xticks(range(1, len(sp_box_data) + 1))
            ax.set_xticklabels(sp_labels, fontsize=9)
            ax.axhline(1.0, color="grey", lw=0.8, ls="--", label="baseline (1×)")
            ax.legend(fontsize=8)
    else:
        ax.text(0.5, 0.5, "No speedup data\n(re-run without --no-do-speedup)",
                ha="center", va="center", transform=ax.transAxes, fontsize=10, color="grey")
    ax.set_title("Speedup Distribution\n(ALL_PASS samples, vs unoptimized)", fontweight="bold")
    ax.set_ylabel("speedup")
    ax.grid(axis="y", alpha=0.3)

    # ── 9. Speedup histogram (all passing samples overlaid) ───────────────────
    ax = axes[2, 2]
    if has_speedup:
        any_plotted = False
        for model, color, label in zip(models, palette, labels):
            if model not in details:
                continue
            vals_sp = details[model]["raw_speedup"].dropna().tolist()
            if vals_sp:
                ax.hist(vals_sp, bins=15, alpha=0.55, color=color,
                        label=label.replace("\n", " "), edgecolor="white")
                any_plotted = True
        if any_plotted:
            ax.axvline(1.0, color="grey", lw=0.8, ls="--", label="baseline (1×)")
            ax.legend(fontsize=8)
    else:
        ax.text(0.5, 0.5, "No speedup data\n(re-run without --no-do-speedup)",
                ha="center", va="center", transform=ax.transAxes, fontsize=10, color="grey")
    ax.set_title("Speedup Histogram\n(ALL_PASS samples)", fontweight="bold")
    ax.set_xlabel("speedup vs unoptimized")
    ax.set_ylabel("count")
    ax.grid(axis="y", alpha=0.3)

    fig.tight_layout()
    fig.savefig(out, dpi=150, bbox_inches="tight")
    print(f"Saved → {out}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, default=HERE / "infer_comparison.png")
    args = parser.parse_args()
    plot(args.out)


if __name__ == "__main__":
    main()
