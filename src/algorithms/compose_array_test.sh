#!/usr/bin/env bash

bashexe="/bin/bash"
pyexe="/usr/bin/env python3"
thisdir=$(dirname "${BASH_SOURCE[0]}")
sut="${thisdir}/compose_array.sh"
pyfile="/var/tmp/a.py"

bash_result=$(${bashexe} "${sut}")
hs-shellast "${sut}" | genpy >"${pyfile}"
if [[ "${1}" != "" ]]; then
    cat "${pyfile}"
    exit 0
fi
py_result=$(${pyexe} "${pyfile}")

if [[ "${bash_result}" == "${py_result}" ]]; then
    exit 0
fi

echo "failed!"
echo "bash result----------------------------------------------"
echo "${bash_result}"
echo "========================================================="
echo "${py_result}"
echo "python result--------------------------------------------"
exit 1
