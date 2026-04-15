experiments you can do
1. train ontop of the qwen model (teach debugging only)
2. train ontop of the supercoder model (teach generation first, then debugging)
3. train debug qwen model then train the supercoder model ontop (The intuition is sound (teach debugging first, then generation)

we can eval on
1. as a separate process, just for debugging
2. as a oneshot generation model and score

scoring functions
1. using gradinet: each test case it passes is a serpate reward
2. all or nothing: only reward if it passes all test cases
3. should we include performance metrics as well? -- I think we shoudl ask it to keep performance within a certain improvmeent, or only reward if it improves performance?

dont want to reward hack for it to pass the test cases, want it to reward for maintaing speed up and passing test cases......


more things
1. extended dataset
2.  need a way to do RL with the scoring functioning happening on a server or smth elsewhere (cuz we odnt want the GPU to be doing benchmarking)

todo:
1. figure out how to do the rl (shrey)
2. do rl 3 ways
3. benchmark on validation 
4. work on long context (sambit)
5. work on flag optimize (avi, shashank, vedant)