#!/usr/bin/env bash

function run() {
    rm -rf /tmp/abc
    mkdir /tmp/abc

    local tmpFile=$( mktemp -p /tmp/abc -t doom.XXXXX )
    if [ ! -f ${tmpFile} ]
    then
        echo "failed"
        exit 1
    fi

    local tmpDir=$( mktemp -d -p /tmp/abc -t duke.XXXX )
    if [ ! -d ${tmpDir} ]
    then
        echo "failed"
        exit 1
    fi
}

run
