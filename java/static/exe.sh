#!/bin/sh

cd `dirname $0`
javac StaticTester.java

java -Dpid=1 StaticTester &
java -Dpid=2 StaticTester &

# @description
#   in this case, each process does not effect each other.
#   becuase it is running on each JVM.
