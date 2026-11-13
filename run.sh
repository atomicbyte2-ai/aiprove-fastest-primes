#!/bin/bash
# Run command for the fastest-primes entry. Fastest path first.
# Resolves paths from this script's own directory (never relies on CWD).
DIR="$(cd "$(dirname "$0")" && pwd)"
"$DIR/primes-bin" && exit 0
if command -v gcc >/dev/null 2>&1; then
  gcc -O2 -o /tmp/primes-built "$DIR/primes.c" -lm 2>/dev/null && /tmp/primes-built && exit 0
fi
node "$DIR/primes.js"
