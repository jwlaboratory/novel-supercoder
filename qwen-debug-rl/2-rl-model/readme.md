experiments you can do

1. train ontop of the qwen model (teach debugging only)
2. train ontop of the supercoder model (teach generation first, then debugging)
3. train debug qwen model then train the supercoder model ontop (The intuition is sound (teach debugging first, then generation)

we can eval on
1. as a separate process, just for debugging
2. as a oneshot generation model and score


more things
1. extended dataset
2.  need a way to do RL with the scoring functioning happening on a server or smth elsewhere (cuz we odnt want the GPU to be doing benchmarking)