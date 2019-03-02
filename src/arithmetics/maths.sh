#!/usr/bin/env bash

expr 1 + 1
expr 1 \* 2

multiply() {
  local var1=${1:?missing var1}
  local var2=${2:?missing var2}
  echo $( expr ${var1} \* ${var2} )
}

multiply 1 2
if [[ $( multiply 0 2 ) == "0" ]]
then
  echo "lol"
fi

# print seconds
echo $(( SECONDS + 5 * 60))

