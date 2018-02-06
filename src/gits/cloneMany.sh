#!/bin/bash

tempDir="/tmp/`uuidgen`"

makeTempDir() {
    mkdir $tempDir
    echo "created temporary directory:"
    echo $tempDir
}

# $1: name of the repo; to be passed to git-clone
# $2: url of the repo; to be passed to git-clone
# $3: (optional) the name of the branch; by default is master
shallowClone() {
    echo "---- cloning $1 ----"
    local branch="$3"
    if [ -z $branch ]; then
        branch="master"
    fi
    if ! (git clone --depth=1 -b $branch $2 "$tempDir/$1") then
        exit 1
    fi
    echo "DONE"
}

# $1: name of the repo
runTests() {
    echo "---- running tests in $1 ----"
    local testDir="$tempDir/$1/tests"
    if ! (python $testDir a) then
        exit 1
    fi
    echo "PASSED"
}

runAll() {
    makeTempDir
    shallowClone "" ""
    runTests ""
}


runAll
