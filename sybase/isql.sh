#!/bin/sh

. ~/sybase/sybase_env.sh

exe () {
    option="-U${SB_USER} -P${SB_PASS} -S${SB_SERVER} -D${SB_DB} -w999999 --retserverror"
    if [ -t 0 ] ; then
        log "[args]isql $* ${option}"
        isql $* ${option}
        return $?
    else
        log "[stdin]isql ${option}"
        cat - | isql ${option}
        return $?
    fi
}

log (){
    echo "[`date +"%Y/%m/%d %H:%M:%S"`]$*" >> ~/sybase/logs/isql_`date +"%Y%m%d"`.log
}

format () {
    query=$1
    if [ -n "`echo ${query} | grep ";"`" ] ; then
        (echo "${query}" | sed "s/;/\ngo\n/g"; echo "go")
    elif [ -n "`echo ${query} | grep "go"`" ] ; then
        echo "${query}"
    else 
        (echo "${query}"; echo "go")
    fi
}

if ! [ -t 0 ] ; then
    query=$(format "`cat -`")
    log "[stdin]${query}"
    echo "${query}" | exe
    exit $?
elif [ $# -eq 1 ] ; then
    query=`format "$1"`
    log "[arg1]${query}"
    echo "$query" | exe
    exit $?
elif [ $# -ge 2 ] && [ -n "`echo "$0" | grep "\-i"`"] ; then
    tmp_ddl=${SB_TMP}/$$.sql
    format "`cat $2`" > ${tmp_ddl}
    chmod 777 ${tmp_ddl}
    args=`echo "$*" | awk -vddlo=${2} -vddlt=${tmp_ddl} '{ line=$0; sub(ddlo, ddlt, line); print line}'`
    log "[argFile]${args}"
    exe "${args}"
    exit $?
else
    log "[argN]$@"
    exe "$@" 
    exit $?
fi
