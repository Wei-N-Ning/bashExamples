#!/bin/bash

function iterateOverNumbers {
    local sequence=""
    local sum=0
    for i in `seq 1 5`;
    do
        sequence="$sequence$i"
        let sum=sum+i
    done
    echo $sequence
    echo $sum
    
    sequence=""
    sum=0
    for i in $(seq 1 5); do
        sequence="$sequence$i"
        let sum=sum+i
    done
    echo $sequence
    echo $sum
}


function run {
    iterateOverNumbers
}


run
