#!/usr/bin/env bash

match_one_char() {
    ls /bin/ca?
    ls /usr/bin/ca?
}

match_char_classes() {
    ls /bin/c[a-z]*
}

exclude_char_classes() {
    # this shows an interesting executable named [
    # see:
    # https://unix.stackexchange.com/questions/257014/what-is-the-purpose-of-square-bracket-executable
    # its function is similar to test command
    ls /bin/[!d-z]*
}

predefined_named_char_classes() {
    # vim does not recognise this syntax
    ls /bin/c[[:alpha:]]*
    # [[:alnum:]]
    # [[:digit]]
    # [[:lower:]]
    # [[:space]]
    # [[:upper:]]
}

flatten() {
    perl -lne 'BEGIN {my @lines}; push @lines, $_; END {print "@lines"}'
}

main() {
    match_one_char | flatten
    match_char_classes | flatten
    exclude_char_classes | flatten
    predefined_named_char_classes | flatten
}

main
