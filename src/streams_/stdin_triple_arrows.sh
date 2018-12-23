#!/usr/bin/env bash

# source:
# https://unix.stackexchange.com/questions/80362/what-does-mean

# gist:
# it seems < is for passing file (or directory), 
# << @ for passing multiple lines (similar to the banner command 
# in cisco switches; as terminated by a custom string @ in this 
# case), 
# and <<< to pass a string (instead of file). 
# test them yourself with cat and you'll grasp it very quickly

single_arrow() {
    echo "there is a cow" >/tmp/text
    cat </tmp/text
}

double_arrows() {
    cat <<EOF
Previous Chapter: there is a cow
and more...
EOF
}

triple_arrows() {
    cat <<< "str: there is a cow 
str: another cow"
    
    # new line is not interpolated
    cat <<< "a\nb\nc"
}

single_arrow
double_arrows
triple_arrows


