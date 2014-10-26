#!/bin/sh

if [ $# -ne 3 ] ; then
    echo "illegal arguments"
else
    file=$1
    key_cols=$2
    append_col=$3
    dir=`dirname $0`
fi

if ! [ -e ${file} ] ; then
    echo "file missing error. file=${file}"
    exit 1 
fi

awk -F, -vpkN=${key_cols} -vappend_col=${append_col} -f ${dir}/shift.awk ${file}
