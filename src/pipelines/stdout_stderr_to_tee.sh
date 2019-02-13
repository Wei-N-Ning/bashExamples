#!/usr/bin/env bash

# motivation 
# I want to log the stdout and stderr from a process to two files
# without insulating them 
# tee is the most obvious choice

# THIS IS THE ANSWER
# https://stackoverflow.com/questions/9112979/pipe-stdout-and-stderr-to-two-different-processes-in-shell-script
# use a third file descriptor

set -euo pipefail

TEMPDIR=/var/tmp/sut

teardown() {
    rm -rf ${TEMPDIR}
}

setup() {
    teardown
    mkdir ${TEMPDIR}
    trap teardown EXIT
}

demo_stdout_stderr_to_tees() {
    # dd will print the binary blob to a file named stdout
    # and print the statistics to another file named stderr
    { dd if=/dev/urandom bs=128 count=1 2>&3 3>&- | \
        base64 | tee ${TEMPDIR}/stdout; } 3>&1 1>&2 | tee ${TEMPDIR}/stderr
}

kitchen_sink() {
    # dd's stdout (base64 binary blob) is insulated by kitchen sink
    { dd if=/dev/urandom bs=64 count=1 | \
        base64 | tee ${TEMPDIR}/stdout >/dev/null; } 2>&1 | \
        tee ${TEMPDIR}/stderr
    cat ${TEMPDIR}/stdout
}

setup
demo_stdout_stderr_to_tees
kitchen_sink
