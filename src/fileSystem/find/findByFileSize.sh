
#!/usr/bin/env bash

dd if=/dev/zero of=${HOME}/getsome.bin bs=10M count=1
find ${HOME} -maxdepth 1 -size +9M
