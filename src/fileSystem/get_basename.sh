#!/usr/bin/env bash

# to get the basename minus the extension
get_basename() {
    echo $(basename /asd/bsd.asd.sh .sh)
}

get_basename
