#!/usr/bin/env bash

# it can also be implemented in awk 
# note that the second form is not as clean as using awk's field FS variable
function cutColumns() {
    who | cut -c1-8 | sort | uniq
    who | cut -f1 -d " " | sort | uniq
}

function run() {
    cutColumns
}

run

