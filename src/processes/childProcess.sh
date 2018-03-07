#!/usr/bin/env bash

function assertNotEqual() {
    if [ $1 = $2 ]
    then
        echo "$1 == $2 (should not be equal)"
        exit 1
    fi
}

function createPythonProgram() {
    echo '
import os
import time
while True:
    if os.path.exists("/tmp/poisonpill"):
        break
    time.sleep(0.5)
' > /tmp/program.py
}

function launchChild() {
    if [ -f /tmp/poisonpill ]
    then
        rm /tmp/poisonpill
    fi
    python /tmp/program.py &
}

function shutdownChild() {
    local child=$!
    echo $child
    kill -s SIGINT $child
    wait $child &> /dev/null
    assertNotEqual 0 $?
}

function run() {
    createPythonProgram
    launchChild
    shutdownChild
}

run
