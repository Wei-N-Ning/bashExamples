#!/usr/bin/env bash

# source:
# find in canva's infra codebase

TEMPDIR=/tmp/sut
setUp() {
    mkdir -p ${TEMPDIR}
    trap 'rm -rf "${TEMPDIR}"' EXIT
}

setUp

# to experiment, enable this
# exit 1
# exit 127

# regardless of the exit code, the trap triggers the rm command
# to remove the temp dir!

echo

