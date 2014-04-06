#!/bin/sh

cd `dirname $0`
per=`df -h | awk '($6 == "/"){print $5}'`
perN=`echo ${per} | sed "s/%//g"`

if [ ${perN} -lt 50 ] ; then
    exit 0
fi

echo "check space in below

`df`" | mail -s "check space in ${HOSTNAME}" s.kou@nifty.com
