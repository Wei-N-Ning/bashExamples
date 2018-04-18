#!/usr/bin/env bash

function findDirectories() {
    find /work/dev/c -type d -name "build"
}

# $1 - N: a list of file extensions
function createFindPatterns() {
    local patterns=""
    for extension in ${@}
    do
        if [ "${patterns}" != "" ]
        then
            patterns="${patterns}|"
        fi
        patterns="${patterns}${extension}"
    done
    echo ${patterns}
}

function run() {
    findDirectories
}

run
