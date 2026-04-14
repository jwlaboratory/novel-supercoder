Project overview: Compiler have flags, such as --unroll, that run optimizations on the assembly. We aim to develop models that automatically select and optimize compiler flags (e.g., GCC/LLVM flags) to improve program performance (runtime, memory, etc.) beyond default compiler heuristics. This includes exploring techniques like phase ordering (the order in which you select flags matters), search-based methods, and ML-driven approaches to discover optimal flag combinations and orderings.

End vision / Goal for paper:  “We present a novel ML-driven system for compiler flag optimization that achieves xyz% speedup over -O3 baselines across diverse benchmarks, using a standardized evaluation framework.”

Required readings/prereq knowledge: 

What are compiler flags and optimization levels (-O1, -O2, -O3, -Ofast)
Why does ordering matter
What do O3 vs O2 do, why is O2 sometimes faster?
https://barish.me/blog/cpp-o3-slower/
https://caiorss.github.io/C-Cpp-Notes/compiler-flags-options.html

Learn Reinforcement Learning (RL) fundamentals (MDPs, reward design, exploration vs exploitation)
Glance over these papers
AutoPhase: AI for Ordering Code Optimizations
CompilerDream: The "Simulated" Optimizer
FOGA: Survival of the Fittest Flags



Current status of project

Each team has been assigned a paper to implement and understand to an extent so that we can come together and discuss a new novel implementation. Maybe cross referencing each other to figure out a new solution.


Week 1 To-Do:

Split into teams where everyone reviews all papers, but each team deeply implements one assigned paper and shares insights with the group.
Key things to look out for:
What RL infrastructure are they using? (are they even using RL?)
How are they preventing from getting the next best flag rather than the best COMBINATION of flags
How is the reward defined? 
What datasets are used?
Do they optimize flags, phase ordering, or both?

I just want a rough implementation (maybe even no implementation) and I care more about the learning / understanding the paper well enough to explain to others and I want everyone to THINK.

Please message me on which paper you would like to implement and understand.
If there is not a team you can join, message me and we can figure something out.