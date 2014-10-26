#!/bin/sh

cd `dirname $0`
touch log/1.csv
touch log/2.csv

for f in `find ./ -name "*.csv"`
do
    bzip2 ${f}
    mv ${f}.bz2 log/arch
done

ls -ltr log/arch/
