#!/bin/sh

cd `dirname $0`
. ~/util/util.sh
. ~/sybase/util.sh

log "$0 $* Init"

query "drop table t3"
query "create table t3 (id varchar(10), type varchar(10), name varchar(100), age int)"
query "drop table t3_w"
create_work_table "t3" "id,type,age"
query "sp_help" | grep t3_w > tmp/t3w.log

if [ ! -s tmp/t3w.log ] ; then
    log "failed create t3_w"
    log "$0 $* Done"
    exit 1
fi

_gain_cols_info t3_w tmp/t3w_cols.log

for c in `echo "id type age"`
do
    if [ -z "`grep ${c} tmp/t3w_cols.log`" ] ; then
        log "[error]${c} is missing"
        ext=1 
    fi
done

if [ -n "`grep name tmp/t3w_cols.log`" ] ; then
    log "[error]name is exists."
    ext=1
fi

log "$0 $* Done"
exit ${ext}
