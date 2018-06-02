#!/usr/bin/bash env

debPath="../_testdata/libxp6_1.0.0-1_amd64.deb"

setUp() {
    set -e
    rm -rf /tmp/out
    mkdir -p /tmp/out
}

unpackDebFile() {
    dpkg -x ${debPath} /tmp/out
    find /tmp/out -type f
}

tearDown() {
    :
}

setUp
unpackDebFile
tearDown

