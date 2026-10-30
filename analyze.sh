#!/bin/bash
set -euo pipefail

if [[ $# != 1 || ! -f $1 || ! -r $1 ]]; then
    printf 'Usage: bash analyze.sh LOG_FILE (readable regular file required)\n' >&2
    exit 2
fi

awk '
BEGIN { errors = 0; warnings = 0; lines = 0 }
{
    lines++
    text = tolower($0)
    if (text ~ /error|failed/) errors++
    if (text ~ /warn/) warnings++
}
END {
    printf "lines=%d errors_or_failed=%d warnings=%d\n", lines, errors, warnings
}' < "$1"
