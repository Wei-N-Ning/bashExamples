#!/usr/bin/env bash

setUp() {
    set -e
    rm -rf /tmp/sut
    mkdir -p /tmp/sut/a/b
}

createTestFiles() {
    touch /tmp/sut/sd
    chmod u+s /tmp/sut/sd
    touch /tmp/sut/a/b/bisect
    chmod u+s /tmp/sut/a/b/bisect
}

callFind() {
    local files=$( find /tmp -perm -u+s -type f 2>/dev/null )
    echo ${files}
}

setUp
createTestFiles
callFind
