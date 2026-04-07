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

# ── defaults ────────────────────────────────────────────────────────────────

MODE="all"          # all | download | filter
MAX_PROBLEMS=0      # 0 = no limit
MAX_SOLUTIONS=5
FORMAT="jsonl"
EXTRA_ARGS=()

# ── usage ───────────────────────────────────────────────────────────────────

usage() {
    cat <<'HELP'
Usage: ./setup.sh [OPTIONS]

Modes:
  --download          Only download & decompress the datasets (no filtering)
  --filter            Only run the filter (assumes data already downloaded)
  (default)           Do both: download then filter

Filter options:
  -n, --max-problems N    Number of problems to process (0 = all, default: all)
  -s, --max-solutions N   Solutions kept per problem (default: 5)
  --format FORMAT         Output format: dir | jsonl (default: jsonl)
  --preview N             Extract N problems and print a preview

Examples:
  ./setup.sh                          # download + full filter + jsonl
  ./setup.sh --download               # just download the datasets
  ./setup.sh --filter -n 100          # filter first 100 problems (skip download)
  ./setup.sh -n 50 --preview 3        # download + filter 50 problems + preview 3
  ./setup.sh --filter --format dir    # filter to directory only (no jsonl)
HELP
    exit 0
}

# ── parse args ──────────────────────────────────────────────────────────────

while [[ $# -gt 0 ]]; do
    case "$1" in
        --download)   MODE="download"; shift ;;
        --filter)     MODE="filter";   shift ;;
        -n|--max-problems)  MAX_PROBLEMS="$2"; shift 2 ;;
        -s|--max-solutions) MAX_SOLUTIONS="$2"; shift 2 ;;
        --format)     FORMAT="$2"; shift 2 ;;
        --preview)    EXTRA_ARGS+=("--preview" "$2"); shift 2 ;;
        -h|--help)    usage ;;
        *)            EXTRA_ARGS+=("$1"); shift ;;
    esac
done

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
        local confirm cookie
        cookie=$(mktemp)
        curl -sc "$cookie" "https://drive.google.com/uc?export=download&id=$file_id" -o /dev/null
        confirm=$(grep -o 'download_warning_[^=]*=[^;]*' "$cookie" | head -1 | cut -d= -f2 || true)
        if [ -z "$confirm" ]; then
            curl -L "https://drive.google.com/uc?export=download&id=$file_id&confirm=t" -o "$dest"
        else
            curl -Lb "$cookie" "https://drive.google.com/uc?export=download&confirm=$confirm&id=$file_id" -o "$dest"
        fi
        rm -f "$cookie"
    else
        die "Need gdown or curl to download from Google Drive.\n  pip install gdown"
    fi
}

# ── download step ───────────────────────────────────────────────────────────

do_download() {
    log "Working directory: $SCRIPT_DIR"

    # -- Project CodeNet --
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

    # -- Merged test cases --
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

    # -- verify --
    [ -f "$CODENET_DIR/$CODENET_TAR" ] || die "Missing $CODENET_DIR/$CODENET_TAR"
    [ -f "$TESTCASES_TAR" ]            || die "Missing $TESTCASES_TAR"

    log "Files ready:"
    ls -lh "$CODENET_DIR/$CODENET_TAR" "$TESTCASES_TAR"
}

# ── filter step ─────────────────────────────────────────────────────────────

do_filter() {
    check_cmd python3
    [ -f "$CODENET_DIR/$CODENET_TAR" ] || die "Missing $CODENET_DIR/$CODENET_TAR — run with --download first"
    [ -f "$TESTCASES_TAR" ]            || die "Missing $TESTCASES_TAR — run with --download first"

    local cmd=(python3 filter.py --format "$FORMAT"
               --max-solutions-per-problem "$MAX_SOLUTIONS")

    if [ "$MAX_PROBLEMS" -gt 0 ]; then
        cmd+=(--max-problems "$MAX_PROBLEMS")
    fi

    if [ ${#EXTRA_ARGS[@]} -gt 0 ]; then
        cmd+=("${EXTRA_ARGS[@]}")
    fi

    log "Running: ${cmd[*]}"
    "${cmd[@]}"

    log "Done! Output is in: $SCRIPT_DIR/filtered_codenet_c/"
    echo "  - manifest.json              → summary stats"
    echo "  - {problem}/solutions/*.c    → accepted C source"
    echo "  - {problem}/test_cases/*     → input/output pairs"
    if [ "$FORMAT" = "jsonl" ]; then
        echo "  - codenet_accepted_c.jsonl   → single-file JSONL for ML"
    fi
}

# ── main ────────────────────────────────────────────────────────────────────

case "$MODE" in
    download)
        do_download
        log "Download complete. Run './setup.sh --filter' to process."
        ;;
    filter)
        do_filter
        ;;
    all)
        do_download
        do_filter
        ;;
esac
