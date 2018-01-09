#!/bin/bash

# test if a process exists (exact-match)
if pgrep -x "notexist"
then
    exit 1
fi


echo "pass"
