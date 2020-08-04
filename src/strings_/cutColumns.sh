#!/usr/bin/env bash

set -euo pipefail

# example of inputs:
# wein     console  Dec 28 06:59
# wein     ttys000  Jan  7 17:27
# wein     ttys001  Jan  7 17:27

# it can also be implemented in awk 
# note that the second form is not as clean as using awk's field FS variable
function cutColumns() {
    who | cut -c1-8 | sort | uniq
    who | cut -f1 -d " " | sort | uniq
}

extract_columns() {
    who | perl -lane "print @F[0]"

}

function run() {
    echo "//// bash cut" && cutColumns
    echo "//// perl field" && extract_columns

    local name
    local value
    while read -r name value; do
        echo "${name} + ${value}"
    done < <(who | perl -anl -F'/\s+/' -w -E 'say "$F[1] $F[2]"')

    read -r name value < <(who | perl -anl -F'/\s+/' -w -E 'say "$F[0] $F[1]"')
    echo "${name} .. ${value}" 
}

run

