#!/bin/sh
#
# @reference : http://q.hatena.ne.jp/1265784292  

bash -c "sleep 20; test -e /proc/$$ && kill -KILL $$" > /dev/null &
disown $!
exec "$@"
