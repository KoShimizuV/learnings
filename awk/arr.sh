#!/bin/sh

echo "a,b,c,1,2,3" > tmp/tmp.csv

awk -f awk/arr.awk tmp/tmp.csv
