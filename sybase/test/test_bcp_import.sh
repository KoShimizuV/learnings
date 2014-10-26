#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh
. ~/sybase/sybase_env.sh

echo "2,bbb" > tmp/import.csv

query "drop table t1 ; create table t1 (id varchar(10), name varchar(10))"
query "sp_help" | grep t1
query "use master; sp_dboption \"ase1\", \"select into/bulkcopy\", true "
query "select * from t1"

../bcp.sh ase1..t1 in tmp/import.csv -t, -c

query "select * from t1" > tmp/imp_ret.txt

if [ -s tmp/imp_ret.txt ] ; then
    ext=0
else
    ext=1
fi

exit ${ext}
