#!/bin/sh

cd `dirname $0`
. ~/util/util.sh
. ~/sybase/util.sh

log "$0 $* Init"
query "drop table t1_w"
create_work_table "t1"
query "sp_help" | grep t1_w > tmp/t1w.log

if [ -s tmp/t1w.log ] ; then
    ext=0
else
    log "failed create t1_w"
    ext=1
fi

log "$0 $* Done"
exit ${ext}
