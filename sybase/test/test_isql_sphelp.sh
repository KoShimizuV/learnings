#!/bin/sh

isql=~/sybase/isql.sh

${isql} "sp_help
go" > tmp/sp_help.log

if [ -s tmp/sp_help.log ] ; then
    ext=0
else
    ext=1
fi

cat tmp/sp_help.log
exit ${ext}
