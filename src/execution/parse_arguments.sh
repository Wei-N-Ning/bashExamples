#!/usr/bin/env bash

error() {
  echo "$(date '+[%H:%M:%S]') ${BASH_SOURCE[0]}: ERROR: $*" >&2
  exit 1
}

parse_all() {
  local value
  while getopts :d:f: option
  do
    case "${option}" in
      d)
        value="${OPTARG}-DDD ${option}"
        ;;
      f)
        value="${OPTARG}-FFF ${option}"
        ;;
      \?)
        error "unknown option: -${OPTARG}"
        ;;
      :)
        error "-${OPTARG} requires an argument"
        ;;
    esac
    echo "${value}"
  done
}

main() {
  parse_all -f dev plan
}

main
