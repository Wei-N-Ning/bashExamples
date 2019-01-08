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

main() {
    use_default_IFS
    use_custom_IFS
}

main
