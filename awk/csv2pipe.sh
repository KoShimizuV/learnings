#!/bin/sh

#echo 'aaa,cc' | awk -f awk/csv2pipe.awk
#exit
echo '"aaa",,12,30,"bbb","c,cc"' | awk -f awk/csv2pipe.awk
echo  'aaa||12|30|bbb|c,cc' 
echo "---"


