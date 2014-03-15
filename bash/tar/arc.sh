#!/bin/sh

cd `dirname $0`


if [ -s log/arch/csv.tar.gz ] ; then
    rm -v log/arch/csv.tar.gz
fi

if [ -s csv.tar.gz ] ; then
    rm -v csv.tar.gz
fi

files=`find csv -name "*.csv" -printf "%f "` 
tar zcvf csv/arch/csv.tar.gz -C csv ${files}
