#!/usr/bin/env bash

function validate() {
    if [[ $# -lt 1 ]]
    then
        echo "not enough args"
    fi

    # a better way is:
    local name=${1:?"missing name param"}
    local type=${2:?"missing type param"}
    local address=${3:?"missing address param"}
    echo "${type}.${name}@${address}"
}

( validate ${@} ) >/dev/null 2>&1
validate foo str e1m1
