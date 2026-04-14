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

MODE="all"          # all | download | download_testcases | filter
MAX_PROBLEMS=0      # 0 = no limit
MAX_SOLUTIONS=5
FORMAT="jsonl"
EXTRA_ARGS=()

# Real archive is ~1.4 GB; failed Drive downloads are tiny HTML pages.
MERGED_TESTCASES_GZ_MIN_BYTES=$((50 * 1024 * 1024))

# ── usage ───────────────────────────────────────────────────────────────────

usage() {
    cat <<'HELP'
Usage: ./setup.sh [OPTIONS]

Modes:
  --download                  Download & decompress both datasets (no filtering)
  --download-testcases-only   Only fetch & decompress merged test cases (skips CodeNet)
  --filter                    Only run the filter (assumes data already downloaded)
  (default)                   Do both: download then filter

Filter options:
  -n, --max-problems N    Number of problems to process (0 = all, default: all)
  -s, --max-solutions N   Solutions kept per problem (default: 5)
  --format FORMAT         Output format: dir | jsonl (default: jsonl)
  --preview N             Extract N problems and print a preview

Examples:
  ./setup.sh                          # download + full filter + jsonl
  ./setup.sh --download               # just download the datasets
  ./setup.sh --download-testcases-only   # retry merged test cases only (CodeNet unchanged)
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
        --download-testcases-only) MODE="download_testcases"; shift ;;
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

file_size_bytes() {
    wc -c < "$1" | tr -d ' '
}

# If merged_testcases.tar.gz exists, it must be real gzip (not an HTML error page).
assert_valid_merged_testcases_gz_or_die() {
    local gz="${1:-$TESTCASES_GZ}"
    [ -f "$gz" ] || return 0

    local sz
    sz=$(file_size_bytes "$gz")
    if [ "$sz" -lt "$MERGED_TESTCASES_GZ_MIN_BYTES" ]; then
        die \
            "Invalid $gz (${sz} bytes). Google Drive often returns a small HTML page instead of the file.\n" \
            "  rm -f $TESTCASES_GZ $TESTCASES_TAR\n" \
            "  python3 -m pip install --user gdown\n" \
            "  ./setup.sh --download-testcases-only"
    fi
    if ! gzip -t "$gz" 2>/dev/null; then
        die \
            "$gz is not a valid gzip file.\n" \
            "  rm -f $TESTCASES_GZ $TESTCASES_TAR\n" \
            "  python3 -m pip install --user gdown\n" \
            "  ./setup.sh --download-testcases-only"
    fi
}

download_gdrive() {
    local file_id="$1" dest="$2"
    local url="https://drive.google.com/uc?id=$file_id"
    log "Downloading from Google Drive (file id: $file_id) …"

    # Large Google Drive files require gdown; plain curl typically saves an HTML confirm page (~2 KB).
    if command -v gdown &>/dev/null; then
        gdown "$url" -O "$dest"
    elif command -v python3 &>/dev/null && python3 -c "import gdown" 2>/dev/null; then
        python3 -m gdown "$url" -O "$dest"
    else
        die \
            "Merged test cases are on Google Drive and require gdown (curl cannot download this file reliably).\n" \
            "  python3 -m pip install --user gdown\n" \
            "  # if that fails: pip3 install --user gdown\n" \
            "Then re-run this script."
    fi

    assert_valid_merged_testcases_gz_or_die "$dest"
}

# ── download step ───────────────────────────────────────────────────────────

do_download() {
    log "Working directory: $SCRIPT_DIR"

    assert_valid_merged_testcases_gz_or_die

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
        assert_valid_merged_testcases_gz_or_die
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

do_download_testcases_only() {
    log "Working directory: $SCRIPT_DIR"
    log "Downloading merged test cases only (Project CodeNet is not touched)."

    if [ ! -f "$CODENET_DIR/$CODENET_TAR" ]; then
        warn "Missing $CODENET_DIR/$CODENET_TAR — needed later for ./setup.sh --filter"
    fi

    assert_valid_merged_testcases_gz_or_die

    if [ -f "$TESTCASES_TAR" ]; then
        log "Merged test cases tar already exists, skipping."
    elif [ -f "$TESTCASES_GZ" ]; then
        assert_valid_merged_testcases_gz_or_die
        log "Merged test cases .tar.gz found, skipping download."
    else
        download_gdrive "$TESTCASES_GDRIVE_ID" "$TESTCASES_GZ"
    fi

    if [ ! -f "$TESTCASES_TAR" ] && [ -f "$TESTCASES_GZ" ]; then
        log "Decompressing $TESTCASES_GZ → $TESTCASES_TAR …"
        gunzip -k "$TESTCASES_GZ" || gzip -dk "$TESTCASES_GZ"
    fi

    [ -f "$TESTCASES_TAR" ] || die "Missing $TESTCASES_TAR after decompression"
    log "Test cases ready:"
    ls -lh "$TESTCASES_TAR"
}

# ── filter step ─────────────────────────────────────────────────────────────

do_filter() {
    assert_valid_merged_testcases_gz_or_die
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
    download_testcases)
        do_download_testcases_only
        log "Test case download complete. Run './setup.sh --filter' when CodeNet is ready."
        ;;
    filter)
        do_filter
        ;;
    all)
        do_download
        do_filter
        ;;
esac
