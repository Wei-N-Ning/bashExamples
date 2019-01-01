#!/bin/bash


# see pro bash P8
function getScriptPath() {
    echo $0
    echo $(dirname $0)
    echo "${BASH_SOURCE[0]}"
    echo "$(dirname ${BASH_SOURCE[0]})"
}


function run() {
    getScriptPath
}


run
