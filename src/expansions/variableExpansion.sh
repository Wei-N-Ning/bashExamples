#!/bin/bash


# see: https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
function useCurlyBracketsToProtectVariable() {
    local idd="..."
    local iddqd="invincible"
    assertStringEqual "${idd}qd" "...qd"
    assertStringEqual "$iddqd" "invincible"
   
    # pro bash P33 (56)
    # idd_ is a legit variable name therefore bash tries to expand it 
    #  rather than expanding idd
    assertStringEqual "$idd_" ""
    assertStringEqual "${idd}_" "..._"
}

function stringLength() {
    local str="iddqd"
    assertStringEqual "${#str}" "5"
}

function findAndReplace() {
    local idkfa="key.firearms.ammos"
    assertStringEqual "${idkfa/firearms/swords}" "key.swords.ammos"
    
    # to replace all matches of pattern
    assertStringEqual "${idkfa//./|}" "key|firearms|ammos"
    
    # exploit this technique to rename or remove files on the fly
    filePath="/tmp/store.json"
    touch "$filePath"
    if ! (cp "${filePath}" "${filePath/.json/.bson}"); then
        printf "failed!"
        exit 1
    fi
}

function assertStringEqual() {
    if [ ! "$1" = "$2" ]; then
        printf "failed!\n"
        exit 1
    fi
}

function run() {
    useCurlyBracketsToProtectVariable
}

run
