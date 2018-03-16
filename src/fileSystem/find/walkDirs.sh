#!/usr/bin/env bash

rootDir="/work/dev/shell/github.com/powergun/bashExamples/src/"

function walk() {
    find ${rootDir} -type f \
    -not -path "*git/*" \
    -not -path "*_testdata/*" \
    -name "*.sh" | xargs awk '
FNR == 1 {
    split(FILENAME, tokens, "/")
    printf "\n\n(%s/%s)[src/%s/%s]\n\n", tokens[9], tokens[10], tokens[9], tokens[10]
}
/^function [a-zA-z]+/ {
    if (1 == match($2, "assert|test|run|runAll")) {
        next
    }
    split($2, cleanup, "(")
    printf "- %s\n", cleanup[1]
}
'
}

function run() {
    walk
}

run
