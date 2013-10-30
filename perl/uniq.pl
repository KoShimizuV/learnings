#!/bin/usr/perl

@items=("a","a","b");
my %seen;
@uniq_item = grep{!$seen{$_}++} (@items);
print(@uniq_item);
