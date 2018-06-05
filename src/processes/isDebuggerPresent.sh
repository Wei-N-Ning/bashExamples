#!/usr/bin/env bash

sutName=thereisacow1337
sut=/tmp/${sutName}

setUp() {
    set -e 
}

buildSUT() {
    echo "
int main() {
    return 0;
}
" > /tmp/_.c
    gcc -g -o ${sut} /tmp/_.c
}

# $1: pid
# return the tracer (debugger)'s PID or 0 if not exist
queryStatus() {
    cat /proc/${1:?"missing pid"}/status | awk '/Tracer/ {print $2}'
}

setUp
queryStatus $$
buildSUT

# spin up sut program via GDB
gdb -batch -ex "start" ${sut} &
sleep 0.1

# sut program has a debugger attached to it
queryStatus $( pidof ${sutName} )

kill $( pidof gdb )
