# gen-optimize-assembly

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

issue 1: we need a way 