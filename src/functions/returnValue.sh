#!/bin/bash
# http://www.linuxjournal.com/content/return-values-bash-functions


# $1: if not empty, "returns" a string; otherwise return 1
# usage:
# ret=$(returnByVarExpansion)
function returnByVarExpansion {
    if [ -z "$1" ]; then
        return 1
    else
        echo "doom 1992"
    fi
}


# $1: if not empty, "returns" a string via its output parameter
# $2: an output parameter; its original value will be erased
# The eval statement basically tells bash to interpret the line twice, 
# the first interpretation above results in the string 
# 
# result='some value' 
# 
# which is then interpreted once more and ends up setting the caller's 
# variable.
# usage:
# ret=""
# returnByOutputParam "arg" ret
function returnByOutputParam {
    if [ -z "$1" ]; then
        return 1
    fi
    if [ -z $2 ]; then
        return 1
    fi
    eval $2="'doom 1992'"
}


# $1: if not empty, append a token to the global string variable 
# "products"
# note: how to inspect the exit status of the previous command:
# https://stackoverflow.com/questions/26675681/bash-how-to-check-the-exit-status-using-an-if-statement
# return: 0 if $1 is not empty, 1 otherwise
products=""
function setGlobalState {
    if [ -z "$1" ]; then
        return 1
    fi
    products="$products doom"
    return 0
}


function demoReturnByVarExpansion {
    if [ ! "$(returnByVarExpansion)" = "" ]; then
        echo "failed"
        exit 1
    fi
    
    if [ ! "$(returnByVarExpansion a)" = "doom 1992" ]; then
        echo "failed"
        exit 1
    fi
}


function demoReturnByOutputParam {
    local ret=""
    
    returnByOutputParam "a"
    returnByOutputParam ret
    returnByOutputParam "a" "__ret"
    if [ ! "$ret" = "" ]; then
        echo "failed"
        exit 1
    fi
    
    returnByOutputParam "a" ret 
    if [ ! "$ret" = "doom 1992" ]; then
        echo "failed"
        exit 1
    fi
}


function demoSetGlobalState {
    # expected to fail
    if ! setGlobalState; then
        return 0
    fi
    
    if ! setGlobalState "arg"; then
        echo "failed"
        exit 1
    fi
}


function run {
    demoReturnByVarExpansion
    demoReturnByOutputParam
    demoSetGlobalState
}


run
