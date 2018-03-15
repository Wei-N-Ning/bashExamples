#!/usr/bin/env bash

# $1: a string in the form of key=value 
function dothis() {
    for _env in $( ls /proc/*/environ )
    do
        if [ -r $_env ]
        then
            if ( grep "$1" $_env >/dev/null )
            then
                echo $_env | awk 'BEGIN {FS = "/"} {print $3}'
            fi
        fi
    done
}

function run() {
    dothis $1
}

function test() {
    _HOURGLASS_=1 /usr/bin/env python -c "import time;time.sleep(1)" &
    if [ -z $( dothis "_HOURGLASS_=1" ) ] 
    then
        echo "failed to find beacon"
        exit 1
    fi
    if [ ! -z $( dothis "_NOTEXISTING_=1" ) ]
    then
        echo "unexpected beacon"
        exit 1
    fi
}

if [ "$1" == "" ]
then
    echo "need one argument"
    exit 1
fi
if [ "$1" == "test" ]
then
    test
else
    run "$1"
fi
