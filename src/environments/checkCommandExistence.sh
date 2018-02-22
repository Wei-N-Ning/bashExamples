#!/bin/bash

# see pro bash programming, P2
function run() {
    if ! type "unknown" ; then
        echo "name unknown is free to use"
    fi

    if type "echo" ; then
        echo "name echo is in use"
    fi
}


run
