#!/bin/bash
set -euo pipefail
if [[ $# != 1 || ! -r $1 || ! -f $1 ]]; then echo 'Readable log file required' >&2;exit 2;fi
awk 'BEGIN {e=0;w=0;n=0} {n++;s=tolower($0);if(s ~ /error|failed/)e++;if(s ~ /warn/)w++} END {printf "lines=%d errors_or_failed=%d warnings=%d\n",n,e,w}' "$1"
