#!/bin/sh

cd `dirname $0`
. ~/git/esmon/bin/java/util.sh
log "$0 $* Init"

./build.sh
ret=$?
if [ ${ret} -ne 0 ] ; then
    echo "build error"
    exit 1
fi

export CLASSPATH=`find lib -type f -name "*.jar" | tr '\n' ':' | sed "s/:$//g"`":bin"
java junit.textui.TestRunner test.IncomeTester
log "$0 $* Done"
