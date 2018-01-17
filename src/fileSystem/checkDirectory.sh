#!/bin/bash


# to check if a directory exists or does not exist
checkPlainDirectory() {
    if [ ! -d "/tmp" ]; then
        echo "failed"
        exit 1
    fi
    if [ -d "/shouldNotExist" ]; then
        echo "failed"
        exit 1
    fi
}


# to take symbolic link (to directory) into account

run() {
    checkPlainDirectory
}


run

