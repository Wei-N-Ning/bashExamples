#!/usr/bin/env bash

# logic-and
if [ "1" = "1" ] && [ "2" = "2" ]; then
    echo
else
    exit 1
fi


# logic-or
if [ "1" = "!" ] || [ "2" = "2" ]; then
    echo
else
    exit 1
fi


echo "pass"
