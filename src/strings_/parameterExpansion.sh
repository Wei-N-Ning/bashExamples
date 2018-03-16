#!/usr/bin/env bash

function assertStrEqual() {
    if [ "$1" != "$2" ]
    then
        echo "$1 != $2"
        exit 1
    fi
}

function defaultValueIfEmptyOrUnset() {
    assertStrEqual "e1m1" ${mapName:-"e1m1"}
}

function defaultValueIfUnset() {
    local mapName=
    assertStrEqual "" ${mapName-"e1m1"}
}

# pro bash P47 (70)
# The first expansion will use alternate only if
# $var is set and is not empty
function alternativeValueIfSetAndNotEmpty() {
    local mapName="e3m1"
    assertStrEqual "e1m1" ${mapName:+"e1m1"}
}

function alternativeValueIfSet() {
    local mapName=
    assertStrEqual "e1m1" ${mapName+"e1m1"}
}

function requireVarIsSet() {
    # This will throw an error if executed:
    # line 34: mapName: Missing mapName variable
    # Process finished with exit code 1
    # ${mapName?"Missing mapName variable"}

    # This will pass (but mapName is empty - it may cause other troubles)
    local mapName=
    echo ${mapName?"Missing mapName variable"} > /dev/null

    # This will throw an error; It is stricter
    # local mapName=
    # ${mapName:?"Missing or empty mapName variable"}

    # This will pass
    local mapName="e1m2"
    echo ${mapName:?"Missing or empty mapName variable"} > /dev/null
}

function run() {
    defaultValueIfEmptyOrUnset
    defaultValueIfUnset
    alternativeValueIfSetAndNotEmpty
    alternativeValueIfSet
    requireVarIsSet
    indirectReference
}

run