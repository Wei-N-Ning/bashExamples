#!/usr/bin/env bash

# source
# https://askubuntu.com/questions/275965/how-to-list-all-variables-names-and-their-current-values
# This will show you not only the shell variables, but the environment variables too.

# motivation:
# debugging 

( set -o posix ; set ) | less

