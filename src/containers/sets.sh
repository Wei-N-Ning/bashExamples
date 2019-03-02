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

# borrow Python's set operator - 
# given two sets: A, B
# minus A B returns 
# set A with all the common elements removed
minus() {
    # source:
    # https://www.linuxjournal.com/content/bash-associative-arrays
    declare -A setB
    for elem in ${2:?"missing setB"}
    do
        setB[${elem}]=${elem}
    done
    perl -lane '/\S+/ && print join(" ", @F)' <(
        for elem in ${1:?"missing setA"}
        do
            [[ "${setB[${elem}]}" == "" ]] && echo -n "${elem} "
        done
    )
}

# borrow Python's set operator +
# given two sets: A, B
# plus A B returns
# the union of A and B
plus() {
    perl -lane 'BEGIN {my %l}; map {$l{$_}=$_} @F; END {print join(" ", keys(%l))}' <<<"${1} ${2}"
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
    echo 
}

runTests
echo "{A} - {B}"
minus ":set there is a cow" "there is a doll's house"
echo "{A} + {B}"
plus ":set there is a cow" "there is a doll's house"
