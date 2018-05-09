#!/usr/bin/env bash

# create a descent-sized text file (most likely for testing purpose)
# dd can be also used to profile disk IO throughput

sutOut="/tmp/_"

function createFileWithRandomBytes() {
    dd if=/dev/urandom of=${sutOut} bs=1K count=1K
    ls -l ${sutOut}
}

createFileWithRandomBytes
