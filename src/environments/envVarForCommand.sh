#!/bin/bash


function reset {
    if [ -d /tmp/foobar ]; then
        rm -rf /tmp/foobar
    fi
    mkdir /tmp/foobar
}


function createPythonModule {
    local c="import sys;\
_=sys.stdout.write;\
[_('*') for i in xrange(18)];\
_('\n')"
    echo $c > /tmp/foobar/patternforfun.py
}


function importPythonModule {
    local cmd="import patternforfun"
    if ! PYTHONPATH=$PYTHONPATH:/tmp/foobar python -c "$cmd"; then
        echo "failed"
        exit 1
    fi
    echo
}


function verifyPythonPath {
    if [ ! -z "$PYTHONPATH"]; then
        echo "failed"
        exit 1
    fi
}


function run {
    reset
    createPythonModule
    importPythonModule
    verifyPythonPath
}


run
