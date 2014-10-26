#!/bin/sh

cd `dirname $0`
. ../util.sh

log "$0 $* Init"

query "drop table tt"
query "create table tt (id int, dt bigdatetime)"
query "insert into tt values (1, current_bigdatetime())"
query "insert into tt values (2, current_date())"
query "insert into tt values (3, current_time())"
query "insert into tt values (4, current_bigtime())"
query "insert into tt values (5, getdate())"
query "select * from tt"

query "select current_bigdatetime()"
query "select getdate()"
query "select current_date()"
query "select current_time()"
query "select current_bigtime()"

log "$0 $* Done"
