#!/usr/bin/env bash

# source:
# https://serverfault.com/questions/399428/how-do-you-escape-characters-in-heredoc
# must read:
# http://tldp.org/LDP/abs/html/here-docs.html#EX71C

#   No parameter substitution when the "limit string" is quoted or escaped.
#   Either of the following at the head of the here document would have
#+  the same effect.
#   cat <<"Endofmessage"
#   cat <<\Endofmessage

setUp() {
    set -e
    rm -rf /tmp/sut /tmp/_ /tmp/_.* /tmp/__*
    mkdir /tmp/sut
}

preserveQuotesAndDollars() {
    cat > /tmp/sut/test.py <<"THEREISACOW"
__doc__ = """$$
there ${is} a ${cow}
"""
def foo():
    s = "-".join(['"' + c for c in __doc__])
    s = s.replace("_", '').replace('''-''', "")
    print(s)
if __name__ == "__main__":
    foo()
THEREISACOW
    python /tmp/sut/test.py
}

setUp
preserveQuotesAndDollars
