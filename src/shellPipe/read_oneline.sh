#!/usr/bin/env bash


# see:
# https://renenyffenegger.ch/notes/Linux/shell/bash/built-in/read

use_default_IFS() {
    local ty name
    read -r ty name <<<"there is a cow"
    echo "ty: ${ty}"
    echo "name: ${name}"
}

use_custom_IFS() {
    local ty name
    read -r ty name <<<"there,is"
    # there,is
    echo "ty: ${ty}"
    echo "name: ${name}"
    local IFS=","
    read -r ty name <<<"there,is"
    # there
    echo "ty: ${ty}"
    # is
    echo "name: ${name}"
}

# #  Waiting for the user to press any key
#    -n 1: one character is enough
#    -s  : suppress echoing the key that was pressed
#    -p  : What should be prompted
press_any_key_to_continue() {
    read -n 1 -s -p "any key"
}

main() {
    use_default_IFS
    use_custom_IFS
    press_any_key_to_continue
}

main
