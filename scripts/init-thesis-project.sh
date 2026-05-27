#!/usr/bin/env bash
# Initialize an academic writing project from the scaffold.
# Usage: bash scripts/init-thesis-project.sh /path/to/MyPaper

set -e

DEST="${1:?Usage: init-thesis-project.sh <destination>}"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SCAFFOLD="$REPO_ROOT/scaffold/thesis-project"

if [ ! -d "$SCAFFOLD" ]; then
    echo "Error: Scaffold not found at $SCAFFOLD" >&2
    exit 1
fi

if [ -d "$DEST" ] && [ "$(ls -A "$DEST" 2>/dev/null)" ]; then
    echo "Error: Destination exists and is not empty: $DEST" >&2
    echo "Remove it first or choose a different path." >&2
    exit 1
fi

mkdir -p "$DEST"
cp -r "$SCAFFOLD"/. "$DEST"/

# Copy ECUST template as default placeholder
TEMPLATE_SRC="$REPO_ROOT/format/template/ecust-master"
TEMPLATE_DEST="$DEST/paper/template"
if [ -d "$TEMPLATE_SRC" ]; then
    mkdir -p "$TEMPLATE_DEST"
    cp -r "$TEMPLATE_SRC"/. "$TEMPLATE_DEST"/
    echo "Copied default template to $TEMPLATE_DEST"
    echo "Replace it with your own school or journal template."
fi

# Initialize git
if [ ! -d "$DEST/.git" ]; then
    cd "$DEST"
    git init
    git add .
    git commit -m "Initialize academic writing project"
fi

echo ""
echo "Initialized thesis project at $DEST"
echo ""
echo "Next steps:"
echo "  1. Edit docs/thesis-config.md"
echo "  2. Replace paper/template/ with your own LaTeX template"
echo "  3. Set up Zotero export to docs/references.bib"
echo "  4. Open in your editor and start writing"
