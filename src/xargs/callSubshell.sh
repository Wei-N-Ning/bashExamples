#!/usr/bin/env bash

# source
# https://unix.stackexchange.com/questions/209249/piping-commands-after-a-piped-xargs

# note that it invokes sh/bash to execute a more complex
# shell script than a one-liner;
# it is very useful when I need to pass the arguments to a
# function-like execution unit;

# see also numArgs.sh example that explains xargs -n

main() {
    find . -type f |\
    xargs -n 1 sh -c '
echo "+ filename: "$0
head -3 $0
'
}

main