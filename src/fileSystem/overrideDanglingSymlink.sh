#!/usr/bin/env bash

setUp() {
    set -e
    rm -rf /tmp/sut /tmp/_ /tmp/_.* /tmp/__*
    mkdir /tmp/sut
}

createTestFiles() {
    touch /tmp/sut/actual
    ln -s /tmp/sut/actual /tmp/sut/alink
    rm /tmp/sut/actual
    touch /tmp/sut/newguy
    echo $( cp /tmp/sut/newguy /tmp/sut/alink 2>&1 )
    cp --remove-destination /tmp/sut/newguy /tmp/sut/alink
}

setUp
createTestFiles
