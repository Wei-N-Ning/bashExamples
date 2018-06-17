#!/usr/bin/env bash

# source:
# test if a var is greater than 0
# https://stackoverflow.com/questions/13086109/bash-scripting-check-if-bash-variable-equals-0

# do not enable "set -e",
# this will cause a failing test [[ ]] to
# terminate the program
declare -a arr
idx=

tearDown() {
    unset arr
}

push() {
    local sz=${#arr[*]}
    arr[sz]=${1}
}

pop() {
    local sz=${#arr[*]}
    local elem=
    if (( sz > 0 ))
    then
        let idx=${sz}-1
        echo ${arr[idx]}
        unset arr[idx]
    fi
}

top() {
    local sz=${#arr[*]}
    if (( sz > 0 ))
    then
        let idx=${sz}-1
        echo ${arr[idx]}
    fi
}

bottom() {
    echo ${arr[0]}
}

print_stack() {
    echo "stack: ${arr[*]}"
}

runTests() {
    print_stack
    push 1
    push 2
    print_stack
    push 3
    print_stack
    pop >/dev/null
    print_stack
    pop >/dev/null
    print_stack
    pop >/dev/null
    pop >/dev/null
    pop >/dev/null
    print_stack

    return 0
}

runTests
tearDown
