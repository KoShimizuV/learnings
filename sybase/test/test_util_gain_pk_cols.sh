#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh
. ~/util/util.sh

log "$0 $* Init"

_gain_pk_cols "t2"  > tmp/pk_cols.csv

if [ "`cat tmp/pk_cols.csv`" == "id,type" ] ; then
    ext=0
else
    log "Error."
    ext=1
fi

log "$0 $* Done"
exit ${ext}
