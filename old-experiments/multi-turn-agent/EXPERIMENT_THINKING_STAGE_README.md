## Experiment 1: ‘A Thinking Stage’

The goal is a multi-stage agentic loop by first adding a stage that  proposes what to improve in compiler-produced assembly (given C + `-O3`-style asm), then, a downstream model (e.g. SuperCoder-style editor) improves assembly using that thinking as extra context. The intution is that this increases total thinking time and can improve the quality of the assembly.

### Subexperiment A

We use **Qwen2.5-Coder-7B-Instruct** with a **generic** instruction: list optimizations that might speed up the assembly.

Prompt:
```text
You are given C source code and compiler-generated x86-64 assembly.

Task: List optimizations that might improve the execution speed of this assembly. Give a numbered list.
```
Example Results (nearly identical for all input)
```text
1. Use SIMD instructions
2. Optimize loop unrolling
3. Use cache-friendly data structures
4. Profile and optimize for hot loops
```

Analysis:

This is useless because the model **fills the rubric** with generic performance vocabulary instead of grounded assembly reads.
The second stage model treats this input as 100% knowledge, so it trys to optimize with a piegon hole of looking at garbage.


### Subexperiment B

We use the same model, but force the prompt to force the model to be more specific.

Prompt:
```text 
You are given C source code and its compiler-generated x86-64 assembly.
Analyze the SPECIFIC assembly below and list concrete, actionable optimizations.

Rules:
- Reference specific labels or instructions by name (e.g. "the imulq at .L7 can be replaced with...")
- Explain WHY each thing is suboptimal in THIS code
- Do NOT suggest generic advice like "use SIMD", "profile first", or "enable -O3"
- Do NOT write any assembly or C code — observations only
- Keep each item to 1-2 sentences max
```

Example Results (real Qwen2.5-Coder-7B-Instruct output on the `n`-sum-mod-`1e9+7` C program, full asm + prompt in `gemini analysis.txt`):
```text
1. The `imulq` at `.L7` can be replaced with `mulq` followed by `addq` and `subq` to
   avoid the sign extension and division operations...
2. The `sarq` operations in `.L7` can be replaced with `shrq` to improve performance,
   as `shrq` is faster on modern CPUs.
3. The `leal` instruction in `.L7` can be replaced with `addq` to simplify the code...
4. The `xorl` instructions in `.L7` can be removed if they are not necessary...
5. The `cltd` instruction in `.L7` can be removed if it is not necessary...
6. The `sarq` operations in `.L7` can be replaced with `shrq`...
7. The `leal` instruction in `.L7` can be replaced with `addq`...
   ... (points 6–67 are the same 4 suggestions repeated verbatim in a generation loop)
```

Independent review (Gemini) of this exact output:

- **Point 1 is wrong** — the `imulq`/magic-number sequence at `.L7` already implements `%1000000007` without `idiv`; replacing with `mulq` (unsigned) breaks the signed modulo semantics.
- **Point 2 is wrong** — `sarq` (arithmetic) and `shrq` (logical) run at the same speed; swapping would corrupt results for negative intermediates, which signed `%` requires.
- **Point 3 is wrong** — `leal (%r9,%rcx), %eax` is a non-destructive 3-operand add that does not touch flags; replacing with `addq` forces extra `mov`s.
- **Points 4–5 are hedged hallucinations** — `cltd` sign-extends `eax` into `edx:eax` for the next `idiv`-style step; removing it feeds garbage into `%edx`.
- **Everything after item 5** is a degenerate copy of items 2–5 in a loop.

On a second program (string-state machine, `char x[200001]` + `strlen`), the same model calls the **stack-probing** loop `subq $4096,%rsp; orq $0,(%rsp)` “inefficient” and asks to allocate `200000` in one `subq` — which would jump past the OS guard page (Stack Clash), plus it misreads the empty-string check as a scanf return check, and proposes `incq %rdx` before the load (off-by-one read).


Analysis:
This is useless because the model invents micro-edits to satisfy the “name an instruction” constraint, and the second stage **anchors** on that text as if it were ground truth. Additionally, this model is creating pure garbage improvements that are not actually improvements, and are hallucinating things to change that would break the original code



### Subexperiment C

We add to the prompt that it is allowed to say no improvement. We do this because experiment B showed hallucinations of adding random improvement suggestions (persumably because it was forced to generate some improvment suggestions)

Prompt:

```
    "You are an expert x86-64 assembly programmer and performance engineer. "
    "When given assembly code, you analyze it instruction-by-instruction and identify "
    "specific inefficiencies by referencing exact labels and instructions. "
    "You never give generic advice. You never write code. "
    "You output only a numbered list of specific observations about the given assembly. "
    "If you cannot find a real, concrete inefficiency, output NOTHING. "
    "Do not fabricate or stretch observations just to have something to say."

```

Results:
The model just says "NOTHING" for all 1700 training data examples!
The model isn't confident and isn't willing to try anything!

Analysis:
This is the **"Safe Exit" trap**. The model has no CPU simulator and cannot actually verify cycle-level claims about `-O3` assembly; evaluating whether an edit is truly a speedup is a **high-uncertainty** task. Once we simultaneously (a) heavily penalize fabrication and (b) hand it a one-token escape hatch (`NOTHING`), the confidence threshold required to emit *anything* is driven so high that the globally optimal move, from the model's perspective, is to **abstain on every input**. It chose "do no harm" over attempting the complex logic. The fix to experiment B (stop hallucinating) successfully killed the hallucinations — but only by killing all output, so there is no signal left for a downstream SuperCoder editor to condition on. Empty context is equivalent to one-shot, only slower and more expensive.



### Final takeaways

This whole “thinking stage” direction does not work for micro-optimizing `-O3` assembly because the stage-1 model has no execution oracle:

1. **Generic prompt (A)** → boilerplate advice ungrounded in this program. Noise, not signal.
2. **Specific prompt (B)** → confident, wrong, sycophantic micro-edits (e.g. `imulq`→`mulq`, `sarq`→`shrq`, removing `cltd`, collapsing stack probes) that a compliant stage-2 editor will obediently implement and **break correctness** while chasing imaginary speedups.
3. **Specific + allow-NOTHING (C)** → uniform abstention. No hallucinations, but no signal either.

The deeper issue: a one-shot SuperCoder already pattern-matches `C → optimized assembly` against its training distribution directly. Forcing a verbal "critique" stage in front of it (i) **anchors** stage 2 to stage-1 text (game of telephone), (ii) **dilutes the context** with the model's own rambling, and (iii) asks the LLM to act like a CPU simulator — which it is structurally bad at. So stage 1 actively hurts stage 2 when it speaks, and does nothing when it does not.

Directions that might actually work (not implemented here):

- **Executable reward**: compile + run against tests + measure cycles; use that as the only signal, so "improvement" is defined by the CPU, not by prose.
- **Strong-teacher RL label generation** (e.g. Opus or Gemini Pro suggesting specific optimizations, then filtering by actually running them) — but we have no ground-truth "most optimal" assembly, so even this is hard to score.
- **Shift critique to C / algorithmic level** (Big-O, allocations, stdlib misuse), using assembly only as diagnostic evidence, not as the thing being edited.
- **Actor–critic**: a second LLM explicitly told "stage 1 is probably wrong — verify before passing suggestions through."
- **Dynamic debug agent instead of static reviewer** — feed the editor real compiler errors / failed test cases rather than imagined inefficiencies.