#!/bin/bash

# pipelines connect the standard output of one command directly
# to the standard input of another
function writeToTee() {
    printf "%s\n" "$RANDOM" "$RANDOM" "$RANDOM" | tee /tmp/_ &> /tmp/__
    if [ ! -z `diff /tmp/_ /tmp/__` ]; then
        printf "failed"
        exit 1
    fi
}

function run() {
    writeToTee
}

run
