#!/bin/sh

echo "a,b,c" | awk -FS, '{
    split($0,arr)
    print arr # => error
}'
