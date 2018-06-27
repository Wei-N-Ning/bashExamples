#!/usr/bin/env bash

setUp() {
    set -e
    rm -rf /tmp/sut /tmp/_ /tmp/_.* /tmp/__*
    mkdir /tmp/sut
}

runTests() {
    local dir=/tmp/sut/a/b/c/d
    mkdir -p ${dir}
    cd ${dir}
    touch a.out
    echo $( realpath a.out )
}

setUp
runTests
