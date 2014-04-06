#!/bin/sh

cd `dirname $0`
host=ftp.xxx.jp
id=foo
pass=bar

rm 1.txt 2.txt
#echo "1" > 1.txt 
#echo "2" > 2.txt
ls

ftp -nv ${host} << _END
user ${id} ${pass}
cd /var/www/tmp
prompt
mget *.txt 
bye
_END

