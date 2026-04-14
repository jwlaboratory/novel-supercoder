notes:

1. we have columns:
idx,answer,test_cases,question

answer is the C code
test_cases is the test cases
question is the prompt including C and Assembly --> 
a) x86-64. The pasted assembly matches GCC’s x86-64 Linux output in AT&T syntax 



C code: high level
IR: internal representation, hardware agnostiic, optimized version of ur code
Assembly: architecture specific (x86-64, arm64, etc)
machine code: same as assembly, but in binary form
microarchitecture: specific implementation of 


2. no test split. only train and validation
that's fine


NEW COLUMNS
Column	What's in it
idx
row index
c_code
raw C source code
assembly
raw assembly (extracted from the HF question field)
test_cases
JSON test cases
prompt_one_shot
the original paper prompt ("generate optimized assembly")
prompt_infer_improvement
new prompt asking for ideas only, no code


3. Extended dataset: KrishPS/codenet-accepted-c
https://huggingface.co/datasets/KrishPS/codenet-accepted-c
~313k accepted C submissions from CodeNet (train split only).
Columns: problem_id, submission_id, code, test_cases, num_test_cases.

Use --extended flag to download and export as krishPS_extended_train.csv.
Same column schema as supercoder CSVs (assembly and prompt_one_shot are empty).
Rows that overlap with supercoder_val.csv are automatically excluded.