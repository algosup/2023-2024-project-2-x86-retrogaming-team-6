#!/usr/bin/env bash

set -Cue

thisDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rootDir="$(cd "$thisDir" && pwd)"
binDir="$rootDir/bin"

ROOT_DIR=$(dirname "$0")
BIN_DIR="$binDir"
DOSBOX_BIN="/opt/homebrew/bin/dosbox"
CONFIG_LOC="$ROOT_DIR"

"$DOSBOX_BIN" -c "MOUNT c $BIN_DIR" -c "C:" -c "keyb fr"