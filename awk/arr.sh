#!/bin/sh

echo "a,b,c,1,2,300" > tmp/tmp.csv

awk -f awk/arr.awk tmp/tmp.csv
