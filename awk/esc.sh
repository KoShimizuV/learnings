#!/bin/sh

echo "abc" | awk '{printf("\047%s\047", $1)}'
