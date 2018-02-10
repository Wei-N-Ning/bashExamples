#!/bin/bash
# get the shell type (getting the full path to the shell executable)

function assertShellType {
    if [ ! $SHELL = "/bin/bash" ]; then
        echo "shell type not expected"
        exit 1
    fi
}


function run {
    assertShellType
}


run
