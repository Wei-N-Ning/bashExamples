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

demo_tee_to_subcmd() {
    # instead of tee-ing to a file specified by a filename,
    # open a subshell that runs a program (perl) and tee to
    # its stdin;
    # the program will receive the data via stdin
    w | tee >(perl -wnl -E 'say "perl: " . $_')

    w | tee >(python -c 'import sys;print("python: ", len(sys.stdin.read()))')
}

run
