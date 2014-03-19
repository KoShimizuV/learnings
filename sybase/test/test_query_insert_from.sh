#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh

query "drop table t2"
query "create table t2 (id int, name varchar(10))"
query "insert into t2 values (1, 'aaa')" 
query "insert into t2 values (2, 'aaa')" 

query "drop table t1"
query "create table t1 (id int, name varchar(10))"
#query "insert into t1 select id, name from t2"
query "insert into t1 (id, name) select id, name from t2"
query "select * from t1;" > tmp/query_ins.log

if [ -s tmp/query_ins.log ] ; then
   ext=0
else
   ext=1 
fi
exit ${ext}
