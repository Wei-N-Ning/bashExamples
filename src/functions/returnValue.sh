#!/bin/bash
# http://www.linuxjournal.com/content/return-values-bash-functions


# $1: if not empty, "returns" a string; otherwise return 1
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
function returnByOutputParam {
    if [ -z "$1" ]; then
        return 1
    fi
    if [ -z $2 ]; then
        return 1
    fi
    eval $2="'doom 1992'"
}



function run {
    if [ ! "$(returnByVarExpansion)" = "" ]; then
        echo "failed"
        exit 1
    fi
    
    if [ ! "$(returnByVarExpansion a)" = "doom 1992" ]; then
        echo "failed"
        exit 1
    fi
    
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


run
