#!/bin/sh

. ~/sybase/sybase_env.sh
exe_cmd="bcp $@ -U${SB_USER} -P${SB_PASS} -S${SB_SERVER}"
echo ${exe_cmd}
${exe_cmd}
exit $?
