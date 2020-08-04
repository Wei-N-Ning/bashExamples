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
        echo "${value}" && exit
        ;;
      f)
        value="${OPTARG}-FFF ${option}"
        echo "${value}" && exit
        ;;
      \?)
        error "unknown option: -${OPTARG}"
        exit 1
        ;;
      :)
        error "-${OPTARG} requires an argument"
        exit 1
        ;;
    esac
  done
}

parse_all $@
