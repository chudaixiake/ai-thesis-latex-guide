#!/usr/bin/env bash
# Check LaTeX environment on macOS / Linux.

set -e

echo "=== LaTeX Toolchain ==="
for cmd in xelatex biber latexmk kpsewhich; do
    if command -v "$cmd" &>/dev/null; then
        echo "  $cmd : $(command -v "$cmd")"
    else
        echo "  $cmd : NOT FOUND"
    fi
done

echo ""
echo "=== Pandoc (Word export) ==="
if command -v pandoc &>/dev/null; then
    echo "  pandoc : $(command -v pandoc)"
    pandoc --version | head -1
else
    echo "  pandoc : NOT FOUND"
    echo "  Install from https://pandoc.org/installing.html for Word export support."
fi

echo ""
echo "=== Version Info ==="
xelatex --version 2>/dev/null | head -1 || true
biber --version 2>/dev/null || true
latexmk -version 2>/dev/null | head -2 || true

echo ""
echo "=== CJK Fonts ==="
# Check common font locations
font_dirs=(
    "/usr/share/fonts"
    "/usr/local/share/fonts"
    "$HOME/.fonts"
    "$HOME/Library/Fonts"
)
for font in SimSun SimHei KaiTi; do
    found=false
    for dir in "${font_dirs[@]}"; do
        if [ -d "$dir" ] && find "$dir" -iname "*${font}*" -print -quit 2>/dev/null | grep -q .; then
            echo "  $font : FOUND in $dir"
            found=true
            break
        fi
    done
    if [ "$found" = false ]; then
        echo "  $font : NOT FOUND in system fonts"
        echo "    The project bundles fonts in paper/template/ — this is OK for LaTeX."
    fi
done

echo ""
echo "=== Project Fonts (paper/template/) ==="
for f in paper/template/SimSun/SIMSUN.TTC paper/template/SimHei/SIMHEI.TTF paper/template/KaiTi/SIMKAI.TTF; do
    if [ -f "$f" ]; then
        echo "  $f : OK"
    else
        echo "  $f : MISSING"
    fi
done
