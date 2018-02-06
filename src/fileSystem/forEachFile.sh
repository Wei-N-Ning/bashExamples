#!/bin/bash

shopt -s globstar

loopThroughFilesInDirectoryRecursive() {
    for f in "/work/dev/python/github.com/powergun/codingMatrix"/**/*.py
    do
        # example: execute each Python file 
        # /usr/bin/env python $f
        echo $f
    done
}

loopThroughFilesInDirectoryRecursive
