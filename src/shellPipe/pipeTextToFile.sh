#!/usr/bin/env bash

sutDir="/tmp/abc"

function setUp() {
    rm -rf ${sutDir}
    mkdir ${sutDir}
}

function tearDown() {
    rm -rf ${sutDir}
}

function pipeMultilineTextToFile() {
    cat > ${sutDir}/sometext <<EOF
set height 0
info functions
EOF
}

function pipeScriptToFile() {
    cat > ${sutDir}/somesc.py <<EOF
from __future__ import print_function
msg = '''there is a cow
there is no spoon'''
print(msg)
class Doer(object):
    def __str__(self):
        return 'Doer:{}'.format(id(self))
def factory(numDoers):
    return [Doer() for i in range(numDoers)]
print(factory(3))
EOF
    /usr/bin/env python ${sutDir}/somesc.py
}

setUp
pipeMultilineTextToFile
pipeScriptToFile
tearDown
