#!/bin/sh

cd `dirname $0`
. ~/git/esmon/bin/java/util.sh
log "$0 $* Init"

export CLASSPATH=`find lib -type f -name "*.jar" | paste -s -d:`
echo $CLASSPATH

find ./bin -type f | grep -v git | xargs -r rm -v
find ./src -type f -name "*.java" | xargs javac -d bin
ret=$?

log "$0 $* Done"
exit $ret
