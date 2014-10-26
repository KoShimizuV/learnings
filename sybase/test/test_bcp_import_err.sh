#!/bin/sh

cd `dirname $0`
. ~/sybase/util.sh
. ~/sybase/sybase_env.sh

echo "2,bbb" > tmp/import.csv
echo "a,bbb" >> tmp/import.csv
echo "b,bbb" >> tmp/import.csv
echo "4,bbb" >> tmp/import.csv

query "drop table t1"
query "create table t1 (id integer, name varchar(10))"
query "sp_help" | grep t1
query "use master"
query "sp_dboption \"ase1\", \"select into/bulkcopy\", true "
query "select * from t1"

../bcp.sh ase1..t1 in tmp/import.csv -t, -c -m 1

query_csv "select * from t1" > tmp/imp_ret.txt

if [ -s tmp/imp_ret.txt ] ; then
    ext=1
else
    ext=0
fi

exit ${ext}
