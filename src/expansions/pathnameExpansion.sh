#!/usr/bin/env bash

function globFiles() {
    for fn in /tmp/*
    do
        printf "%s," $fn
    done
}

function run() {
    globFiles
}

run

