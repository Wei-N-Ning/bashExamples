#!/usr/bin/env bash

# source:
# http://info2html.sourceforge.net/cgi-bin/info2html-demo/info2html?%28bash.info.gz%29Programmable%2520Completion

# first the command name is identified.
# if a comspec has been defined for
# that command, the comspec is used
# to generate the list of possible
# completions for the word.

# example of the above document
_completion_loader() {
    printf "hahaha"
}

_demo() {
    echo dd
}

complete -D -F _completion_loader sut.sh
