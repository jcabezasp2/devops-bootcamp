#!/bin/bash

DEFAULT_TEXT="Que me gusta la bash!!!!"

mkdir -p foo/dummy foo/empty
touch foo/dummy/file2.txt

if [ -z "$1" ]; then
    echo $DEFAULT_TEXT > foo/dummy/file1.txt
else
    echo $1 > foo/dummy/file1.txt
fi

cat foo/dummy/file1.txt > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/