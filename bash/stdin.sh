#!/bin/sh

cd `dirname $0`

if [ ! -t 0 ] ; then
    echo "stdin"
    cat -
else
    echo "nothing stdin"
fi 
