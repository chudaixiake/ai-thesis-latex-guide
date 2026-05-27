#!/usr/bin/env bash
# Export LaTeX thesis to Word for supervisor review.
# Usage: bash scripts/export-review-docx.sh [project-root]

set -e

PROJECT_ROOT="${1:-.}"
INPUT_TEX="$PROJECT_ROOT/paper/main.tex"
OUTPUT_DOCX="$PROJECT_ROOT/docs/export/review-draft.docx"

if [ ! -f "$INPUT_TEX" ]; then
    echo "Error: Cannot find $INPUT_TEX" >&2
    exit 1
fi

if ! command -v pandoc &>/dev/null; then
    echo "Error: pandoc is not installed." >&2
    echo "Install from https://pandoc.org/installing.html" >&2
    exit 1
fi

mkdir -p "$(dirname "$OUTPUT_DOCX")"

# Remove lines that cause issues in Pandoc conversion
TEMP_TEX=$(mktemp /tmp/review-export-XXXXXX.tex)
trap 'rm -f "$TEMP_TEX"' EXIT

grep -v '\\defbibheading{bibliography}' "$INPUT_TEX" \
    | grep -v '^\\bfseries\\zihao{4}\\heiti\\normalfont$' \
    > "$TEMP_TEX"

INPUT_DIR=$(dirname "$INPUT_TEX")
ROOT_ABS=$(cd "$PROJECT_ROOT" && pwd)

cd "$INPUT_DIR"
pandoc "$TEMP_TEX" \
    --from latex \
    --to docx \
    --output "$ROOT_ABS/docs/export/review-draft.docx" \
    --resource-path "$ROOT_ABS:$INPUT_DIR:$ROOT_ABS/figures"

echo "Exported Word review draft: $OUTPUT_DOCX"
