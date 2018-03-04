#!/usr/bin/env bash

function twoBranches() {
    if [ ! -z "$HOMED" ]; then
        printf "HOMED is set\n"
    elif [ ! -z "$HOME" ]; then
        printf "HOME is set\n"
    else
        printf "failed: HOMED or HOME is not set\n"
        exit 1
    fi
}

function prt() {
    printf "< $1 >\n"
}

function combine() {
    # this still returns 1
    test -d "/tmp1" && prt "/tmp1"
    if [ $? != 1 ]; then
        printf "fail: expect exit status 1\n"
        exit 1
    fi

    # this returns 0
    test -d "/bin" && prt "/bin"
    if [ $? != 0 ]; then
        printf "fail: expect exit status 0\n"
        exit 1
    fi

    # a better form: use with if statement
    if [ ! -d "/www" ] && prt "/www does not exist"
    then
        printf "expected\n"
    fi
}

function run() {
    twoBranches
    combine
}

run

