#!/bin/sh

log (){
    echo "[`date +"%Y/%m/%d %H:%M:%S"`]$*"
}

cd `dirname $0`

touch log/exe_20140228.log
touch log/exe_20140301.log
touch log/exe_20140403.log

# date threshold  for archive
ymd_th=`date -d"1 month ago" +"%Y%m%d"`
log "ymd_th=${ymd_th}"

for path in `find log -maxdepth 1 -name "exe_*.log"`
do
    f=`basename ${path}`
    ymd=${f:4:8}
    if [ ${ymd} -le ${ymd_th} ] ; then
        log "archive ${path}"
        gzip ${path}
        mv ${path}.gz log/arch
    fi
done
