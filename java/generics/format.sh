#!/bin/sh


for f in `ls *.java`
do
  echo $f
  cat $f | sed "s/^/ /g"
done
