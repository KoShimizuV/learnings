#!/bin/sh


echo "" | awk '
function eomth(yyyymm){
    yyyy = substr(yyyymm,1,4)
    mm = substr(yyyymm,5,2) + 1
    time = mktime(yyyy" "mm" 1 0 0 0") - 60 * 60 * 24 * 1
    return strftime("%Y%m%d", time)
}
{
   print eomth("201301") == "20130131" ? "." : "NG" # end of month 31th
   print eomth("201304") == "20130430" ? "." : "NG" # end of month 30th
   print eomth("201302") == "20130228" ? "." : "NG" # end of month 28th
   print eomth("201202") == "20120229" ? "." : "NG" # leap year
}'
