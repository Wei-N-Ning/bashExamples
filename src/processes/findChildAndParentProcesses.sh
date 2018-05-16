#!/usr/bin/env bash

# sources:
# find children:
# https://stackoverflow.com/questions/17743879/how-to-get-child-process-from-parent-process
# find parent:
# https://superuser.com/questions/150117/how-to-get-parent-pid-of-a-given-process-in-gnu-linux-from-command-line

# $1: PID of the parent process
function listChildProcesses() {
    pgrep -P ${1}
}

# $1: PID of the child process
function printParentPid() {
    ps -o ppid= -p ${1}
}

function runTests() {
    for _pid in $( pidof "bash" )
    do
        echo "child processes of bash: ${_pid}"
        listChildProcesses ${_pid}
        echo "parent process of bash: ${_pid}"
        printParentPid ${_pid}
    done
}

runTests