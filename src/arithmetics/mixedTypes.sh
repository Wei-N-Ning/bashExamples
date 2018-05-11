#!/usr/bin/env bash

# see: https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php
# this technique is used in source line counter program

function implicitCast() {
    local shLineCount=$( find ../ -type f -name "*.sh" | xargs wc -l | awk '/ total/ { print $1 }' )
    local pyLineCount=$( find ../ -type f -name "*.py" | xargs wc -l | awk '/ total/ { print $1 }' )
    let total=${shLineCount}+${pyLineCount}
    echo ".sh:" ${shLineCount}
    echo ".py:" ${pyLineCount}
    echo ${total}
}

implicitCast