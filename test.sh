#!/bin/bash
# Verify all public cases through run.sh. Exit 0 iff all pass.
DIR="$(cd "$(dirname "$0")" && pwd)"
pass=0; total=0
check() {
  total=$((total+1))
  got=$(printf '%s' "$1" | bash "$DIR/run.sh")
  if [ "$got" = "$2" ]; then pass=$((pass+1)); else echo "FAIL N=$1 => $got (expect $2)"; fi
}
check 10 4; check 100 25; check 1000 168; check 100000 9592; check 1000000 78498; check 5000000 348513
check 1 0; check 2 1; check 3 2
echo "$pass/$total passed"
[ "$pass" = "$total" ]
