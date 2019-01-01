#!/bin/bash

# use the heredoc technique instead!!!

/usr/bin/time python -c "
import sys

for i in xrange(1000):
    i += i

class PrintArgs(object):
  def __init__(self):
    print(sys.argv[1:])

if __name__ == '__main__':
  PrintArgs()
" foo bar
