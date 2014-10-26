#!/bin/sh

remove () {
    local log="$1"
    if [ -s ${log} ] ; then
        rm -v ${log}
    fi
}

log () {
    echo "[`date +"%Y/%m/%d %H:%M:%S"`]$*"
}

stderr () {
    log "[Eror]$*" 1>&2
}

