#!/bin/bash
# tee creates two output streams:
# one goes to ts, which adds timestamp to each line
# -- to experiment, I add another output stream that is handled by another ts
# one goes to stdout which is received by wc 
# see this post:
# https://unix.stackexchange.com/questions/28503/how-can-i-send-stdout-to-multiple-commands

function createExec() {
    local workload=${1:-15}
    local timeSleeping=${2:-0.05}
    echo "
import time
for i in xrange(${workload}):
    time.sleep(${timeSleeping})
    print '/asd/asd/t/ea/ad'
" > /tmp/_.py
}

function assertEqual() {
    if [ ! "$1" = "$1" ]; then
        printf "lhs $1 != rhs $2"
        exit 1
    fi
}

function assertFile() {
    if [ ! -f "$1" ]; then
        printf "file: $1 does not exist"
        exit 1
    fi
}

function run() {
    local workload=30
    local timeSleeping=0.01
    createExec $workload $timeSleeping
    if [ -f /tmp/log.txt ]; then
        rm /tmp/log.txt
    fi
    local result=$(
        python /tmp/_.py |
        tee \
            >(cat > /tmp/log.txt) \
            >(cat > /tmp/another.txt) | 
        wc -l
    )
    assertEqual 30 $result
    assertFile /tmp/log.txt
    assertEqual 30 $(wc -l /tmp/log.txt)
    
    diff /tmp/log.txt /tmp/another.txt
    wc -l /tmp/log.txt
    wc -l /tmp/another.txt
}

run
