#!/bin/sh
#
# @return : 0 = success, 1= error exists

. ./util.sh

if [ $# -ge 2 ] ; then
    file=$1
    error_log=$2
else
    stderr "illegal arguments. 2 args are required"
    exit 1
fi
if ! [ -s ${file} ] ; then
    stderr "file is empty or nothing. ${file}" 
    exit 1
fi

log "file=${file}; error_log=${error_log}"
ng_words="no such,error"
remove ${error_log}

IFS=","
for w in ${ng_words}
do
    line=`grep -iw ${w} ${file}`
    if [ -n "${line}" ] ; then
       echo "${line}" >> ${error_log}
    fi
done

if [ -s ${error_log} ] ; then
    log "error exists. ${error_log}"
fi

exit 0
