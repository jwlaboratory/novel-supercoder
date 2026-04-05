# novel-supercoder
cd novel-supercoder
uv run build-cpp-dataset --steps fetch --limit 100    # HF join + tests column
uv run build-cpp-dataset --steps compile              # fill assembly_o0..o3