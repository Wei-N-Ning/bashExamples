#!/usr/bin/env bash

zipPatternArray() {
    patterns="a b c aa bb cc"
    newPatterns=$( python -c "import sys; [sys.stdout.write('-e {} '.format(pat)) for pat in sys.argv[1:]]" ${patterns} )
    echo "${newPatterns}"
}

main() {
    zipPatternArray
}

main
