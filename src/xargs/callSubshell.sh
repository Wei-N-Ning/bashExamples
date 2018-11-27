#!/usr/bin/env bash

# source
# https://unix.stackexchange.com/questions/209249/piping-commands-after-a-piped-xargs

# note that it invokes sh/bash to execute a complex
# shell script

main() {
    find . -type f |\
    xargs -n 1 sh -c 'echo ////////$0; head -3 $0'
}

main