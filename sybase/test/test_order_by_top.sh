#!/bin/sh

. ~/sybase/util.sh

query "drop table ot"
query "create table ot (number int)"
query "insert into ot values (4)"
query "insert into ot values (3)"
query "insert into ot values (2)"
query "insert into ot values (1)"
query "insert into ot values (5)"

query "select top 2 * from ot order by number"
query "select top 2 * from ot order by number desc"

