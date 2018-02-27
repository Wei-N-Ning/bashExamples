#!/bin/bash

# from pro bash
# recommending: date=$( date ) to date=`date`

# see: http://www.compciv.org/topics/bash/variables-and-substitution/
# Command substitution allows the output of a command to replace 
# the command itself. Bash performs the expansion by executing command 
# and replacing the command substitution with the standard output of 
# the command, with any trailing newlines deleted. Embedded newlines 
# are not deleted, but they may be removed during word splitting.

# newline character is no longer used as the splitter
function commandExpansionUsingCustomIFS() {
    local IFS=$'a'
    assertStringEqual $'1\n2\n3\n4\n5\n6\n7\n8\n9\n10' $(seq 1 10)
}

# newliner character (and space, tab characters) is the splitter, 
# therefore $(seq 1 10) expands to 1
function commandExpansionUsingDefaultIFS() {
    assertStringEqual "1" $(seq 1 10)
}

function assertStringEqual() {
    if [ ! "$1" = "$2" ]; then
        printf "failed!\n"
        exit 1
    fi
}

function run() {
    commandExpansionUsingCustomIFS
    commandExpansionUsingDefaultIFS
}

run
