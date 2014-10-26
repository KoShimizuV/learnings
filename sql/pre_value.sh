#!/bin/sh

cd `dirname $0`

q(){
    mysql -uroot -proot -Dtest_db -e "$*"
}

q "drop table item"
q "create table item(code varchar(10), date date, price int(10))"
q "insert into item (code, date, price) values ('001','2014-01-01', 100)"
q "insert into item (code, date, price) values ('001','2014-01-02', 101)"
q "insert into item (code, date, price) values ('001','2014-01-04', 102)"
q "insert into item (code, date, price) values ('001','2014-01-05', 103)"
q "insert into item (code, date, price) values ('002','2014-01-01', 200)"
q "insert into item (code, date, price) values ('002','2014-01-02', 201)"
q "insert into item (code, date, price) values ('002','2014-01-04', 202)"
q "insert into item (code, date, price) values ('002','2014-01-05', 203)"

q "select * from item"

q "select a.code, a.date, b.date preDate, a.price, b.price as prePrice
   from item a, item b
   where 
     a.code = b.code
   and b.date = (select max(date) from item where date < a.date and code = a.code)
"

exit
mysql -uroot -proot -e "create database test_db"
