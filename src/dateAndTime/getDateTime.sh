#!/usr/bin/env bash

function formatDateAndTime() {
    printf "%s\n" $( date +%Y-%m-%d )
}
    
function run() {
    formatDateAndTime
}

run
