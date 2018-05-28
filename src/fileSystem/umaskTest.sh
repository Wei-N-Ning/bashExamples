#!/bin/sh

# source:
# https://wiki.archlinux.org/index.php/umask
# man umask

setUMask() {
    umask ${1}
}

testCreation() {
    rm -f /tmp/_
    touch /tmp/_
    ls -l /tmp/_
}

# bits 0777 should NOT be set - all files created
# from here are not readable, writable, executable!
setUMask 0777
testCreation

# set it back to rw-rw-r--
setUMask 002
testCreation

