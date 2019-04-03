#!/usr/bin/env bash

# a complete program showing:
# how to evaluate environment variable that is passed as argument 
# how to split and join lines in perl
# how implement a simple multi-commands system

setUp() {
    set -e
}

# command: get
# note the syntax \$$varname 
# this to expand $varname, the argument to the name of the environment 
# variable, then print the content held by this variable
get_envPaths() {
    local varname=${1:?"missing env var"}
    eval "echo \$${varname}" | perl -F: -lane 'print for @F' | sort
    exit 0
}

set_envPaths() {
    local varname=${1:?"missing env var"}
    local path=${2:?"missing file path"}
    local shellType=$( basename ${SHELL} )
    local value=$( perl -lne 'push(@paths, $_) if /\w+/; END { print join(":", @paths) }' < ${path} )
    case ${shellType} in
        "tcsh")
            echo "setenv ${varname} ${value}"
            exit 0
            ;;
        "bash")
            echo "export ${varname}=${value}"
            exit 0
            ;;
    esac
    echo "unsupported shell type: ${shellType}"
    exit 1
}

main() {
    local app=${1:?"missing app name"}
    case ${app} in
        "get")
            shift
            get_envPaths ${@}
            ;;
        "set")
            shift
            set_envPaths ${@}
            ;;
    esac
    echo "unsupported app: ${app}"
    exit 1
}

setUp
main ${@}

