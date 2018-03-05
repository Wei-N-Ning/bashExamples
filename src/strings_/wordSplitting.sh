#!/usr/bin/env bash

function printArgs() {
    local pre="<"
    local post=">"
    printf "$pre%s$post\n" "$@"
}

# prints out:
# <spaced>
# <out>
function demoDefaultIFS() {
    local var='    spaced 
    out   '
    printArgs $var
}

# prints out:
# <there is>
# < a cow>
function demoCustomIFS() {
    local var='there is| a cow'
    local IFS='|'
    printArgs $var
}

function run() {
    demoCustomIFS

    # expect the IFS value to reset
    demoDefaultIFS
}

run

