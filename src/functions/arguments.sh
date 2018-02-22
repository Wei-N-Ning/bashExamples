#!/bin/bash

# see pro bash P8
function takingFourteenArguments() {
    # expecting the value of the $1 argument followed by a zero
    echo $10
    
    # expecting the actual value of the 10th argument
    echo ${10}
}


# see pro bash P8
function takingThreeArguments() {
    # expand to the value of all the positional arguments combined
    echo $*
    echo $@
}


function run() {
    takingFourteenArguments 1x 2x 3x 4x 5x 6x 7x 8x 9x 10x 11x 12x 13x 14x 
    takingThreeArguments 1a
    takingThreeArguments 1b 2b
    takingThreeArguments 1c 2c 3c
}


run
