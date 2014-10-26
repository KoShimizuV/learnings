#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh
. ~/util/util.sh

log "$0 $* Init"

query "drop table test_table"
query "create table test_table (id varchar(10), from_date datetime, name varchar(10), label varchar(10))"
query "alter table test_table add PRIMARY KEY (id) "
query "create nonclustered index test_table_i1 on test_table (id, from_date)"
query "sp_helpindex test_table"

log "$0 $* Done"
