#!/usr/bin/env bash

# source:
# https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash

# require bash 4

set_get_in_map() {
    declare -A files;
    
    # MUST NOT contain comma
    files=( 
        ["app"]="/some/dir/app" 
        ["model"]="/some/dir/model" 
    );
    # get all keys
    echo "keys: ${!files[@]}"
    # get all values
    echo "values: ${files[@]}"
    # iter keys and print each value
    for key in "${!files[@]}"
    do
        echo "key=${key}, value=${files[${key}]}"
        echo "${key}: ${files[${key}]}"
    done
}

set_get_in_map
