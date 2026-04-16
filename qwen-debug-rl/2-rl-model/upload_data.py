"""Upload local parquets to Modal debug-rl-data volume.

Usage:
    modal run upload_data.py              # upload all 4 parquets
    modal run upload_data.py --sc-only    # supercoder only
    modal run upload_data.py --debug-only # debug only
"""
from __future__ import annotations
from pathlib import Path
import modal

HERE     = Path(__file__).resolve().parent
DATA_DIR = HERE / "data"

app      = modal.App("upload-data")
data_vol = modal.Volume.from_name("debug-rl-data", create_if_missing=True)


@app.local_entrypoint()
def main(sc_only: bool = False, debug_only: bool = False) -> None:
    files = {}

    if not debug_only:
        files["sc_train.parquet"] = DATA_DIR / "supercoder_train.parquet"
        files["sc_val.parquet"]   = DATA_DIR / "supercoder_val.parquet"

    if not sc_only:
        files["debug_train.parquet"] = DATA_DIR / "train.parquet"
        files["debug_val.parquet"]   = DATA_DIR / "val.parquet"

    print("Uploading to debug-rl-data volume:")
    with data_vol.batch_upload(force=True) as u:
        for remote_name, local_path in files.items():
            size_mb = local_path.stat().st_size // 1024 // 1024
            print(f"  {local_path.name} ({size_mb} MB) → /data/{remote_name}")
            u.put_file(str(local_path), remote_name)

    print("Done.")
