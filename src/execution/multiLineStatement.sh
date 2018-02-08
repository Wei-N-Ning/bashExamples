#!/bin/bash

/usr/bin/time -v python -c "
for i in xrange(1000):
    i += i
"
