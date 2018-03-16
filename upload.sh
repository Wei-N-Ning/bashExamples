#!/usr/bin/env bash

bash ./src/fileSystem/find/walkDirs.sh $( pwd )
git add .
git commit -a -m "automatically update readme markdown"
git push
