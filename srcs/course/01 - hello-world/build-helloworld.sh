#!/usr/bin/env bash

set -Cue

thisDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rootDir="$(cd "$thisDir/../../.." && pwd)"
binDir="$rootDir/bin"

echo "$binDir"

cd "${thisDir}" \
  && nasm HelloWorld.asm -f bin -o "${binDir}/hello.com" \