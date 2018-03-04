#!/bin/bash

function callPrintf() {
    printf "int: %d, float: %f, string: %s \n" 1 3.14 "bas" 
    printf "exit status: %d\n" $?
}

# pro bash P12
function printInColumns() {
    printf "%8s %-15s:\n" 1a 2a 3a 4a 5a 6a
}

function printToVariable() {
    local __output=""
    printf -v __output "abc"
    echo $__output
}

# pro bash P30 (53)
function parseWhitespaces() {
    local pre="<"
    local post=">"
    printf "$pre%s$post\n" "$@"
}

function test_parseWhitespaces() {
    parseWhitespaces \ this "is a" 'demo of' \ doom\ version\ 1.0
}

function run() {
    callPrintf
    printInColumns
    printToVariable
    test_parseWhitespaces
}

run
