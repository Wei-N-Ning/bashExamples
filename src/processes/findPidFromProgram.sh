#!/usr/bin/env bash

# source:
# https://stackoverflow.com/questions/17743879/how-to-get-child-process-from-parent-process

function listPidsByProgramName() {
    pidof "bash"
    pidof "/bin/bash"
    sleep 1 &
    pidof "sleep"
    wait
}

listPidsByProgramName
