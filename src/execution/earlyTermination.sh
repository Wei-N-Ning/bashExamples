#!/usr/bin/env bash

# source:
# https://ss64.com/bash/set.html
# 
#    -e  Exit immediately if a simple command exits with a non-zero status, unless
#        the command that fails is part of an until or  while loop, part of an
#        if statement, part of a && or || list, or if the command's return status
#        is being inverted using !.  -o errexit
#    -u  Treat unset variables as an error when performing 
#        parameter expansion. An error message will be written 
#        to the standard error, and a non-interactive shell will exit. -o nounset
# -o pipefail
# pipefail    If set, the return value of a pipeline is the value of the last (rightmost) command to 
#             exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
#             By default, pipelines only return a failure if the last command errors.

# source:
# https://stackoverflow.com/questions/821396/aborting-a-shell-script-if-any-command-returns-a-non-zero-value
#
# this is quite useful
# instead of doing:
#dosomething1
#if [[ $? -ne 0 ]]; then
#    exit 1
#fi
#
#dosomething2
#if [[ $? -ne 0 ]]; then
#    exit 1
#fi

# I can call a set up function that calls set -e
# and leave the shell to early-terminate if one
# of the commands fail

function setUp() {
    set -euo pipefail
}

function build() {
    gcc -o /tmp/notcreated /tmp/bad/non_existing.c 2>/dev/null
}

function verifyBuild() {
    # if set -e is called this function should not
    # be reached
    ls /tmp/notcreated
}

setUp
build
verifyBuild
