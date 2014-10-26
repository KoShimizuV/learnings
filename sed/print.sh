#!/bin/sh

echo "name,value
abc,100
xyz,999" | sed -n '1p'

echo "--"

echo "name,value
abc,100
xyz,999" | sed -n 's/abc/ABC/p'
