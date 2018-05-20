#!/usr/bin/env bash

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
    set -e
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
