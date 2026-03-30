# gen-optimize-assembly

## Python (uv)

- Install: [uv](https://docs.astral.sh/uv/)
- Create the venv and install deps: `uv sync` (uses `.python-version` → 3.11)
- Jupyter / Cursor notebooks: pick kernel **Python 3.11 (gen-optimize-assembly)** (`.venv`); if missing, run  
  `uv run python -m ipykernel install --user --name gen-optimize-assembly --display-name "Python 3.11 (gen-optimize-assembly)"`

  ```bash
  cd /Users/shreybirmiwal/projects/gen-optimize-assembly
    uv sync                    
    # install / update env from lockfile
    uv add <package>           
    # add a dependency and refresh the lock
    uv run python ...         
    # run with project env without activating
  ```





ARM

Idea is that we either C code or assembly code and try to generate a more optimized assembly binary using a fine tuned LLM

Strategy
 - Take a tiny, easily RL'd tiny open source model
 - SFT:
 a) take a dataset of assembly programs
 b) use opus 4.6 or a strong model to generate a plausable optimized assembly code
 c) check that this assembly code is actually correct by running through input/output?
 d) if it is correct, keep it and SFT on this

 - RL:
 a) have lots of assembly programs
 b) try to optimize them with our model
 c) if succesful, (correctness check with i/o), (score how much more optimized w/size/efficiency) and RL on this

Drawback:
 - not determinstic compiler anymore (huge issue)



### iteration 1:
-- Leetcode questions have a lot of code + test cases that are pretty short
-- compile them with 0 optimize
-- compile them with max optimize
-- train model to take compiled 0 optimize, and to generate max optimized

RL part
-- we have leetcodes that have all sorts of test cases 


active questions
 - can we do for c++ or is the assembly to complex? 
 - should v1 be taking in assmebly unoptimized code and training to get to v3
 - start with only compiler
ARM64 gcc 15.2.0        1764
armv8-a clang 21.1.0    1764



# 

issue 1: we need a way to get all the test cases / or a different way to check correctness
issue for later
we can try this later

rn lets just fine tune on the current model




# ideas
-- use 00 as base, predict 03
-- use 03 and (mayeb the entire question as context) try to predict new 04
--


# learning
ways to improve model

1. prompting
2. rag
3. supervised fine tuning (SFT)
issue is we don't usually have examples of BEST optimal decision (so we have to resort to teaching model some suboptimal decision)
4. preference optimization (come back to this)
5. reinforcement learning (when correctness can be evaluated easily, but most optimal decisions are unknown)

So let's try 2 differnet approaches

approach 1:
SFT -- well teach it to do 03
RL -- well try to beat 03


// question: for SFT do we need to have 

can we somehow also penalize / reward if the answer it produces is still correct even tho it doesnt match exactly the otuput ? bc we don't just want SFT to learn to do 03, we want it to learn to do the best possible 03
or is taht in the RL direction only

//answer: no because SFT is just doing cross entropy loss
----  different but semantically equivalent program is still treated as wrong at many positions.

SFT alone → good at imitating a specific assembly string (e.g. “be like this -O3 dump”), not at “any assembly that is optimal and correct.”
“Best possible -O3-class behavior” (many valid assemblies, optimize a metric) is naturally an RL / preference / search story, or you change the training target (see below).

// how does SFT / RL actually work under the hood


// question: what does it mean by api / how do we run the actual assembly code with our function parameters: api in comp arch is how u program against (what os/lib exposes) 
ie how does it know (to SECRETLY) in the assembly pass in both the array size and the array itself but only show the function the array it self (its cuz of the api)


// leads to me to wonder how would it perform with SFT first then RL?  or just RL first
-- intuiton tells me RL would be better, but if it knows a little bit of SFT it might learn to do better first, with base knowledge of optimizing for o3? but it might also get steered in teh wrong direction, have conflicitng throughts.

lets just try SFT first to see how it does.


more ideas
-- try a reasoning model
-- try putting hte inptu query / assmebly in 2 x back to back to see if it can reason abt the whole thing as once as well as not just line by line 
 

--  what if we got a dataset of exactly when o3 is poorly optimized and then we use reasoning model to just identify that 





# sft approach

both pretraining and SFT use next token prediction as their underlying training objective!

q: differences with SFT and geniric fine tuning?
 - 

q: why is SFT so much cheaper than pretraining?
- cuz small dataset


q should we start w a base model or a small, fully postrained model and sft on that?
