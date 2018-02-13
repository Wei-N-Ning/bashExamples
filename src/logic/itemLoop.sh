#!/bin/bash

function iterateOverFilePaths {
    for filePath in $(find /work/dev/python/local -name "*.py"); do
        echo $filePath
    done
}


function run {
    iterateOverFilePaths
}


run
