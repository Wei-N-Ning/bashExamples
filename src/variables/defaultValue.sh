#!/bin/bash

# $1: name of the product; if not given, print "NONE"
function printProductName {
    local n=${1:-"NONE"}
    echo $n
}


function run {
    # prints "NONE"
    printProductName
    
    # prints the supplied string
    printProductName "doom"
    printProductName "doom 2, 1993"
}


run
