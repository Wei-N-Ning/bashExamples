#!/usr/bin/env bash

setUp() {
    set -e 
}

# $1: pid
queryStatus() {
    cat /proc/${1:?"missing pid"}/status | grep -i tracer
}

setUp
queryStatus $$

