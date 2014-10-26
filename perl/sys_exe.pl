#!/usr/bin/perl

open(OUT, "> tmp/a.txt");
    print OUT "1,a";
close OUT;

$exe_val1=`cat tmp/a.txt`;
$ret_code1=$?;
print("executed_value=$exe_val1 \nreturn code=$ret_code1 \n");

$exe_val2=`cat tmp/b.txt`;
$ret_code2=$?;
print("executed_value=$exe_val2 \nreturn code=$ret_code2 \n");
