#!/bin/bash

# -eq, -ne, -gt, -lt, -ge, -le
function assertIntEqual() {
    if [ $1 -ne $2 ]; then
        printf "failed: $1 != $2\n"
        exit 1
    fi
}

function run() {
    assertIntEqual 1 1
    assertIntEqual 1337 1337
}

run
