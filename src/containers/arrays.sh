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

# this example use bash-specific syntax (requiring modern bash version)
# source:
# https://unix.stackexchange.com/questions/132102/communication-between-multiple-processes

bashArray() {

    # prefer local array variable
    local array=()
    for fn in $( ls /tmp )
    do
        # /// IMPORTANT ///
        # () is required to keep each element separate;
        # otherwise they are merged into one big string
        array+=( ${fn} )
    done

    # /// note the for-loop syntax ///
    for fn in "${array[@]}"
    do
        echo "bash array demo: ${fn}"
    done
}

# array is a local variable
echo "^^^^^ ${array[@]}"

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

checkArraySize() {
    arr=(1 2 3 4)
    local sz=${#arr[*]}
    echo ${#arr[*]}
}

appendToArray() {
    arr=(1 2 3 4)
    local sz=${#arr[*]}
    echo -n ${#arr[*]}","

    # append
    arr[sz]=100
    echo ${#arr[*]}
    echo "${arr[*]}"

    # remove the newly appended element
    unset arr[sz]
    echo ${#arr[*]}
    echo "${arr[*]}"
}

setUp
bashArray
createPlainArray
createAssociatedArray
checkArraySize
appendToArray
