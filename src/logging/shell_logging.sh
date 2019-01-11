#!/usr/bin/env bash 

error() {
    echo "$(date '+[%H:%M:%S]') ERROR:" $@
}

main() {
    error test failed
}

main
