#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

CODENET_URL="https://codait-cos-dax.s3.us.cloud-object-storage.appdomain.cloud/dax-project-codenet/1.0.0/Project_CodeNet.tar.gz"
CODENET_GZ="Project_CodeNet.tar.gz"
CODENET_TAR="Project_CodeNet.tar"
CODENET_DIR="Project_CodeNet.tar.gz.download"

TESTCASES_GDRIVE_ID="1evBDJapwRvCQK6VUCTV8ZE9WG2k3QJQr"
TESTCASES_GZ="merged_testcases.tar.gz"
TESTCASES_TAR="merged_testcases.tar"

# ── helpers ─────────────────────────────────────────────────────────────────

log()  { echo -e "\n\033[1;34m==>\033[0m \033[1m$*\033[0m"; }
warn() { echo -e "\033[1;33mWARN:\033[0m $*"; }
die()  { echo -e "\033[1;31mERROR:\033[0m $*" >&2; exit 1; }

check_cmd() {
    command -v "$1" &>/dev/null || die "'$1' is required but not installed."
}

download_gdrive() {
    local file_id="$1" dest="$2"
    log "Downloading from Google Drive (file id: $file_id) …"

    if command -v gdown &>/dev/null; then
        gdown "https://drive.google.com/uc?id=$file_id" -O "$dest"
    elif command -v curl &>/dev/null; then
        # two-step cookie dance for large Drive files
        local confirm cookie
        cookie=$(mktemp)
        curl -sc "$cookie" "https://drive.google.com/uc?export=download&id=$file_id" -o /dev/null
        confirm=$(grep -o 'download_warning_[^=]*=[^;]*' "$cookie" | head -1 | cut -d= -f2 || true)
        if [ -z "$confirm" ]; then
            # try the newer confirm token approach
            curl -L "https://drive.google.com/uc?export=download&id=$file_id&confirm=t" -o "$dest"
        else
            curl -Lb "$cookie" "https://drive.google.com/uc?export=download&confirm=$confirm&id=$file_id" -o "$dest"
        fi
        rm -f "$cookie"
    else
        die "Need gdown or curl to download from Google Drive.\n  pip install gdown"
    fi
}

# ── preflight ───────────────────────────────────────────────────────────────

check_cmd python3
log "Working directory: $SCRIPT_DIR"

# ── 1. Project CodeNet ──────────────────────────────────────────────────────

mkdir -p "$CODENET_DIR"

if [ -f "$CODENET_DIR/$CODENET_TAR" ]; then
    log "Project CodeNet tar already exists, skipping download."
elif [ -f "$CODENET_DIR/$CODENET_GZ" ]; then
    log "Project CodeNet .tar.gz found, skipping download."
else
    log "Downloading Project CodeNet (~7.8 GB) …"
    check_cmd curl
    curl -L --progress-bar "$CODENET_URL" -o "$CODENET_DIR/$CODENET_GZ"
fi

if [ ! -f "$CODENET_DIR/$CODENET_TAR" ]; then
    log "Decompressing $CODENET_GZ → $CODENET_TAR (keeps .gz) …"
    gunzip -k "$CODENET_DIR/$CODENET_GZ" || gzip -dk "$CODENET_DIR/$CODENET_GZ"
    log "Decompressed. Tar is $(du -h "$CODENET_DIR/$CODENET_TAR" | cut -f1)."
fi

# ── 2. Merged test cases ───────────────────────────────────────────────────

if [ -f "$TESTCASES_TAR" ]; then
    log "Merged test cases tar already exists, skipping download."
elif [ -f "$TESTCASES_GZ" ]; then
    log "Merged test cases .tar.gz found, skipping download."
else
    download_gdrive "$TESTCASES_GDRIVE_ID" "$TESTCASES_GZ"
fi

if [ ! -f "$TESTCASES_TAR" ] && [ -f "$TESTCASES_GZ" ]; then
    log "Decompressing $TESTCASES_GZ → $TESTCASES_TAR …"
    gunzip -k "$TESTCASES_GZ" || gzip -dk "$TESTCASES_GZ"
fi

# ── 3. Verify files ────────────────────────────────────────────────────────

[ -f "$CODENET_DIR/$CODENET_TAR" ] || die "Missing $CODENET_DIR/$CODENET_TAR"
[ -f "$TESTCASES_TAR" ]            || die "Missing $TESTCASES_TAR"

log "Files ready:"
ls -lh "$CODENET_DIR/$CODENET_TAR" "$TESTCASES_TAR"

# ── 4. Run the filter ──────────────────────────────────────────────────────

log "Running filter.py (accepted C submissions + test cases + JSONL) …"
python3 filter.py --format jsonl "$@"

log "Done! Output is in: $SCRIPT_DIR/filtered_codenet_c/"
echo "  - manifest.json              → summary stats"
echo "  - {problem}/solutions/*.c    → accepted C source"
echo "  - {problem}/test_cases/*     → input/output pairs"
echo "  - codenet_accepted_c.jsonl   → single-file JSONL for ML"
