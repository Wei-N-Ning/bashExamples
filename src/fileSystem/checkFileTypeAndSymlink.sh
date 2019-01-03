#!/usr/bin/env bash

function fileInfo() {
    file $(which ls)
    file ${0}
    dd if=/dev/urandom of=/tmp/_ bs=1K count=1 2>/dev/null
    file /tmp/_
}

isSymlink() {
    touch /tmp/a && rm -f /tmp/b
    ln -s /tmp/a /tmp/b
    [[ -L /tmp/b ]] && echo "is symbolic link"

    # see also:
    # https://stackoverflow.com/questions/5767062/how-to-check-if-a-symlink-exists
}

fileInfo
isSymlink
