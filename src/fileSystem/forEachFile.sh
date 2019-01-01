#!/bin/bash

shopt -s globstar

thisdir=$( dirname ${BASH_SOURCE[0]} )

loopThroughFilesInDirectoryRecursive() {
    for f in "${thisdir}/../../"/**/*.sh
    do
        # example: execute each Python file 
        # /usr/bin/env python $f
        echo ${f}
    done
}

loopThroughFilesInDirectoryRecursive
