#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh

query "delete t1 " 
query "insert into t1 values ('1', 'aaa')" 
query "select * from t1;" > tmp/query_ins.log

if [ -s tmp/query_ins.log ] ; then
   ext=0
else
   ext=1 
fi
exit ${ext}
