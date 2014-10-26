#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh

query "drop table tc"
query "create table tc (id varchar(1), name varchar(3))"
query "select * from tc;" 
query "insert into tc values ('1', 'aaa')" 
query "insert into tc values ('2', 'aaa')" 
query "insert into tc values ('3', 'aaa')" 
query "select * from tc;" 
query "truncate table tc"
query "select * from tc;" 
query "select * from tc;" > tmp/query_ins.log

if [ -n "`grep "0 row" tmp/query_ins.log`" ] ; then
   ext=0
else
   ext=1 
fi
exit ${ext}
