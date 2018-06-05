#!/usr/bin/env bash

setUp() {
    set -e 
}

querySelfStatus() {
    cat /proc/self/status
}

setUp
querySelfStatus


