#!/bin/sh


echo "" | awk '
function add_day(yyyymmdd,i){
  yyyy=substr(yyyymmdd,1,4)
  mm=substr(yyyymmdd,5,2)
  dd=substr(yyyymmdd,7,2)
  time = mktime(yyyy" "mm" "dd" 0 0 0") + 60 * 60 * 24 * i
  return strftime("%Y%m%d", time)
}
{
   print add_day("20130101", +1) == "20130102" ? "." : "NG" # next day
   print add_day("20130101", +5) == "20130106" ? "." : "NG" # next 5day
   print add_day("20130131", +1) == "20130201" ? "." : "NG" # next day over month
   print add_day("20121231", +1) == "20130101" ? "." : "NG" # next day over year
   print add_day("20120228", +1) == "20120229" ? "." : "NG" # next day leap year

   print add_day("20130102", -1) == "20130101" ? "." : "NG" # last day
   print add_day("20130106", -5) == "20130101" ? "." : "NG" # last 5day
   print add_day("20130501", -1) == "20130430" ? "." : "NG" # last day over month
   print add_day("20130101", -1) == "20121231" ? "." : "NG" # last day over year 
   print add_day("20120301", -1) == "20120229" ? "." : "NG" # last day leap year
   print add_day("20130301", -1) == "20130228" ? "." : "NG" # febrary
}'
