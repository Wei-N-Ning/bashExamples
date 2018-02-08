#!/bin/bash

# test if a process exists (exact-match)
if (pgrep -x "notexist") then
    exit 1
fi


# test the return code from a command
if ! (touch /tmp/dd) then
    exit 1
fi


if ! (python -c "exit(0)") then
    exit 1
fi


if (python -c "exit(1)") then
    exit 1
fi


echo "pass"
