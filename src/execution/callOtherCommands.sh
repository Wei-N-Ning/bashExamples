#!/bin/bash

if_statement() {
  # test if a process exists (exact-match)
  if (pgrep -x "notexist")
  then
      exit 1
  fi

  # test the return code from a command
  if ! (touch /tmp/dd)
  then
      exit 1
  fi

  if ! (python -c "exit(0)")
  then
      exit 1
  fi

  if (python -c "exit(1)")
  then
      exit 1
  fi
}

conditional_statement() {
  ( exit 1 ) && echo "impossible"
  ( exit 0 ) && echo "success"
}

catch_exitcode() {
  ( exit 1); echo -n ${?}
  ( exit 0); echo ${?}
  local ret=$(exit 1)

  # the value of ret is empty
}

if_statement
conditional_statement
catch_exitcode

