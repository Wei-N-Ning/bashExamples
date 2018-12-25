#!/usr/bin/env bash

pipe_to_stdin_of_subshell() {
    for ch in $( ( tr ' ' '\n' | sort -u ) <<< "a b c" )
    do 
        echo ${ch}
    done
    

}

pipe_to_stdin_of_subshell

