#!/usr/bin/env bash

# source:
# https://stackoverflow.com/questions/2961673/find-missing-argument-to-exec
# https://stackoverflow.com/questions/15290186/find-a-pattern-in-files-and-rename-them

# Note the special ending "{} \;", required by
# -exec argument

runTests() {
    find ../../ \( -name '*functions*' \) \
-exec bash -c '
echo $0.kknd
' \
{} \;
}

runTests
