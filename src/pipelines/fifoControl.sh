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
    python -c "f=open('$_fifo');print f.read();f.close()" &
    echo "beef" > $_fifo
}

function demoBashWaitForPython() {
    _free
    _init
    tail $_fifo &
    python -c "f=open('$_fifo', 'w');f.write('dead');f.close()"
}

function run() {
    demoPythonWaitForBash
    demoBashWaitForPython
}

run
_free
