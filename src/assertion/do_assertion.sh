#!/usr/bin/env bash

# see the implemention of perl-like die() function in
# logging sub project

printInColor() {
    local RED='\033[0;31m'
    local NC='\033[0m' # No Color
    printf "${RED}${1}${NC}\n"
}

# $1: line number
print_location() {
    local ln=${1:?"missing lineno!"}
    local n=3  # number of lines before and after, hardcoded
    local absfilename=$( python -c \
        "import os;s=os.path.realpath('${BASH_SOURCE[0]}');print(s)" )
    local _range=$( python -c \
        "s=${ln}-${n};e=${ln}+${n};r=(s if s>0 else 0, e);print('{},{}p'.format(*r))" )
    echo "${absfilename}, line:${ln}"
    sed -n ${_range} ${absfilename}
}

# $1: ret code
# $2: line number $LINENO
# $3: optional message
throw_assert_error() {
    printInColor "ASSERT_ERROR: ${3}" && print_location ${2}
    exit 1
}

# $1: ret code
# $2: line number $LINENO
# $3: optional message
assert() {
    [[ ! -z ${1} ]] && throw_assert_error "$@"
}

main() {
    rm -f /non/exist
    assert $? $LINENO "delete non-existing file"
}

main
