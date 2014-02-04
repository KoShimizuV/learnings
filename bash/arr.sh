#/bin/bash

arr=(1 2 3)
echo $arr
echo ${arr[0]}
echo ${arr[1]}
echo ${arr[@]}
arr+=(5 6)
echo ${arr[@]}
