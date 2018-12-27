#!/usr/bin/env bash

# motivation
#
# imagine a script needs to find certain beacon(s) in the
# its parent directories

# $1: the starting path, expected to be a file
#     the walk starts from its containing directory
# $2: a beacon
# $3...$n: optional beacons if more than any

# example

set -e

reverseWalkAndFind() {
  local dir_=$( dirname ${1:?"missing filename!"} )
  shift 1
  local beacons=${@:?"need at least one beacon!"}
  local found=
  while [[ ${dir_} != "/" ]]
  do
    found="1"
    for beacon in ${beacons}
    do
      if ! ( ls "${dir_}/${beacon}" >/dev/null 2>&1 )
      then
        found="0"
      fi
    done
    if [[ "${found}" == "1" ]]
    then
      echo ${dir_}
      return 0
    fi
    dir_=$( dirname ${dir_} )
  done
  return 1
}

# test cases:
create_mock_files() {
  rm -rf /tmp/sut
  mkdir -p /tmp/sut/swd/shots/dc10/0312/motion/bodyMotion/v12
  mkdir -p /tmp/sut/aba/takes/ed13_ea1_p/motion/facialMotion/v4

  # beacons - expect to find both
  touch /tmp/sut/swd/attributes.json
  touch /tmp/sut/swd/db_lock
  # beacons - expect to skip
  touch /tmp/sut/swd/shots/dc10/attributes.json

  # beacons - expect to skip
  touch /tmp/sut/aba/takes/ed13_ea1_p/motion/manifest.json
  # beacons - expect to find
  touch /tmp/sut/aba/takes/manifest.json
  touch /tmp/sut/aba/takes/attribute.json
}

tests() {
  local found=""
  found=$( reverseWalkAndFind \
    /tmp/sut/swd/shots/dc10/0312/motion/bodyMotion/v12 \
    attributes.json db_lock )
  echo ${found:?"not found"}

  found=$( reverseWalkAndFind \
    /tmp/sut/aba/takes/ed13_ea1_p/motion/facialMotion/v4 \
    attribute.json manifest.json )
  echo ${found:?"not found"}

  found=$( reverseWalkAndFind \
    /tmp/sut/aba/takes/ed13_ea1_p/motion/facialMotion/v4 \
    attribute.json ad.json )
  echo ${found:?"not found"}
}

create_mock_files
tests
