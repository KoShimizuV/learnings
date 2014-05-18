#!/bin/sh

echo "abc" |  awk  '{
    print("abc") > "/dev/stdout"
    print("zzz") > "/dev/stderr"
}' > std.txt 2> err.txt
