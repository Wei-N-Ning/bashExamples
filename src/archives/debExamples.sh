#!/usr/bin/bash env

# source:
# https://linux-tips.com/t/how-to-extract-deb-package/169

# side note: where to find such .deb files 
# http://security.ubuntu.com/ubuntu/pool/main
# example: libx/libxp

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

