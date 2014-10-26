#!/bin/sh

# find d1 -type d | xargs -i -r cp -p {} d2/
find d1 -type d | sed "s/^d1/d2/" | xargs -r mkdir
#find d1 -type d | sed "s/^d1//" | xargs -i -r cp -p d1/{} d2/
