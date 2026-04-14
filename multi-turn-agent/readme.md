1. download
2. infer best improvement
3. gen assembly RLd model
4. fix bugs RLd model


./run.bash --0                    # download both
./run.bash --split=val --0,1      # download + infer val only
./run.bash --split=train --1      # infer train only
./run.bash --1                    # infer both (default)
./run.bash --0 --extended         # download both + KrishPS extended dataset
./run.bash --split=val --0 --extended  # download val + KrishPS extended




we found that the infer step generated bullshi

1. generated generic
updated prompt to tell specific


2. specific prompt
did badl
theory:
 - prob hallucinating bc it thigns it needs to findy improbments
 https://gemini.google.com/share/21f9f4148657


 lets try 
3. - "if u cant find a mistake dont make one up, just say nothing"
NOTHING for all



The "Sycophancy" Trap (Experiment 2)

When you tell an LLM, "Analyze this assembly and list concrete optimizations," you are operating on a hidden premise: "Optimizations definitely exist here. Find them." LLMs are inherently people-pleasers (sycophantic) and heavily biased toward task completion. If it can't find a legitimate optimization—especially in code that the compiler has already optimized well—it will hallucinate them just to fulfill your command. That is how you get the bullshit imulq -> mulq suggestions; it is just mashing x86 keywords together to look like it did its job.

The "Safe Exit" Trap (Experiment 3)

When you added, "if u cant find a mistake dont make one up, just say nothing," you gave the model an escape hatch. Evaluating x86-64 assembly is a high-uncertainty task for an LLM because it doesn't have an internal CPU simulator to test cycle counts. By heavily penalizing hallucinations, you raised its internal confidence threshold so high that it looked at the assembly, realized it wasn't 100% sure, and decided the safest course of action was to completely shut down. It chose "do no harm" over attempting the complex logic.

The Reality of "SuperCoder" Stage 1

The harsh truth is that an LLM cannot reliably beat a modern C compiler (like GCC or Clang) at micro-instruction optimization. If the compiler emitted it, it is usually already the fastest sequence of instructions for that architecture. Asking the LLM to rewrite assembly is fighting a losing battle.

How to Fix It (Ideas for Experiment 4)

If you want Stage 1 to actually infer improvements, you need to shift the focus away from micro-instructions and toward algorithmic or memory-level optimizations, using the assembly merely as diagnostic proof.

Implement Chain-of-Thought (CoT): Force the model to prove it understands the code before evaluating it.

Prompt idea: "Step 1: Map the C loops to the assembly labels. Step 2: Identify the Big-O time complexity. Step 3: Identify any cache misses or unnecessary memory allocations. Step 4: If algorithmic improvements exist, list them. If none exist, output 'OPTIMIZED'."

Focus on the C Code, not x86: Have it look for standard library misuse, inefficient structs, or loop unrolling opportunities in the C source.

Actor-Critic Multi-Agent Setup: Let Agent A generate ideas (even if some are slightly hallucinated), and have Agent B explicitly prompted as a "ruthless senior systems engineer" to critique, verify, and filter Agent A's suggestions before passing them to Stage 2.



but supercoder did indeed oneshot generate better code

Why might this thinkign stage i added perform worse then straight one shot?



It is highly counter-intuitive, but what you are experiencing is a very real, documented phenomenon in AI engineering: sometimes forcing an LLM to "think step-by-step" or plan actually degrades its performance compared to just letting it rip in one shot.

When SuperCoder generated better code in a one-shot prompt, it leaned into its strengths. When you forced it into a multi-stage "analyze then act" pipeline, it tripped over its own weaknesses.

Here is the exact breakdown of why your "thinking" stage made the final output worse:

1. The "Anchoring" Effect (Cascading Hallucinations)

In a one-shot prompt, the model looks at your code and directly generates the output. In a two-stage pipeline, Stage 2 (the coder) relies heavily on the output of Stage 1 (the thinker).

As we saw earlier, Stage 1 hallucinated a bunch of fake problems (like replacing imulq with mulq).

When Stage 2 gets that list, it assumes the list is gospel. It is "anchored" to those bad ideas and will obediently break the code to implement them. The multi-stage setup essentially created a game of telephone where the first guy lied.

2. Pattern Matching vs. Forced Logic

LLMs are not calculators; they are massive probability engines.

One-Shot: When you ask it to "optimize this C code," the LLM looks at the whole chunk of text, pattern-matches it against millions of highly optimized open-source repos it was trained on, and spits out a statistically probable, highly optimized version of your algorithm.

Multi-Stage: When you force it to look at x86-64 assembly and verbally explain why it is bad, you are forcing it to act like a CPU simulator. It is terrible at this. It loses the forest for the trees, focusing on micro-instructions rather than the holistic algorithm.

3. The "Obligation to Criticize" (Sycophancy)

When you put an LLM in a "thinking" or "reviewing" stage, it feels intense pressure to justify its existence. If you give an LLM perfectly optimized -O3 assembly and say, "Find the flaws," it will almost never say, "Looks good to me!" Instead, it will invent flaws just to fulfill the prompt's implied quota. A one-shot prompt skips this performative criticism and just writes the best code it knows how.

4. Context Dilution

By the time the model actually gets to writing code in Stage 2, its context window is clogged up with all the text it generated in Stage 1. Instead of paying 100% attention to the original C code and assembly, it is paying 50% attention to the code and 50% attention to its own rambling analysis.

The Takeaway: Multi-stage reasoning (Agentic workflows) is brilliant for large, sprawling tasks (e.g., "Build a full React app with 5 files"). But for atomic, highly constrained, pattern-heavy tasks like micro-optimizing a single C function, the LLM's initial "gut reaction" (one-shot) is often much more accurate than its forced logical reasoning.

What exactly is Stage 2 of SuperCoder doing right now—is it taking the Stage 1 analysis and rewriting the C code, or is it trying to rewrite the assembly directly?

