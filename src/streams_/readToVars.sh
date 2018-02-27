#!/bin/bash

function assertStringEqual() {
    if [ ! "$1" = "$2" ]; then
        printf "failed: $1 != $2"
        exit 1
    fi
}

function readLineToVars() {
    printf "Doom\/\/ 1993 PC Dos" > /tmp/_
    read -r title year platform os < /tmp/_
    assertStringEqual 'Doom\/\/' $title
    assertStringEqual "1993" $year
    assertStringEqual "PC" $platform
    assertStringEqual "Dos" $os
}

function run() {
    readLineToVars
}

run
