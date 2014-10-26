#!/bin/sh

. ~/sybase/util.sh
. ~/util/util.sh

cd `dirname $0`

log "$0 $* Init"

query "drop table m1"
query "create table m1 (id varchar(10), name varchar(10), age int null)"
query "alter table m1 add PRIMARY KEY (id)"
query "insert into m1 values ('1','aaa',11)"
echo "1,aab
2,bbb" > tmp/import_merge.csv

echo "1,aab,11
2,bbb,NULL" > tmp/import_merge_c.csv

import_merge m1 tmp/import_merge.csv , id,name

query_csv "select * from m1" > tmp/m1.csv

if [ -z "`diff tmp/m1.csv tmp/import_merge_c.csv`" ] ; then
    ext=0
else
    ext=1
    log "[Error]some difference exists"
fi

log "$0 $* Done"
exit ${ext}

