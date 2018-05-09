#!/usr/bin/env bash

# sha1 (secure hash algorithm 1)
# note that sha1 is considered not secure:
# https://en.wikipedia.org/wiki/SHA-1
# use sha256 instead:
# https://en.wikipedia.org/wiki/SHA-2

function genSha1HashFromFile() {
    dd if=/dev/zero of=/tmp/_ bs=1M count=1 2>/dev/null
    sha1sum /tmp/_
}

genSha1HashFromFile
