#!/usr/bin/env bash

# a better example use subroute
TEMPDIR=/tmp/sut
finally() {
    if [[ -d ${TEMPDIR} ]]
    then
        rm -rf ${TEMPDIR}
    fi
}

setUp() {
    mkdir -p ${TEMPDIR}
    trap finally EXIT
}

setUp

ls -l ${TEMPDIR}

