#!/bin/sh

alias java='/usr/local/src/jdk1.7.0_17/bin/java'
rm -f *.class
javac *.java
java -cp . MainExe
