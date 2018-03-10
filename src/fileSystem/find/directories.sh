#!/usr/bin/env bash

function findDirectories() {
    find /work/dev/c -type d -name "build"
}

function run() {
    findDirectories
}

run
