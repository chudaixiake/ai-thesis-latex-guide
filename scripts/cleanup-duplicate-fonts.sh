#!/usr/bin/env bash
# Remove duplicate nested font directories in template/.
# These are copies of fonts already at the parent level.
#
# template/SimSun/SimSun/SIMSUN.TTC  ->  remove (keep template/SimSun/SIMSUN.TTC)
# template/SimHei/SimHei/SIMHEI.TTF  ->  remove (keep template/SimHei/SIMHEI.TTF)
# template/KaiTi/KaiTi/SIMKAI.TTF   ->  remove (keep template/KaiTi/SIMKAI.TTF)

set -e
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Cleaning duplicate nested fonts in $REPO_ROOT/template/ ..."

for dup in \
    "template/SimSun/SimSun" \
    "template/SimHei/SimHei" \
    "template/KaiTi/KaiTi"; do
    target="$REPO_ROOT/$dup"
    if [ -d "$target" ]; then
        rm -rf "$target"
        echo "  Removed: $dup"
    else
        echo "  Already clean: $dup"
    fi
done

echo ""
echo "Done. Remaining font files:"
find "$REPO_ROOT/template" -name "*.TTF" -o -name "*.TTC" | sort
