#!/usr/bin/env bash

function getAbsolutePath() {
    local absPath=$( realpath ../_testdata )
    echo ${absPath}
    if [ ! -d ${absPath} ]
    then
        echo "failed"
        exit 1
    fi
}

# $( ... ) may contain variable expansion expression
function getAbsolutePathByVar() {
    local p=${1:?missing dir path}
    p=$( realpath ${p} )
    echo ${p}
    if [ ! -d ${p} ]
    then
        echo "failed"
        exit 1
    fi
}

function run() {
    getAbsolutePath
    getAbsolutePathByVar ../_testdata
}

run
