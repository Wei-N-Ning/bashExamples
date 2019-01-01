#!/bin/bash

function multipleCommandsInOneLine {
  echo -n "1" ; echo -n "2"
  echo -n "3" && echo $?
}

function run {
  multipleCommandsInOneLine
}

run

