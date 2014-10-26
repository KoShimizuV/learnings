#!/bin/sh

cd `dirname $0`
. ../util.sh

query "drop table ti"
query "drop table ti2"
query "create table ti (id int, type int, name varchar(10))"
query "create table ti2 (id int, type int, namy varchar(10))"
query "insert into ti values (1, 10, 'a')"
query "insert into ti values (2, 20, 'b')"
query "insert into ti values (3, 30, 'c')"
query "insert into ti values (3, 40, 'c')"
query "insert into ti2 values (3, 20, 'a')"
query "insert into ti2 values (3, 30, 'b')"
query "insert into ti2 values (5, 30, 'c')"
query "select * from ti"
query "select * from ti2"

query "select id, type, name from ti where (id) in (select id from ti2)"


query "select id from ti where (id, type) in (select id, type from ti2)"
ret=$?

if [ ${ret} -ne 2 ] ; then
   ext=1
   stderr "unknow success. we expected failure."
else
   ext=0
fi

#query "select a.id, a.type 
#       from ti a, ti2 b 
#       where 
#        a.id   = b.id and
#        a.type = b.type"

exit ${ext}
