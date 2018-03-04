#!/usr/bin/env bash

function assertEqual() {
    if [ $1 != $2 ]
    then
        printf "failed: $1 != $2\n"
        exit 1
    fi
}

function test_simpleWhileLoop() {
    local n=1
    while [ $n -le 10 ]
    do
        # recall that $(( xxx )) is to evaluate a numeric expression
        n=$(( $n + 1 ))
    done
    assertEqual 11 $n
}

function readLinesFromFile() {
    local n=0
    if [ ! -f $1 ]
    then
        echo $n
        return 1
    fi
    while IFS= read -r line
    do
        n=$(( $n + 1 ))
    done < $1
    echo $n
}

function test_readLinesFromFile() {
    printf "1\n2\n" > /tmp/_
    assertEqual 2 $(readLinesFromFile "/tmp/_")
    assertEqual 0 $(readLinesFromFile "/tmp/iamnotthere_")
}

function run() {
    test_simpleWhileLoop
    test_readLinesFromFile
}

run
