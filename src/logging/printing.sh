#!/bin/bash


function callPrintf() {
    printf "int: %d, float: %f, string: %s \n" 1 3.14 "bas" 
    printf "exit status: %d\n" $?
}


function run() {
    callPrintf
}


run
