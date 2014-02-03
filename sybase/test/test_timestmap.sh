#!/bin/sh

cd `dirname $0`
. ../util.sh

log "$0 $* Init"

query "drop table tt"
query "create table tt (id int, timestamp)"
query "insert into tt (id) values (1)"
query "select * from tt"

log "$0 $* Done"
