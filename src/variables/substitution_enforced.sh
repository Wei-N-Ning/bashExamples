#!/usr/bin/env bash

# source:
# help set
# search for -u
# Treat unset variables as an error when substituting.

# it is common to see 
# set -eu
# in canva's code base

foobar() {
    local f=${THEREISACOW}
}

# this will return 127
( foorbar ) 
echo $?


