#!/bin/zsh
DIR="$(cd "$(dirname "$0")" && pwd)"

export R_LIBS_USER="$DIR/_R_lib_mac"

Rscript "$DIR/scripts/main.R"

echo ""
read -n 1 -s "Press any key to close..."
echo ""