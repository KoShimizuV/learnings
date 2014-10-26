#!/bin/sh

cd `dirname $0`

touch csv/1.csv
touch csv/2.csv

if [ -s log/arch/csv.tar.gz ] ; then
    rm -v log/arch/csv.tar.gz
fi

if [ -s csv.tar.gz ] ; then
    rm -v csv.tar.gz
fi

files=`find csv -name "*.csv" -printf "%f "` 
tar zcvf csv/arch/csv.tar.gz -C csv ${files}
