#!/usr/bin/env bash

# source:
# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_10_02.html
# https://stackoverflow.com/questions/7099887/is-there-a-set-data-structure-in-bash
# https://www.linuxjournal.com/content/bash-associative-arrays

setUp() {
    set -e
    rm -rf /tmp/sut /tmp/_ /tmp/_.* /tmp/__*
    mkdir /tmp/sut
}

createPlainArray() {
    arr=(s 2 i 4 n 2)
    echo ${arr[*]}
    unset arr

    for n in $( seq 0 9 )
    do
        arr[n]="kknd"
    done
    echo ${arr[*]}
    unset arr
}

createAssociatedArray() {
    declare -A arr
    local n=
    for p in $( find .. -name "a*.sh" -type f )
    do
        n=$( basename ${p} )
        arr[${n}]=${n}

        # deliberately attempt to duplicate the
        # elements to test whether this array
        # acts like a set
        arr[${n}]=${n}
    done
    echo ${arr[*]}
}

setUp
createPlainArray
createAssociatedArray
