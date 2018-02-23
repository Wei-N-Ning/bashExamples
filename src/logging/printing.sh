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

function run() {
    callPrintf
    printInColumns
    printToVariable
}


run
