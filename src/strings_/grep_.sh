#!/usr/bin/env bash

function countMatchingLines() {
    grep -c "bin/env" $( dirname ${0} )/manip.sh
}

function countUnmatchingLines() {
    grep -v -c "bin/env" ${0}
}

countMatchingLines
countUnmatchingLines