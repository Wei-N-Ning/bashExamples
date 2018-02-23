#!/bin/bash

function generateSUT() {
    echo "
#!/bin/bash
while read line
do
  echo \"\$line\"
done < \"${1:-/dev/stdin}\"
" > /tmp/_.sh
    chmod 0777 /tmp/_.sh
}

# expecting output:
# A
# B
function assertSUT() {
    if ! (printf "A\nB\n" | /tmp/_.sh); then
        echo "sut failed!"
        exit 1
    fi
}

function run() {
    generateSUT
    assertSUT
}

run
