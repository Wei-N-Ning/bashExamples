#!/bin/bash

# 0: stdin
# 1: stdout
# 2: stderr
function redirectionStdOutAndErrSeparately() {
    printf "asd %z %v"  > /tmp/out.txt 2> /tmp/err.txt 
    assertFileExists /tmp/out.txt
    assertFileSize /tmp/out.txt
    assertFileExists /tmp/err.txt
}

function redirectionStdOutAndErrToOneFile() {
    printf "asd %z %v" &> /tmp/unified.txt
    assertFileExists /tmp/unified.txt
    assertFileSize /tmp/unified.txt
}

function redirectStdInFromFile() {
    printf "asd" > /tmp/_.txt
    if [ ! `tr ,a wX < /tmp/_.txt` = "Xsd" ]; then
        printf "failed"
        exit 1
    fi
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
    redirectionStdOutAndErrSeparately
    redirectionStdOutAndErrToOneFile
    redirectStdInFromFile
}

run
