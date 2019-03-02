#!/usr/bin/env bash

get_bash_version() {
    bash --version 2>&1 | perl -nE '/version\s*(\d+)/ && say $1; exit'
}

get_bash_version
