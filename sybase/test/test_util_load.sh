#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh
. ~/sybase/sybase_env.sh

log "$0 $* Init"
echo "2,bbb" > tmp/load.csv

query "drop table t1 ; create table t1 (id varchar(10), name varchar(10))"
query "select * from t1"

load t1 tmp/load.csv 
query_csv "select * from t1" > tmp/load_ret.txt

if [ -n "`grep "2,bbb" tmp/load_ret.txt`" ] ; then
    ext=0
else
    log "[Error]"
    ext=1
fi

log "$0 $* Done"
exit ${ext}
