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


issue: the code was compiled on linux machien so the assembly code generated is speicifc to the linux machines...
we need to run on linux through doccer or smth

or what if we recompile eveyrhting on teh mac machine? 
---> we will need to create a driver (main) and also include stdio in the original C file

this complicates things bc its not as straight forward, need to add a main method to each C file aswell.

potential solution:
To actually do training:
 -- Take each C file, compile it with gcc -O0, and gcc -O3.
 -- Fine 


--> can u formally prove the behavior (programs are the same)? no cuz of rice theorum, we cant we can only prove using lots of test cases good enough

--> lets just RL approach SFt doesnt make sense (immitaiton issue) 


 wait why not use python as base language
 ---> we would need to compile the python code to assembly
 https://www.perplexity.ai/search/python-how-does-python-get-com-oYwFKdzTRVKvXsNd8Sml5w
 thought: can we do optimization on PVM instead...
 *** Q for later **



 --> do we want the  compiler to optimize the user code or to still deterministically take each assembly line and (allowed to optimize that)

 say if u right a n^2 sort, will it rewrite ot a nlog n sort bc the i/o is correct





 ------------------------------------------
 @src/codeforces-approach go into this folder.

use this https://huggingface.co/datasets/open-r1/codeforces  (dataset card https://huggingface.co/datasets/open-r1/codeforces-submissions )

and then use https://huggingface.co/datasets/open-r1/codeforces-submissions  (dataset card https://huggingface.co/datasets/open-r1/codeforces-submissions )

Create a pandas file that has the first (100 lines) that contain:
1. 'contest_id' , 'index' 
2. 'official_tests'
3. FROM OTHER 2nd dataset the paired solution , use the 'contestId' and  'problem_index' for a solutuon that passes , filter GNU C11 on programmingLanguage and column verdict = OK
------------------------------------------


running data pipelines
```bash

uv run python "src/codeforces-approach/1-build_codeforces_dataframe.py" --limit 1000000 --output /Users/shreybirmiwal/projects/gen-optimize-assembly/src/codeforces-approach/data

uv run python "src/codeforces-approach/2-generate_assembly.py"

```


# RL scoring mechanism

-->  weight in correctness (0 points efficinecy, -999 points for correctness)
-->  after that 

# 



i think if we shd do SFT warm start so it knows what correct assembly syntax and ABI and shi looks like 

the issue with just doing RL straight up is that itll keep getting huge negative reward at start bc itll keep generating incorrect assembly code and get negative. so it wont know what it got right or wrong and wotn learn


lets just try it w RL directly tho just to see.

for now, lets skip the SFT even tho its probably smart. lets jump straight into RL. Lets go row by row and run RL  on a tiny coding model. lets have it generate assembly code for each row by row

Lets make a seperate script for scoring. this will take a generated assembly code and then run it for correctness through input/output examples and also for efficiency benchmarked over like 30 trials against the 0o and 03 code

what are ur thoughts? iron out each tradeoff and shi in this
ig it matters if we go row by row and RL or do at end? we also dont wanat it to test on training data at end?



lets start with offline RL first


we shoudl probably split into SFT/RL/Test 
60% SFT --> cheap and stabalizes syntax/abi learning
15% RL --> expensive cuz need to be benchmarj
10% val
15% test


when we run our script 3 marking, we make it only mark rows not already marked
- > this is so new rows we add from datagen again maintain ratio of SFT/RL/Test






2 issues rn with our generate assembly
1 - it does it all in mem before writing to the csv
so it can fial and its cooked

2 - it also creates new docker containser for each row
lets do in batches of like 50 where we write to csv after each batch but also do one contaienr for all 50



you can also optimize for size
some assemblers "-Oz is an optimization level flag that tells LLVM to prioritize minimizing code size over raw performance."

maybe it would make sense to the first step have like a strong model like Opus do the SFT part .... this would be (*better than o3?*)


the only problem with this is that it generates fully for each rwo then i score then it learns

whereas itd prob be best to generate like 50, then i scoere, tehn it learns right

just a thought
In future miht be smth i work on ill put these in my notes 


That usually helps because the policy keeps adapting to fresher data instead of waiting for one giant delayed update.

