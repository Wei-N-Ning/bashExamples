#!/bin/bash
# see: 
# https://stackoverflow.com/questions/6697753/difference-between-single-and-double-quotes-in-bash
# 
# Single quotes won't interpolate anything, but double quotes will (for example variables, backticks, certain \ escapes, etc...).
#
# Example
#
# root@UPG-UBUNTU:~# echo "$(echo "upg")"
# upg
# root@UPG-UBUNTU:~# echo '$(echo "upg")'
# $(echo "upg")

function assertEqual() {
    if [ ! "$1" = "$2" ]; then
        echo "error: expected '$1'; got '$2'"
        exit 1
    fi
}

function singleQuoteSubstitution() {
    local s=`echo '$(echo "upg")'`
    echo $s
    assertEqual "\$(echo \"upg\")" "$s"
}

function doubleQuoteSubstitution() {
    local s=`echo "$(echo "upg")"`
    echo $s
    assertEqual "upg" "$s"
}

function run() {
    singleQuoteSubstitution
    doubleQuoteSubstitution
}

run
