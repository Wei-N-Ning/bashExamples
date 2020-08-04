#!/usr/bin/env bash

# this works for symbolic link (one level only)
this=$(readlink "${BASH_SOURCE[0]}" || echo "${BASH_SOURCE[0]}")

# this is shorter than the python realpath statement
thisdir=$(cd "$(dirname "${this}")" || exit 1; pwd)
thisfile=$(python -c "import os;print(os.path.realpath('${BASH_SOURCE[0]}'))")
thisdir_=$(dirname "${thisfile}")
[[ "${thisdir}" == "${thisdir_}" ]] || echo "fail"
