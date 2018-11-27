#!/usr/bin/env bash

# source
# https://unix.stackexchange.com/questions/209249/piping-commands-after-a-piped-xargs

# man page:

#        -n max-args, --max-args=max-args
#              Use at most max-args arguments per command line.  Fewer than  max-args  argu‐
#              ments will be used if the size (see the -s option) is exceeded, unless the -x
#              option is given, in which case xargs will exit.

main() {
    # maximum 1 argument per command line
    # the output looks like:
    # 1
    # 2
    # 3
    # ...
    # 6
    seq 1 6 | xargs -n 1 sh -c 'echo $0' | wc -l

    # maximum 2 args ...
    # fewer command lines
    seq 1 6 | xargs -n 2 sh -c 'echo $0' | wc -l

    # maximum 4 args
    seq 1 6 | xargs -n 4 sh -c 'echo $0 $1 $2 $3'
}

main