#!/bin/bash
set -euo pipefail
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
cd -- "$work"

printf 'INFO start\nWARN retry\nERROR denied\nfailed connection\n' > 'sample=25.log'
[[ $(bash "$root/analyze.sh" 'sample=25.log') == 'lines=4 errors_or_failed=2 warnings=1' ]]
printf 'PASS mixed log counts\n'

: > ./-
[[ $(bash "$root/analyze.sh" -) == 'lines=0 errors_or_failed=0 warnings=0' ]]
printf 'PASS empty log\n'

if bash "$root/analyze.sh" missing.log >/dev/null 2>&1; then
    exit 1
else
    [[ $? == 2 ]]
fi
printf 'PASS missing input rejected\n'
printf '3/3 analyzer tests passed\n'
