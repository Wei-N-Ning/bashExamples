#!/usr/bin/env bash

# one can write useful conditional oneliners such as:

# sh
# note, the extra space inside [] is necessary
function createDirIfNotExist() {
    rm -rf /tmp/_demo/_dir
    [ -d /tmp/_demo/_dir ] || mkdir -p /tmp/_demo/_dir
}

function compoundConditions() {
    [ 1 ] && ( echo -n '1' && echo '2' )
    ( [ '' ] || [ ' ' ] ) && echo a
    val=$( [ '' ] || echo -n 0 ); echo "val=${val}"
}

createDirIfNotExist
compoundConditions
