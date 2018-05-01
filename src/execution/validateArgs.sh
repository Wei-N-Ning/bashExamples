#!/usr/bin/env bash

function validate() {
    if [ $# -lt 1 ]
    then
        echo "not enough args"
    fi
}

validate ${@}
validate 1
