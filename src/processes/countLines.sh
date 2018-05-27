#!/usr/bin/env bash

# source:
# http://wiki.bash-hackers.org/scripting/processtree

# see the article above for the reason to avoid 
# subshell (subprocess) in this case

counter=0
while read
do
    ((counter++))
done <${0}

echo "num lines: ${counter}"
