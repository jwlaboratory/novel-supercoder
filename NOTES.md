# Research notes — generative assembly optimization


### thinking abt ideas...
GNN https://distill.pub/2021/gnn-intro/

— graphs are edges nodes
— we can represent as adjacency matrix or a adjacency list (more memory efficient then giant mostly empty adjacency matrix)
— issue: graphs can represent things info about each node, each edge, or global attributes. adjacency matrixes don’t represent this well. when you change up the order, the underlying graph hasn’t changed but the LLM is confused
— we find new way of represent by doing sum of neighbors

???

open key question: how can we represent graphs in neural networks

programl  https://proceedings.mlr.press/v139/cummins21a/cummins21a.pdf
graph based

paired with a neural network (MPNN)

we need to ignore the differences in each code (tried noramlizing)
graphs create dby standard copuler tool that traverses code structure mapping out edges nodes 

improved device prediction (better on gpu vs cpu), improved (predicting if sorting / searching / what algo),, checking livelines, reacchability, etc, compilzer puzzles 

open question: can we use graph to predict better compiler flag ordering 
open q: these graphs dont work well with understandign stuff runtime representations like polymorphism


this was used to use GNNs on program graphs to predict optimal flag sets 
https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2026.1731740/full
—> though did not do phase ordering
—> did not did sequence
—> did which flags to turn on / off (only 8 flags tho)… still took a lot to train

autophase to determine phase orderings with RL https://arxiv.org/pdf/2003.00671
— ordering matters
— use DRL
— use random forest to figure out what features actually correlate with passes, then ignore irrelevant data 

what if you tried chess playing algorithm here?
—> yea some ppl tried this
alphaZero: monte Carlo tree search

or what about a greedy algorithm?


https://arxiv.org/html/2505.11480v1
superoptimization: try all strategigies but search space grows exponentially
but grows too much
they got a really nice dataset we can query later — 8mil c code
pass in C code and assembly. noticed with just C code, and no more o3 assembly it performs poorly
what if we combine this with graph representation? so graph + c + assembly through RL?
tool called hyperfine to measure execution time…. read more
check validity through passing test case 
q: so does this papers optmize the actual assembly whilst maintaining oriignal C code, or does it change the entire c code logic itself when optimizing ykwim?
a: yeah it can rewrite whatever it wants maintaining input/ouput the same

*** how did their model , qwen2.5-coder-7b-instruct was getting 61% on assembly task before any RL

huh how


- can we use auto research on reinformcement compilergym
  - how can we formally verify otimized code
- can we fine grain teh optimizations to just certain regions to programs (certain regins need x, certain regions need y)
-  - space is unbounded: you can unrol then vectorize then unrol again
-how can we make it work on any hardware, ie even hardware that is changing,
. Cross-Hardware Generalization
An optimization that makes code 1.47x faster on an NVIDIA GPU might make it slower on an AMD chip due to differences in cache sizes and hardware-level instructions.

The Research Goal: Models that are "Hardware-Aware"—meaning they can take the hardware's technical specs (cache size, register count) as an input to their optimization logic.

### improvemnet plan / questions to be answers

 - fix the data movement and pipeline. rn we store and read/write to big csvs, and go row by row. investigate the industry way to do this and understand the tradeoffs.... should we split raw vs derived data, better storage (parquet?), have better data processign pipelines (ie, if one part fails, should we retry? allow it to continue? skip row for next step? etc) should we have a way to query the data and see statistics on the data?

 - the pipeline part for the RL is super hacky. what is the best way to do this? how should we do the scoring? what should the score function be? right now we do some wonky stuff where we send it to modal to create the candidates then we send it to locally to do the scoring then send it back to modal to update the model. should be a better way to do this

 - rn we do the scoring by compiling / running the assembly locally. assembly is hardware specifici. can we fix this to not just work on mac hardware but standarized on some like linux toolchain?

 - the problem with RL rn is the sparse rewards. we don't even have a good enough SFT model that can generate valid assembly so we need to fix this. should we start with a better base model? should we do more SFT? investigate this. maybe we add more immediate signals (cheap, dese signals (ie, assembles but fails this abi/syntax issue) so it gets better intution)

 - the problem with SFT is that it generates code that looks like valid code. but it must match o3 exactly for points. this might confuse the model learning direction. maybe we change objective to RL to 1. reward actual good code that assembles from the start? with more dense / more stepped' discrete rewards?

 - the scoring is poor. we score it by running the assembly many times and seeing how fast it takes and if it passes the test cases. this doesnt check the edge cases and it depends on how fast the hardware is. how should we fix this? benchmark against some baseline and see a %? what is other ways to think about this? lines of code, size? heuristic based on how much each line takes? does LDUR take longe than certain other operations etc?


 - investigate: read about when o3 is actually not optimized maximially. can we find a dataset of code that is not maximally optimized? can we humanlly identify code that can be better optimized? ** this might be one of the most important questions to answer


- read papers on similar projects peopel have already done. what was their appraoch? what tradeoffs did they consider? what worked what didnt work? what did they list as future work?


- data issue: should we do synthetic data gen? can go multiple ways: 1. model that generates us valid C code for us to generate assembly for. or a stronger model to generate assembly directly. or maybe even generate the more optimized assembly directly that we manaully check? not sure... can we investigate this and think of how we can use this?

- base model: what is instruct version of qwen2.5-coder-0.5b? is the base model too bad? i feel the base model should answer some % of questions correctly... if its answering 0% its too poor of a base model.


- what about alpha go typa "chess solving equation" problem ? can we convert assembly code optimization to a game it has to play and play the best move?

- https://gemini.google.com/share/57dcfd0dc9c0

General
get everyone compute
start documenting current experiments + thoughts
manually find / do examples assembly optimize
read new papers
SFT team:
Issues: RL needs model that is somewhat competent, rn it’s not producing valid code [investigate]
Can/ should we use better base model?
Can we do SFT with thinking traces in between, ie “I see we can optimize xyz”
Do we need SFT at all?
Should we start with providing it o3 code asking it to further optimize that? Do we use like opus4.6 to gen the output training data for this?
RL
Can we improve the reward function: less sparse, more sparse (trade offs?)
Swap out policy, training data split etc (trade offs?)
Can we add rewards to the thinking traces from SFT as well?
Better scoring method: it stinks rn -- runs locally and benchmarks speed. Can we use smth like 
Flag optimization
Try RL?
Try chess optimizer? Think this is promising and potentially novel?
Random ideas
Can we use autoresearch to hyper parameter optimize?
Can we use the graph neural networks to help us ? can someone investigate how GNNs can represent code and if that would be better


---

## Open questions

- C++ vs C: is the assembly too complex for v1?
- Should v1 take unoptimized assembly as input and train toward an `-O3`-class output?
- Should we scope to “compiler-only” behavior (what transformations are in-bounds)?
- How do we reliably invoke generated assembly in our harness (parameters, ABI), end to end?
- How do SFT and RL work under the hood? *(still filling in)*
- What is the difference between SFT and generic fine-tuning?
- Start from a base model only, or from a small post-trained model and then SFT?
- For SFT, do we need to have … ? *(original note was incomplete)*
- Should the stack be allowed to rewrite algorithms (e.g. \(O(n^2)\) sort → \(O(n \log n)\)) when I/O matches, or only optimize locally?
- Python as the source language, or optimize at the PVM level instead?
- Is Opus-scale (or similar) labeling for SFT better than `-O3` dumps—and what batch size between generate / score / update?
- Different system prompts for SFT vs RL: worth it?
- Exact RL reward mix after correctness is nailed down (beyond “correctness first”).
- Row-by-row RL vs batch-at-end; avoiding evaluation on training rows. *(iron out tradeoffs)*
- Overall data flow: CSVs, row-by-row loops, and whether the training loop design still feels wrong once a pipeline exists.


---

**What is the goal and strategy**
Start from C or assembly and use a fine-tuned LLM to produce a more optimized assembly binary.
- Use a small open model that is feasible to train with RL.
- **SFT:** (a) dataset of assembly programs; (b) strong model (e.g. Opus) proposes plausibly optimized assembly; (c) verify correctness with I/O tests; (d) keep correct pairs and SFT on them.
- **RL:** (a) many assembly programs; (b) model tries to optimize them; (c) reward if correct (I/O) and better on size/efficiency.
The drawback is The pipeline is no longer a deterministic compiler.

Iteration 1: ? Lots of short code plus test cases: compile with `-O0` and with max optimization; train the model to map the `-O0` assembly toward the highly optimized assembly. RL can use the varied test cases.


** general ways to improve a model **

1. Prompting  
2. RAG  
3. **SFT** — you often do not have a single “best” target, so labels may be suboptimal.  
4. **Preference optimization** — revisit later.  
5. **RL** — fits when correctness is easy to check but the best policy is unknown.

Pretraining and SFT both use next-token prediction as the training objective.
SFT: teach a `-O3`-style target. RL: try to beat that target.


**What “API” means for assembly and parameters.** In architecture / systems, the API is what you program against (OS, ABI, libc). Assembly can pass both array size and pointer while the C function only names the array because of the **calling convention / ABI**, not magic in the source. The remaining work is operational: wiring a harness that runs generated assembly with the right inputs.

**Why is SFT so much cheaper than pretraining?** Mostly much smaller datasets and far fewer steps than full pretraining.

**Correct but not byte-identical to the teacher assembly.** Standard SFT with cross-entropy penalizes token mismatch: a semantically equivalent program still looks wrong at many positions. Getting “any correct, strong assembly” fits **RL, preferences, or search** better, unless you change the representation (IR, graphs, multiple references). Plain SFT on one assembly string is imitation of a single surface form.

**SFT first, then RL, or RL only?** Intuition: RL may win long term; a little SFT could teach syntax/ABI and speed early learning, or it could bias the policy badly. RL from scratch can mean mostly invalid assembly at first—huge negative reward and a weak signal for what was “almost right.” You left several parallel plans: try SFT first; try RL directly; skip SFT for now and do row-by-row RL on a tiny model; start with **offline RL**; **SFT warm start** still sounds sensible for syntax/ABI. Resolve with experiments rather than picking one note to delete.

**Formal equivalence of two programs or assemblies.** No general proof (Rice’s theorem). In practice you lean on **many tests**, not a proof.

**Does SFT make sense if the goal is not imitation?** There is real tension: one line of thought was RL-only because imitation misaligns with “best” assembly; another was SFT warm start for valid syntax/ABI. Treat both as hypotheses until metrics exist.

**How to get test cases or check correctness.** Full coverage is a blocker for rigorous training. **Deferred:** get all tests or another correctness story. **Near term:** fine-tune on current data; revisit when you can enforce stronger checks.

**Codeforces merge spec** *(see README for commands).* Under `src/codeforces-approach`, join [open-r1/codeforces](https://huggingface.co/datasets/open-r1/codeforces) with [open-r1/codeforces-submissions](https://huggingface.co/datasets/open-r1/codeforces-submissions). Build a table (you originally said first ~100 rows) with: (1) `contest_id`, `index`; (2) `official_tests`; (3) from submissions, a **passing** solution (`verdict == OK`), `programmingLanguage` **GNU C11**, matched on `contestId` and `problem_index`.

**RL reward (draft).** Correctness should dominate (e.g. large negative score if wrong; no efficiency credit until correct). Fine-grained weighting after that is still to be decided.

**Scoring script.** One script: take generated assembly, run **I/O correctness**, benchmark **efficiency** (e.g. ~30 trials) against **`-O0` and `-O3`** baselines.

**Train / val / test split and marking.** Working plan: **60%** SFT (cheap, stabilizes syntax/ABI), **15%** RL (expensive, needs benchmarking), **10%** val, **15%** test. When running “script 3” marking, only mark rows **not yet marked** so new datagen keeps the ratios.

**Opus (or similar) for SFT labels vs `-O3` dumps.** Strong models may beat a single flag, but generating and scoring **per row** before any update slows the loop. **Future:** generate a batch (e.g. 50), score, then update so the policy sees fresher feedback; policies that update on fresher data often learn better than one giant delayed batch.

**Different prompts for SFT vs RL.** Example: SFT — “mimic `-O3`.” RL — “you were trained to mimic `-O3`; now beat it while staying correct.” Hypothesis to try later.

**Generate-assembly pipeline (CSV + Docker).** Two problems: (1) holding everything in memory before writing the CSV loses progress on failure; (2) one new Docker container per row is too slow. Prefer batches (~50), flush the CSV after each batch, one container per batch.

**Optimize for size as well as speed.** LLVM’s **`-Oz`** favors minimum code size over raw speed; rewards could be multi-objective.

**Method ideas not tied to one experiment yet.** Reasoning model for hard cases; put **prompt + assembly** back-to-back so the model sees the whole program; dataset where **`-O3` is known weak** and a reasoning model spots it; targets like **`-O0` → `-O3`** or **`-O3` + full problem → stronger variant.**

**Meta: incomplete sentence in original notes.** “When generating assembly candidates they are have …” — sentence was cut off. Together with the broader worry that **CSV + row-by-row** may be the wrong shape for how you want to train; revisit after something runs end-to-end.


---
