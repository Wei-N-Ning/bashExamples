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
[_('') for i in xrange(18)];\
_('')"
    echo $c > /tmp/foobar/patternforfun.py
}


function importPythonModule {
    local cmd="import patternforfun;assert patternforfun"
    if ! PYTHONPATH=$PYTHONPATH:/tmp/foobar python -c "$cmd"; then
        echo "failed"
        exit 1
    fi
}


function verifyPythonPath {
    if [ ! -z "$PYTHONPATH"]; then
        echo "failed"
        exit 1
    fi
}


function verifyEnvVarInPython {
    local cmd="import os;assert os.environ['BASHEXAMPLE'] == '1'"
    if ! BASHEXAMPLE=1 python -c "$cmd"; then
        echo "failed"
        exit 1
    fi
}


function run {
    reset
    createPythonModule
    importPythonModule
    verifyPythonPath
    verifyEnvVarInPython
}


run
