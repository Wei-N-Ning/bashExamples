#!/usr/bin/env bash

setUp() {
    set -e
    rm -rf /tmp/sut /tmp/_ /tmp/_.* /tmp/__*
    mkdir /tmp/sut
}

runTest() {
    dot ./bst_wnull.gv |
    neato -n -Tpng -o /tmp/sut/test_wnull.png &&
    eog /tmp/sut/test_wnull.png
}

runTestWithoutFormat() {
    dot ./bst.gv |
    neato -n -Tpng -o /tmp/sut/test.png &&
    eog /tmp/sut/test.png
}

setUp
#runTest
runTestWithoutFormat
