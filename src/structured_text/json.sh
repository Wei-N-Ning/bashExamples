#!/usr/bin/env bash

pseudo_credential() {
    cat <<"EOF"

{
  "asciifile" : "../tmp/data_20120720_105746-01580.txt",
   "excelfile" : "../tmp/data_01580-20120720_105746.xlsx",
   "from" : "Jun 19, 2012",
   "msg" : "some info message, for the admin",
   "outfile" : "data--recent.txt",
   "outfile_excel" : "data--recent.txt.xlsx",
   "resolution" : "std",
   "to" : "Jul 20, 2012",
   "url_comment" : "another info message, for the screen/user",
   "url_outfile" : "http://www.example.com/path/tmp_cached_files/data--recent.txt",
   "url_outfile_excel" : "http://www.example.com/path/tmp_cached_files/data--recent.txt.xlsx"

}
EOF
}

ASSERT_SUCCESS='[[ ! $? == 0 ]] && echo ASSERT_ERROR: ${BASH_SOURCE[0]}:${LINENO}'

# source:
# https://docs.python.org/3/library/json.html

# given encoded json string via stdin
# $1: key
# $2: optional default value
get_value() {
    local k=${1:?"missing key"}
    local d=${2:-}
    python -Bsc "import json,sys;s=sys.stdin.read();print(json.loads(s).get('${k}', '${d}'))" 2>/dev/null
    eval ${ASSERT_SUCCESS}
}

# using python3
get_value3() {
    local k=${1:?"missing key"}
    local d=${2:-}
    python3 -Bsc "import json,sys;s=sys.stdin.read();print(json.loads(s).get('${k}', '${d}'))" 2>/dev/null
    eval ${ASSERT_SUCCESS}
}

main() {
    echo -n 'found: '
    pseudo_credential | get_value "outfile_excel"
    echo -n 'null: '
    pseudo_credential | get_value "thereisacow"
    echo -n 'default: '
    pseudo_credential | get_value "thereisacow" "xxdn"

    ( echo "asd,,," | get_value "asd" )
}

main_python3() {
    echo -n 'found: '
    pseudo_credential | get_value3 "outfile_excel"
    echo -n 'null: '
    pseudo_credential | get_value3 "thereisacow"
    echo -n 'default: '
    pseudo_credential | get_value3 "thereisacow" "xxdn"

    ( echo "asd,,," | get_value3 "asd" )
}

# practical example: aws sts
# one can also use aws sts ... --query Account 
parse_aws_sts() {
    aws sts get-caller-identity | python -Bsc 'import sys,json;print(json.loads(sys.stdin.read()).get("Account",""))'
}

main
main_python3
