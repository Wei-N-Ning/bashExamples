#!/usr/bin/env bash

function fileInfo() {
    file $(which ls)
    file ${0}
    dd if=/dev/urandom of=/tmp/_ bs=1K count=1 2>/dev/null
    file /tmp/_
}

fileInfo