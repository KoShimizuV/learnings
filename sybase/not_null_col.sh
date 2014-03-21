#!/bin/sh

cd `dirname $0`
. util.sh

#query "sp_help"
#query "select * from syscolumns"
#query "create table test1 (id int, label varchar(10) null)"
#query "sp_help sysobjects"
#query "sp_help syscolumns"
query "select o.name, c.name, c.status  from sysobjects o, syscolumns c where o.id = c.id and o.name= 'test1' and c.status != 8"
#query "select * from systables"
