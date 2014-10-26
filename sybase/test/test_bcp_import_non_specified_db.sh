#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh
. ~/sybase/sybase_env.sh

log "$0 $* Init"
echo "2,bbb" > tmp/import.csv

query "drop table t1 ; create table t1 (id varchar(10), name varchar(10))"
query "sp_help" | grep t1
query "use master; sp_dboption \"${SB_DB}\", \"select into/bulkcopy\", true "
query "select * from t1"

../bcp.sh ${SB_DB}..t1 in tmp/import.csv -t, -c

query "select * from t1" > tmp/imp_ret.txt

if [ -n "`grep "(0 rows affected)" tmp/imp_ret.txt`" ] ; then
    ext=1
    log "Import failed"
else
    ext=0
fi

log "$0 $* Done"
exit ${ext}
