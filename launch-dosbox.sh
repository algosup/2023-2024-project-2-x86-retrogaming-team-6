#!/usr/bin/env bash

ROOT_DIR=$(dirname "$0")
BIN_DIR="$ROOT_DIR/bin"
DOSBOX_BIN="/opt/homebrew/bin/dosbox"
CONFIG_LOC="$ROOT_DIR"


x"$DOSBOX_BIN" -conf "$CONFIG_LOC"

"$DOSBOX_BIN" -c "MOUNT c $BIN_DIR"
