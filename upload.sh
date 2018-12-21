#!/usr/bin/env bash

thisdir=$( dirname ${BASH_SOURCE[0]} )
bash ${thisdir}/src/fileSystem/find/walkDirs.sh ${thisdir}/src > ./README.md
git add .
git commit -a -m "automatically update readme markdown"
git push
