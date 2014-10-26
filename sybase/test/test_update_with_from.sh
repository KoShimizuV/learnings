M
#!/bin/sh

cd `dirname $0`
. ../util.sh

query "drop table ts1"
query "drop table ts2"
query "create table ts1 (id int, type int, name varchar(10))"
query "create table ts2 (id int, type int, name varchar(10))"
query "alter table ts1 add PRIMARY KEY (id, type)"
query "alter table ts2 add PRIMARY KEY (id, type)"

query "insert into ts1 values (1, 10, 'a')"
query "insert into ts1 values (2, 20, 'b')"
query "insert into ts1 values (2, 30, 'c')"

query "insert into ts2 values (1, 10, 'x')"
query "insert into ts2 values (2, 20, 'y')"
query "insert into ts2 values (3, 30, 'z')"

query "select * from ts1"
query "select * from ts2"

query "update ts1 set a.name = b.name 
       from ts1 a, ts2 b 
       where a.id = b.id and a.type = b.type"

query "select * from ts1"
