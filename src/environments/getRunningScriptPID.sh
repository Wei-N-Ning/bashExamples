#!/bin/bash

# see pro bash P8
function getCurrentPID() {
    echo $$
}


function getCurrentPIDPython() {
    # echo is running in-process whereas python -c will start a new
    # (short lived) process
    echo $$
    ls /proc/$$/environ
}


# showing how can I acquire the PID of a newly spawned background
# process; 
# this can be helpful for book keeping the services 
function getBackgroundProcessPID() {
    _BECON_=1 python -c "import time;time.sleep(0.5)" &
    echo $!
    grep _BECON_ "$(cat /proc/$!/environ)"
    sleep 1
    echo $!
}


function run() {
    getCurrentPID
    getCurrentPIDPython
    getBackgroundProcessPID
}


run
