#!/bin/sh

rm tmp/0d.txt tmp/1d.txt tmp/2d.txt tmp/3d.txt

ymd0=`date -d"5 min ago" +"%Y/%m/%d %H:%M:%S"`
ymd1=`date -d"10 hour ago" +"%Y/%m/%d %H:%M:%S"`
ymd2=`date -d"1 day ago 10 hour ago" +"%Y/%m/%d %H:%M:%S"`
ymd3=`date -d"2 day ago 10 hour ago" +"%Y/%m/%d %H:%M:%S"`
touch -d "${ymd0}" tmp/0d.txt
touch -d "${ymd1}" tmp/1d.txt
touch -d "${ymd2}" tmp/2d.txt
touch -d "${ymd3}" tmp/3d.txt

ls -ltr tmp/*d.txt

for i in `seq 0 2`
do
    echo "minus i=${i}"
    find tmp -mtime -${i} -type f -name "*d.txt"
done

echo "--"
for i in `seq 0 2`
do
    echo "plus i=${i}"
    find tmp -mtime +${i} -type f -name "*d.txt"
done

echo "--"
for i in `seq 0 2`
do
    echo "no sign i=${i}"
    find tmp -mtime ${i} -type f -name "*d.txt"
done
