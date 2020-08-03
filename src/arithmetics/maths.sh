#!/usr/bin/env bash

echo "$((1 + 1))"
echo $((1 * 2))  # with plain nums, no need to quote

multiply() {
  local var1=${1:?missing var1}
  local var2=${2:?missing var2}
  echo $(("${var1}" * "${var2}"))  # variables must be quoted
}

multiply 1 20
if [[ $( multiply 0 2 ) == "0" ]]
then
  echo "lol"
fi

# print seconds
# SECONDS returns a count of the number of (whole) seconds the shell has been running.
# https://www.oreilly.com/library/view/shell-scripting-expert/9781118166321/c03-anchor-3.xhtml
sleep 2
echo $(( SECONDS + 5 * 60))

