#!/bin/bash

function assertEqual() {
    if [ ! "$1" = "$2" ]; then
        echo "error: expected '$1'; got '$2'"
        exit 1
    fi
}

function ifElseGroup() {
    local result=$(echo "
asdd
asda
asdddd
asd1d
" | grep "asda")
    assertEqual "asda" $result
}

function run() {
    ifElseGroup
}

run
