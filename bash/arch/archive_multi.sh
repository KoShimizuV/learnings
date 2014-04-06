#!/bin/sh

cd `dirname $0`

echo "real" > log/log_real.log

echo "1m ago" > log/log_1m.log
date1=`date -d"1 month ago"`
touch -d "${date1}" log/log_1m.log

find log -maxdepth 1 -mtime +30 -name "*.log" -printf "%f " |\
xargs tar --remove-files -zcvf log/arch/all_log.tar.gz -C log

ls -ltr log 
ls -ltr log/arch
