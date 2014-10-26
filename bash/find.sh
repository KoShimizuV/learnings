#!/bin/sh

ymd1=`date -d"1 day ago" +"%Y/%m/%d %H:%M:%S"`
ymd2=`date -d"2 day ago" +"%Y/%m/%d %H:%M:%S"`
touch -d "${ymd1}" tmp/1d.txt
touch -d "${ymd2}" tmp/2d.txt

ls -ltr tmp/*d.txt

find tmp -mtime +1 -type f -name "*d.txt"
