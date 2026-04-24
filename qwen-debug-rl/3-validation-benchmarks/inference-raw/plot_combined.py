"""Single chart combining compile rate + all-tests pass rate (grouped bars).

Usage::

    python plot_combined.py
    python plot_combined.py --out my_chart.png
"""
from __future__ import annotations

import argparse
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

HERE = Path(__file__).resolve().parent

MODEL_ORDER  = ["qwen-base", "supercoder", "debug-supercoder"]
MODEL_LABELS = {
    "qwen-base":        "Qwen2.5-Coder\n7B-Instruct",
    "supercoder":       "SuperCoder\n(exp1)",
    "debug-supercoder": "Debug-SuperCoder\n(exp6 @ step 490)",
}


def plot(out: Path) -> None:
    summary = pd.read_csv(HERE / "infer_summary.csv").drop_duplicates("model", keep="last")
    summary["model_order"] = (
        summary["model"].map({m: i for i, m in enumerate(MODEL_ORDER)})
        .fillna(len(MODEL_ORDER)).astype(int)
    )
    summary = summary.sort_values("model_order").reset_index(drop=True)

    models = list(summary["model"])
    labels = [MODEL_LABELS.get(m, m) for m in models]
    x      = np.arange(len(models))
    w      = 0.38

    compile_vals = summary["compile_rate"].tolist()
    pass_vals    = summary["test_pass_rate"].tolist()
    geo_vals     = (
        pd.to_numeric(summary.get("geo_mean_speedup_floor1"), errors="coerce")
        .fillna(1.0).tolist()
        if "geo_mean_speedup_floor1" in summary.columns else None
    )

    if geo_vals is None:
        fig, ax_left = plt.subplots(figsize=(9, 6))
        axes_iter = [ax_left]
    else:
        fig, (ax_left, ax_right) = plt.subplots(1, 2, figsize=(15, 6))
        axes_iter = [ax_left, ax_right]

    # Left: compile rate + pass rate grouped
    b1 = ax_left.bar(x - w/2, compile_vals, w, label="Compile Rate",
                     color="#4C72B0", edgecolor="white", linewidth=0.8)
    b2 = ax_left.bar(x + w/2, pass_vals, w, label="All-Tests Pass Rate",
                     color="#2ca02c", edgecolor="white", linewidth=0.8)
    ax_left.bar_label(b1, fmt="%.2f", padding=3, fontsize=10)
    ax_left.bar_label(b2, fmt="%.2f", padding=3, fontsize=10)
    ax_left.set_xticks(x)
    ax_left.set_xticklabels(labels, fontsize=10)
    ax_left.set_ylabel("fraction", fontsize=11)
    ax_left.set_ylim(0, 1.12)
    ax_left.axhline(1.0, color="grey", lw=0.6, ls="--")
    ax_left.set_title("Compile Rate vs All-Tests Pass Rate", fontweight="bold")
    ax_left.legend(loc="lower left", fontsize=10)
    ax_left.grid(axis="y", alpha=0.3)
    ax_left.set_axisbelow(True)

    # Right: paper-style geo-mean speedup
    if geo_vals is not None:
        bars = ax_right.bar(x, geo_vals, 0.55, color="#C44E52",
                            edgecolor="white", linewidth=0.8)
        ax_right.bar_label(bars, fmt="%.3fx", padding=3, fontsize=10)
        ax_right.axhline(1.0, color="grey", lw=0.8, ls="--", label="baseline (1×)")
        ax_right.axhline(1.4, color="#d62728", lw=0.8, ls=":", label="paper ~1.4×")
        ax_right.set_ylim(0.95, max(max(geo_vals), 1.45) * 1.05)
        ax_right.set_xticks(x)
        ax_right.set_xticklabels(labels, fontsize=10)
        ax_right.set_ylabel("geo-mean speedup", fontsize=11)
        ax_right.set_title(
            "Geo-Mean Speedup (paper metric)\nmax(1.0, s) per sample, geo-mean over n",
            fontweight="bold",
        )
        ax_right.legend(fontsize=9, loc="upper left")
        ax_right.grid(axis="y", alpha=0.3)
        ax_right.set_axisbelow(True)

    fig.suptitle(
        "SuperCoder Raw Benchmark — sc_val (n=200, temp=0, up to 10 inputs)",
        fontsize=13, fontweight="bold", y=1.02,
    )

    fig.tight_layout()
    fig.savefig(out, dpi=150, bbox_inches="tight")
    print(f"Saved → {out}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, default=HERE / "compile_vs_passrate.png")
    args = parser.parse_args()
    plot(args.out)


if __name__ == "__main__":
    main()
