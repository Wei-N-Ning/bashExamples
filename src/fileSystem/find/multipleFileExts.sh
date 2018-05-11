#!/usr/bin/env bash

# source:
# https://superuser.com/questions/126290/find-files-filtered-by-multiple-extensions

# compare this result with:
#    local shLineCount=$( find ../ -type f -name "*.sh" | xargs wc -l | awk '/ total/ { print $1 }' )
#    local pyLineCount=$( find ../ -type f -name "*.py" | xargs wc -l | awk '/ total/ { print $1 }' )
find ../../ -type f \( -name "*.sh" -or -name "*.py" \) | xargs wc -l