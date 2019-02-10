#!/usr/bin/env bash

# source
# https://www.tldp.org/LDP/abs/html/x9644.html

list_jobs() {
    jobs
}

resume_job_in_background() {
    # find n from jobs' output
    bg n 
}

kill_() {
    kill -KILL n/pid
    kill -TERM n/pid

    # be nice.... some application has its own sig handler
}

job_control() {
    # assuming python2.7
    python -m SimpleHTTPServer &

    # job - 1
    local job_id=$( jobs | perl -wnl -e '/^\[(\d+)\].*SimpleHTTP/ and print $1' )

    # list all the signals:
    # kill -l

    # suspend the job
    # https://www.ostechnix.com/suspend-process-resume-later-linux/
    kill -STOP "%${job_id}"
    
    # resume the job
    # bg %1
    # https://unix.stackexchange.com/questions/109536/if-you-z-from-a-process-it-gets-stopped-how-do-you-switch-back-in
    kill -CONT "%${job_id}"

    # kill the job
    kill -KILL "%${job_id}"

    # if the process terminated already, this returns 127
    wait "%${job_id}"
}


