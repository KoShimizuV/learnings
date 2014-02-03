#!/bin/sh

cd `dirname $0`
. ~/util/util.sh
log "$0 $* Init"

if [ -s tmp/execute.log ] ; then
    rm -v tmp/execute.log
fi

for f in `find ./ -name "test_*.sh"`
do
    bash ${f}
    ret=$?
    echo "${ret} : ${f}" >> tmp/execute.log
done

if [ -n "`grep -v "^0" tmp/execute.log`" ] ; then
    ret_str="OK"
else
    ret_str="NG"
fi

(echo "results"; cat tmp/execute.log) | mail -r s.kou@nifty.com -s "${ret_str} test_results" s.kou@nifty.com
cat tmp/execute.log
log "$0 $* Done"
