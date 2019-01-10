#!/usr/bin/env bash

# source:
# https://unix.stackexchange.com/questions/197127/test-integrity-of-zip-file

main() {
    set -e
    for fn in $( find . -name "*.zip" )
    do
        unzip -t "${fn}"
    done
}
