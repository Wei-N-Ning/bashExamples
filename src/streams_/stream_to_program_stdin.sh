#!/usr/bin/env bash

# source:
# https://stackoverflow.com/questions/19854389/how-to-give-arguments-after-here-document
# 
# sometime it is useful to execute a python program that is 
# written in the form of a heredoc; however more often than
# not I also need to pass arguments to this inline program
# this example shows a solution to this

# it uses the single hythen special argument in bash,
# see:
# https://stackoverflow.com/questions/8045479/whats-the-magic-of-a-dash-in-command-line-parameters
# other programs also support this feature

# in comparison, the double hythen/dash argument is for a different
# purpose:
# https://unix.stackexchange.com/questions/11376/what-does-double-dash-mean-also-known-as-bare-double-dash
# example:
# grep -- -v /some/dir/file.ext

run_python_program() {
    # some arguments to be passed to the program
    local arg1="${1}"
    local arg2="${2}"

    python - "${arg1}" "${arg2}" <<"EOF"
import sys

def joiner(sep, *args):
    if not args:
        return ''
    return sep.join(args)

s = joiner(' ', *sys.argv[1:])
print(s)
EOF
}

run_python_program
run_python_program "\\there is" "a cow\\"
