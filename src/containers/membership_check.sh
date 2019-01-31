#!/usr/bin/env bash

# motivation:
# I want to test if a string $A is a member of set $S
# $1: string $A
membership_test() {
    declare -A members=(
        [A]=1
        [B]=1
        [C]=1
    )
    [[ ${members[${1:-}]} == 1 ]]
}

# create hash table with qw statement
# see:
# http://www.java2s.com/Code/Perl/Hash/Createhashwithqw.htm
membership_test_pl() {
    perl -wE \
    'my %members = qw(A A B B C C); $members{$ARGV[0]} or exit 1;' \
    ${1:?"missing input"}
}

main() {
    for str in A a B b 
    do
        printf "${str}: "
        if ( membership_test_pl ${str} )
        then
            echo "true"
        else
            echo "false"
        fi
    done
}

main
