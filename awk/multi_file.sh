#!/bin/sh

cd `dirname $0`
echo "001,apple
002,pie" > tmp/in1.csv
echo "001,orange
002,juice" > tmp/in2.csv

awk -f awk/multi.awk tmp/in1.csv tmp/in2.csv
