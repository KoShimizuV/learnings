#!/bin/sh

echo "a
b
c" > tmp/original.txt

sed -i.bk '1d' tmp/original.txt

ls tmp/
