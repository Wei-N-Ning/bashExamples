#!/usr/bin/env bash

function createMd5hashFromFile() {
    dd if=/dev/zero of=/tmp/_ bs=1M count=10
    md5sum -t /tmp/_

    dd if=/dev/zero of=/tmp/_2 bs=1M count=10
    md5sum -t /tmp/_2
}

function createMd5hashFromString() {
    echo -n "thereisacow" | md5sum
    echo -n "thereisacow " | md5sum
}

createMd5hashFromFile
createMd5hashFromString
