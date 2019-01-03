#!/bin/bash

function test_stringIsEmpty() {
    if [ -z "" ]; then
        echo "-z works"
    fi

    # -n: test if a string has length
    ( test -n ""; echo $? )
    ( test -n "asd"; echo $? )
}

function test_stringEqual() {
    if [ "doom" != "DOOM" ]; then
        echo "!= works"
    fi
}

# test if string A contains string B
# $1: string A (or lhs)
# $2: string B (or rhs)
#
# usage:
# if ( stringContains "doom" "oo" ); then
#   ......
# fi
# 
# implementation:
# compose a pattern using string B and test if string A 
# satisfy this pattern
function stringContains() {
    case $1 in
        *"$2"*) true ;;
        *) false ;;
    esac
}

function test_stringContains() {
    if ( stringContains "doom" "pp" )
    then
        printf "unexpected\n"
        exit 1
    fi
    if ( stringContains "Doo" "om" )
    then
        printf "unexpected\n"
        exit 1
    fi
    if ( ! stringContains "doom" "o" )
    then
        printf "unexpected\n"
        exit 1
    fi
}

function stringIsDigit() {
    case $1 in
        *[!0-9]*) false ;;
        *) true ;;
    esac
}

function test_stringIsDigit() {
    if ( ! stringIsDigit "123" )
    then
        printf "unexpected\n"
        exit 1
    fi
    if ( ! stringIsDigit "0" )
    then
        printf "unexpected\n"
        exit 1
    fi
    if ( stringIsDigit "1.0" )
    then
        printf "unexpected\n"
        exit 1
    fi
}

# this function is required to be called
# with correct number of arguments (3 and only 3 strings)
function enoughArguments() {
    case $# in
        3) ;; ## 
        *) printf "incorrect number of args (requires 3 strings)\n"
           exit 1
           ;;
    esac
}

function test_enoughArguments() {
    if ( enoughArguments > /dev/null )
    then
        printf "unexpected\n"
        exit 1
    fi
    if ( enoughArguments "a" "b" > /dev/null )
    then
        printf "unexpected\n"
        exit 1
    fi
    if ( enoughArguments "a" "b" "c" "d" > /dev/null )
    then
        printf "unexpected\n"
        exit 1
    fi
    if ( ! enoughArguments "a" "-" "b" )
    then
        printf "unexpected\n"
        exit 1
    fi
}

function run() {
    test_stringIsEmpty
    test_stringEqual
    test_stringContains
    test_stringIsDigit
    test_enoughArguments
}

run
