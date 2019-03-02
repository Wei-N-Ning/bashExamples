#!/usr/bin/env bash

# source:
# https://www.tldp.org/LDP/abs/html/parameter-substitution.html

# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html

# equivalent to python: {'a': 1}.get('b', 0)
#${parameter:-defaultValue}	Get default shell variables value

# equivalent to python: 
# a = {'a': 1}; b = a.get('b', 0); a['b'] = b
#${parameter:=defaultValue}	Set default shell variables value

# assert 'b' in a, "error message"
#${parameter:?"Error Message"}	Display an error message if parameter is not set

# len('asd')
#${#var}	Find the length of the string

# ${PARAM+x} if PARAM is declared, the result is x
# commonly used in this conditional:
# [[ -z "${PARAM+x}" ]] 
# to determine if PARAM is undeclared (returns true)

#${var%pattern}	Remove from shortest rear (end) pattern

#${var%%pattern}	Remove from longest rear (end) pattern

#${var:num1:num2}	Substring

#${var#pattern}	Remove from shortest front pattern

#${var##pattern}	Remove from longest front pattern

#${var/pattern/string}	Find and replace (only replace first occurrence)

#${var//pattern/string}	Find and replace all occurrences

check_param_declared() {
    echo -n "${BLABLA+x}"
    echo "${HOME+x}"
}

# this can be helpful to retrieve only segments of the path
get_repl_dirpath() {
    local thisdir="$( git rev-parse --show-toplevel )"

    # remove /Users/wein from the path
    echo "repl: ${thisdir#${HOME}}"
}

function assertStrEqual() {
    if [ "$1" != "$2" ]
    then
        echo "$1 != $2"
        exit 1
    fi
}

function assertEqual() {
    if [ $1 != $2 ]
    then
        echo "$1 != $2"
        exit 1
    fi
}

# pro bash P48 (71)
function join() {
    local result=
    for n in {a..f}
    do
        result="${result:+"${result},"}${n}"
    done
    assertStrEqual "a,b,c,d,e,f" ${result}
}

# pro bash P53 (76)
# optimized using "shift arguments technique"
# (see also: functions/arguments.sh)
function joins() {
    local sep=$1
    local result=
    shift 1
    for n in $@
    do
        result=${result:+${result}${sep}}${n}
    done
    printf ${result}
}

function len() {
    assertEqual 0 ${#mapName}
    local mapName=
    assertEqual 0 ${#mapName}
    mapName="e1m1"
    assertEqual 4 ${#mapName}
    mapName="doom /e1/ m1  "
    assertEqual 14 ${#mapName}
}

# pro bash P50 (73)
# remove the shortest match from the end
# can be used to replace external command dirname
function stripSuffix() {
    local texName="/doom/e1/m1/textures/platform.dds"

    # dirname (see stripPrefix for an implementation of basename function)
    assertStrEqual "/doom/e1/m1/textures" ${texName%/*}

    assertStrEqual "/doom/e1/m1/textures/platform" ${texName%.dds}
    assertStrEqual "/doom/e1/m1/" ${texName%tex*}

    # NOTE: shortest match
    assertStrEqual "/doom/e1/m1/textures/platfor" ${texName%m*}

    # NOTE: longest match
    assertStrEqual "/doo" ${texName%%m*}
}

function stripPrefix() {
    local modelName="/doom2/e15/resources/models/imp.mdl"

    # basename
    assertStrEqual "imp.mdl" ${modelName##*/}

    # NOTE: shortest match
    assertStrEqual "2/e15/resources/models/imp.mdl" ${modelName#*m}

    # NOTE: longest match
    assertStrEqual "dl" ${modelName##*m}
}

function replace() {
    local sprite="/doom/e2m3/sprites/imp.dds"

    # NOTE: replace any matching character
    assertStrEqual "-doom-e2m3-sprites-imp.dds" ${sprite//\//-}
    assertStrEqual "/????/????/???????/???.???" ${sprite//[0-9a-zA-Z]/?}

    # NOTE: replace the first matching character only
    assertStrEqual "/?oom/e2m3/sprites/imp.dds" ${sprite/[0-9a-zA-Z]/?}
}

function sub() {
    local wavName="/doom/e1/m1/sounds/gunner.dds"

    assertStrEqual "doom" ${wavName:1:4}
    assertStrEqual "gunner.dds" ${wavName:19}

    # NOTE: count from the end of the string
    # the space is needed
    assertStrEqual "r.dds" ${wavName: -5}
}

function toUpper() {
    local mapName="e1m1"
    local phrase="there is a cow "

    # NOTE: first to upper (capitalise)
    assertStrEqual "E1m1" ${mapName^}

    # NOTE: all to upper
    assertStrEqual "E1M1" ${mapName^^}

    # NOTE: all matching characters to upper
    assertStrEqual "There Is A Cow " "${phrase^^[tiac]}"
}

function toLower() {
    # NOTE: see toUpper() for matcher rules
    local mapName="E1M1"
    assertStrEqual "e1m1" ${mapName,,}
}

function sortAndUnique() {
    echo "
doom
doom2
doom

doom3
" | sort -u
}

function run() {
    check_param_declared
    get_repl_dirpath

    join
    local s=$( joins "-" {a..f} )
    assertStrEqual "a-b-c-d-e-f" ${s}
    len
    stripSuffix
    stripPrefix
    replace
    sub
    toUpper
    toLower
    sortAndUnique
}

run
