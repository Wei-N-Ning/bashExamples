#!/usr/bin/env bash

function run() {
    sleep 1
    echo "died"
}

run &
printf "proc: "; ps | grep ${!}
wait
printf "proc: "; ps | grep ${!}