#!/bin/sh


echo "12345" | awk '{print length($0)}'
