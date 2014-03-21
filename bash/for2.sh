#!/bin/sh

echo "1 b c" > tmp.txt
echo "2 b c" >> tmp.txt

IFS=$'\n'
for line in `cat tmp.txt`
do
    echo "line=${line}"
done
