#!/bin/sh

cd `dirname $0`
export  LANG=en_US

latest=new
not_latest=old
synched=${not_latest}_synced

rm -rf ${latest} ${not_latest} ${synched}
mkdir ${latest} ${not_latest}

echo "abc" > ${latest}/same.txt
echo "abc" > ${not_latest}/same.txt

echo "123" > ${latest}/diff1.txt
echo "456" > ${not_latest}/diff1.txt

echo "123" > ${latest}/diff.txt
echo "456" > ${not_latest}/diff.txt

echo "new_only" > ${latest}/only_new.txt
echo "old_only" > ${not_latest}/only_old.txt

cp -rp ${not_latest} ${synched}

diff_files=`diff -rq ${latest} ${not_latest} | grep differ$ | sed -n "s|Files ${latest}/\(.*\) and .*|\1|p"`
for f in ${diff_files}
do
    echo "diff file. f=${f}"
    cp -p ${latest}/${f} ${synched}/${f} 
done

only_new_files=`diff -rq ${latest} ${not_latest} | grep "^Only in ${latest}" | awk '{print $NF}'`
for f in ${only_new_files}
do
    echo "only in ${latest}. f=${f}"
    cp -p ${latest}/${f} ${synched}/${f} 
done

only_old_files=`diff -rq ${latest} ${not_latest} | grep "^Only in ${not_latest}" | awk '{print $NF}'`
for f in ${only_old_files}
do
    echo "only in ${not_latest}. f=${f}"
    rm -v ${synched}/${f} 
done

line=`diff -rq ${latest} ${synched} `
if [ -z "${line}" ] ; then
    echo "success"
else
    echo "failed"
    echo ${line}
fi

exit
Files new/diff.txt and old/diff.txt differ
Only in new: only_new.txt
Only in new: only_old.txt
