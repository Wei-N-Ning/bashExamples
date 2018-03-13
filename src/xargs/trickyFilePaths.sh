#!/usr/bin/env bash

function run() {
    awk -v keyword="rust" '
BEGIN {IGNORECASE = 1}
{
    if (index($0, keyword) != 0 && index($0, ".mp4") != 0) {
        print $0
    }
}
' ../_testdata/videofiles.txt
}

run

