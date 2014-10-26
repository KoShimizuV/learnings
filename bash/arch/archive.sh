#!/bin/sh

cd `dirname $0`

echo "real" > log/log_real.log

echo "1m ago" > log/log_1m.log
date1=`date -d"1 month ago"`
touch -d "${date1}" log/log_1m.log

find log -maxdepth 1 -mtime +30 -type f | xargs -r gzip
find log -maxdepth 1 -name "*.gz" | xargs -r -i mv {} log/arch

ls -ltr log 
ls -ltr log/arch
