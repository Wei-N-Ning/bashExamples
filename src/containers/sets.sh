#!/usr/bin/env bash

declare -A arr

# $1: new element
add() {
    arr[${1}]=${1}
}

# $1: an element
# return 0 if the given element is a member of the set
is_in() {
    if [[ -z ${arr[${1}]} ]]
    then
        return 1
    fi
    return 0
}

size() {
    echo ${#arr[*]}
}

runTests() {
    echo $( size )
    add 0
    add 0
    add 0
    echo $( size )
    add "thereis"
    add "thereis"
    echo $( size )
    is_in 0 && is_in "thereis" && echo "in"

    for elem in ${arr[*]}
    do
        echo -n "${elem}, "
    done

    return 0
}

runTests
