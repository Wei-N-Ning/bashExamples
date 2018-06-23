#!/usr/bin/env bash

build() {
    :
}

run() {
    :
}

dasm() {
    :
}

debug() {
    :
}

# $1: command
main() {
    local COMMAND=${1:?"missing command"}
    case ${COMMAND} in
        "build")
            echo "build"
            build
            ;;
        "dasm")
            echo "build, disassemble"
            build && dasm
            ;;
        "debug")
            echo "build, run sut, run debugger"
            build && run && debug
            ;;
    esac
}

main build
main dasm
main debug
