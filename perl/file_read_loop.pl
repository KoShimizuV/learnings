#!/usr/bin/perl

open(OUT, "> tmp/out.txt");
    print OUT "1,a \n";
    print OUT "2,b \n";
    print OUT "3,c \n";
close OUT;

open(IN, "< tmp/out.txt");
    @line = <IN>;
close IN;

foreach (@line){
    chop; #remove return code
    ($code, $name) = split(",", $_);
    print "code=$code, name=$name \n";
}
