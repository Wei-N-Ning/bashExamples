#!/usr/bin/env bash

# motivation
# the idea originated from perlFoo's IPC/filelocks/concurrent_counter
#
# flock in perl provides a great tool to implement high-level concurrency 
# control pattern 
# (re: Java's concurreny pattern category in jConcurrent/src/test/java)
# 
# I was looking for a similar mechanism in sh/bash and found that only 
# linux system provided flock commandline utility
#
# there are open source, standalone tools that are ported to Mac:
# https://github.com/Wei-N-Ning/py-filelock
# https://github.com/Wei-N-Ning/flock

# but these seem too heavy weight a solution to me

# I therefore experiemented with signals and FIFO - the latter felt 
# easier to use 

set -euo pipefail

child_task() {
    # mine the resources created by the parent (job control)
    local treasure=/var/tmp/treasure
    perl -wnl -a -e \
    '
    BEGIN {my %users};
    ++$users{$F[0]} if $F[1] =~ /^tty/;
    END {$,=", "; print keys %users};

    ' <${treasure}
}

child() {
    # this should be as quick as possible
    local pipelock="/var/tmp/pipelock.$$.lock"
    rm -f ${pipelock}
    mkfifo ${pipelock}
    echo "child $$: wait"
    cat ${pipelock} >/dev/null
    child_task
    echo "child $$: + done"
}

parent_task() {
    # create resource for children to mine
    local treasure=/var/tmp/treasure
    rm -f ${treasure}
    who -a >${treasure}
}

main() {
    rm -f /var/tmp/pipelock*
    
    # the number of children/workers must be known to the job control
    child &

    # man find
    # -type t
    # True if the file is of the specified type.  
    # Possible file types are as follows:
    # b       block special
    # c       character special
    # d       directory
    # f       regular file
    # l       symbolic link
    # p       FIFO
    # s       socket
    while [[ $(find /var/tmp -name "pipelock*" -type p | perl -nE 'END{say $.}') != 1 ]]
    do
        sleep 0.1     
        # this explicit waiting zone is to prevent the second find()
        # to fire off before the FIFO(s) are created
    done
    parent_task
    for pipelock in $( find /var/tmp -name "pipelock*" -type p )
    do
        echo "CONT" >${pipelock}
    done
    wait
}

main
