#!/usr/bin/env bash

function printInColor() {
    local RED='\033[0;31m'
    local NC='\033[0m' # No Color
    printf "${RED}${1}${NC}\n"
}

# $1: ret code
# $2: line number $LINENO
# $3: optional message
assert() {
    if [[ ! -z "$1" ]]
    then
        local ln=${2:?missing lineno!}
        local n=3  # number of lines before and after, hardcoded
        local absfilename="$( pwd )/${BASH_SOURCE[0]}"
        local _range=$( python -c \
            "s=${ln}-${n};e=${ln}+${n};r=(s if s>0 else 0, e);print('{},{}p'.format(*r))" )
        printInColor "//// assert() error ////"
        if [[ "$3" != "" ]]
        then
            printInColor "$3"
        fi
        echo "${absfilename}, line:$2"
        sed -n ${_range} ${absfilename}
        exit 1
    fi
}

main() {
    rm -f /non/exist
    assert $? $LINENO "delete non-existing file!"
}

main
