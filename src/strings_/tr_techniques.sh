#!/usr/bin/env bash

# do a wordwise sort
wordwise_sort() {
    local ss=$( tr ' ' '\n' <<< "there is a cow ..." | sort -u )
    # not an array, see the second and third value
    echo ${ss} "${#ss[@]}" "${#ss}"

    # the result is treated as an array
    for word in $( tr ' ' '\n' <<< "there is a cow ..." | sort -u )
    do
        echo -n "(${word})"
    done
    echo

    # to create an array from the result, see the second value,
    # which is the number of the elements
    local arr=( $( tr ' ' '\n' <<< "there is a cow ..." | sort -u ) )
    echo "${#arr[@]}"
}

wordwise_sort


