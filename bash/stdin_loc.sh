#!/bin/sh

cd `dirname $0`

if [ ! -t 0 ] ; then
    echo "stdin"
    a=$(cat -)
    echo "input string is ${a}"
else
    echo "nothing stdin"
fi 
