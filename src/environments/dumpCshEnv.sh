#!/usr/bin/env bash

# $1: (optional) an existing env dump; if not provide it will dump the current shell environment
function run() {
    local envFile=${1}
    if [ "${envFile}" == "" ]
    then
        env > /tmp/_
        envFile=/tmp/_
    fi
    awk '
BEGIN {
    FS="="
}
{
    print "setenv " $1 " \"" $2 "\""
}
' ${envFile}
}

run $1
