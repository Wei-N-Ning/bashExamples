#!/usr/bin/env bash

# it feels cleaner and more readable 
# also if each argument contains space character, this approach
# avoid delimiter issue
# example taken from CA codebase
use_args_as_array() {
    local extra_args=( --name "iddqd" )
    if [[ ! -z "${HOME}" ]]; then
        extra_args+=( --region "${HOME}" )
    fi

    # 4 elements in the array
    echo "${#extra_args[@]}"
}

use_args_as_array
