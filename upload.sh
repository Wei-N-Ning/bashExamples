#!/usr/bin/env bash

bash ./src/fileSystem/find/walkDirs.sh $( pwd ) > ./README.md
git add .
git commit -a -m "automatically update readme markdown"
git push
