#!/usr/bin/env bash
gen_list() {
    local ids=(
477020
463925
93417
93373 )
    for each_id in "${ids[@]}"
    do
        echo "https://hackerone.com/reports/${each_id}" 
    done
}

gen_list >/tmp/ticket_list.txt
