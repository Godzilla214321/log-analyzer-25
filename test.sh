#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
printf 'INFO start\nWARN retry\nERROR denied\nfailed connection\n' >fixture.log
[[ $(bash analyze.sh fixture.log) == 'lines=4 errors_or_failed=2 warnings=1' ]]
echo 'PASS mixed log counts'
: >empty.log
[[ $(bash analyze.sh empty.log) == 'lines=0 errors_or_failed=0 warnings=0' ]]
echo 'PASS empty log'
if bash analyze.sh missing.log >/dev/null 2>&1; then exit 1;else [[ $? == 2 ]];fi
echo 'PASS missing input rejected'
echo 'passed=3 failed=0'
