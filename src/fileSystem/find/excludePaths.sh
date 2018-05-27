#!/usr/bin/env bash

# source:
# https://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories

# Pay attention to the use of -path and ! -name
# the first works for the absolute file paths;
# the second only works for base names
#
# Note also the use of -maxdepth 1 to limit the search depth

findAndExcludePaths() {
    find /tmp \( ! -path "*.tmp" ! -name ".*" \) -type f -maxdepth 1
}

findAndExcludePaths
