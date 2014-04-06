#!/bin/sh

cd `dirname $0`
echo "1,apple
2,orange" > tmp/in1.csv

echo "1,100
2,200" > tmp/in2.csv

awk -f awk/join.awk tmp/in1.csv tmp/in2.csv
