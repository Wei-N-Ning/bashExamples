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
    local mapName=
    assertStrEqual "e1m1" ${mapName:-"e1m1"}
}

function defaultValueIfUnset() {
    assertStrEqual "e1m1" ${mapName-"e1m1"}
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

# source:
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
function setDefaultValues() {
    # assign "e1m1" to levelName since it does not have a value;
    # also assign "e1m1" to actual
    local actual=${levelName:="e1m1"}
    assertStrEqual "e1m1" ${actual}
    assertStrEqual "e1m1" ${levelName}

    # now that levelName has a value "e1m1", this statement does
    # not change levelName; it assigns "e1m1" to other
    local other=${levelName:="e3m3"}
    assertStrEqual "e1m1" ${other}
    assertStrEqual "e1m1" ${levelName}
}

function getVariableLength() {
    local level="e1m3"
    assertStrEqual "4" "${#level}"

    # return 0 if variable does not exist
    assertStrEqual "0" "${#levellll}"
}

function run() {
    defaultValueIfEmptyOrUnset
    defaultValueIfUnset
    alternativeValueIfSetAndNotEmpty
    alternativeValueIfSet
    requireVarIsSet

    setDefaultValues
    getVariableLength
}

run