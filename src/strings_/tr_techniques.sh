#!/usr/bin/env bash

# do a wordwise sort but the result does not contain the newline syms
wordwise_sort() {
    local ss=$( tr ' ' '\n' <<< "there is a cow ..." | sort -u )
    echo ${ss}
}

wordwise_sort


