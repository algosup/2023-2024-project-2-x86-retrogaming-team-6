#!/usr/bin/env bash

set -Cue

thisDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rootDir="$(cd "$thisDir" && pwd)"
binDir="$rootDir/bin"

cd "${thisDir}/src/" \
  && nasm main.asm -f bin -o "${binDir}/main.com" \

echo "Built Successfully! ✅"

ROOT_DIR=$(dirname "$0")
BIN_DIR="$binDir"
DOSBOX_BIN="dosbox"
CONFIG_LOC="$ROOT_DIR"

"$DOSBOX_BIN" -c "MOUNT c $BIN_DIR" -c "C:" -c "keyb fr" -c "main.com"