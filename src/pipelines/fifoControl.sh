#!/usr/bin/env bash

_fifo=/tmp/test.pipe

function _free() {
    rm -f $_fifo
}

function _init() {
    mkfifo $_fifo
}

function demoPythonWaitForBash() {
    _free
    _init
    python -c "with open('$_fifo') as f:  print('received:', f.read())" &
    echo "beef" > $_fifo
}

function demoBashWaitForPython() {
    _free
    _init
    tail $_fifo &
    python -c "with open('$_fifo', 'w') as f:  f.write('send to tail')"
}

function run() {
    demoPythonWaitForBash
    demoBashWaitForPython
}

run
_free
