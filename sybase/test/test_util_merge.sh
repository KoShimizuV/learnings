#!/bin/sh

. ~/sybase/util.sh
. ~/util/util.sh

cd `dirname $0`

log "$0 $* Init"

query "drop table m1"
query "drop table m1_w"
query "create table m1 (id varchar(10), name varchar(20), age int)"
query "create table m1_w (id varchar(10), name varchar(20), age int)"
query "alter table m1 add PRIMARY KEY (id)"
query "alter table m1_w add PRIMARY KEY (id)"
query "insert into m1 values ('1', 'aaa', 20)"
query "insert into m1_w values ('1', 'aab', 11)"
query "insert into m1_w values ('2', 'bbb', 22)"

_merge m1 id,name,age

query_csv "select * from m1" > tmp/m1.csv
echo "1,aab,11
2,bbb,22" > tmp/correct.csv

if [ -z "`diff tmp/m1.csv tmp/correct.csv`" ] ; then
    ext=0
else
    ext=1
    log "[Error]some difference exists"
fi

log "$0 $* Done"
exit ${ext}

