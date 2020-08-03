#!/usr/bin/env bash

# see: https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php
# this technique is used in source line counter program

function implicitCast() {
    local shLineCount
    shLineCount=$(perl -wnl -E 'BEGIN{my $tt=0;}; $tt=$.; END{say $tt}' $(find .. -type f -name '*.sh'))
    local pyLineCount
    pyLineCount=$(perl -wnl -E 'BEGIN{my $tt=0;}; $tt=$.; END{say $tt}' $(find .. -type f -name '*.py'))
    local total
    total=$(("${shLineCount}" + "${pyLineCount}"))
    echo ".sh: ${shLineCount}"
    echo ".py: ${pyLineCount}"
    echo "${total}"
}

implicitCast