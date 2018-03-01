#!/bin/bash

function assertEqual() {
    if [ ! $1 = $2 ]; then
        printf "failed: $1 != $2\n"
        exit 1
    fi
}

function fileIsSymbolicLink() {
    [ -h /bin/awk ]
    assertEqual 0 $?
    [ -h /bin ]
    assertEqual 1 $?
}

function fileIsExecutable() {
    [ -x /bin/bash ]
    assertEqual 0 $?
    test -x /bin/bash
    assertEqual 0 $?
}

function run() {
    fileIsExecutable
}

run
