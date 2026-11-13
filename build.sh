#!/bin/bash
# Rebuild the prebuilt static binary from source (reproducible).
# Usage: bash build.sh
DIR="$(cd "$(dirname "$0")" && pwd)"
gcc -O2 -static -o "$DIR/primes-bin" "$DIR/primes.c" -lm
