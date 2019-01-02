#!/usr/bin/env bash

#~ https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
#~ You can use these ANSI escape codes:

#~ Black        0;30     Dark Gray     1;30
#~ Red          0;31     Light Red     1;31
#~ Green        0;32     Light Green   1;32
#~ Brown/Orange 0;33     Yellow        1;33
#~ Blue         0;34     Light Blue    1;34
#~ Purple       0;35     Light Purple  1;35
#~ Cyan         0;36     Light Cyan    1;36
#~ Light Gray   0;37     White         1;37

#~ And then use them like this in your script:
function printInColor() {
    declare -A colorByName=(
        [red]='\033[0;31m' 
        # no color
        [nc]='\033[0m' 
    )
    local C=${colorByName[${1:?"missing color name"}]}
    local NC='\033[0m' # No Color
    printf "Bad ${C}Blood${NC}: Sins and Lies\n"
}

function run() {
    printInColor 'red'
}

run
