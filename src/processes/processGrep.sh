#!/usr/bin/env bash

function assertEqual() {
    if [ $1 != $2 ]
    then
        echo "$1 != $2"
        exit 1
    fi
}

function searchForProcess() {
    local numMatches=$( ps aux | grep '[p]ython' | awk 'END { print NR }' )
    assertEqual 1 $numMatches
    numMatches=$( ps aux | grep 'python' | awk 'END { print NR }' )
    assertEqual 2 $numMatches
}

function run() {
    searchForProcess
}

run
