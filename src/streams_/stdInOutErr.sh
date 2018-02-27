#!/bin/bash

# 0: stdin
# 1: stdout
# 2: stderr
function redirectionStdOutAndErr() {
    printf "asd %z %v"  > /tmp/out.txt 2> /tmp/err.txt 
    assertFileExists /tmp/out.txt
    assertFileSize /tmp/out.txt
    assertFileExists /tmp/err.txt
}

function assertFileExists() {
    if [ ! -f "$1" ]; then
        printf "ERROR: file does not exist. $1"
        exit 1
    fi
}

function assertFileSize() {
    if [ `stat -c %s "$1"` = 0 ]; then
        printf "ERROR: file has 0 size. $1"
        exit 1
    fi
}

function run() {
    redirectionStdOutAndErr
}

run
