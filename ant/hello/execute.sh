#!/bin/sh

cd `dirname $0`
ant
java -cp dist/hello.jar -DNAME=ko Hello
