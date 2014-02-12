#!/bin/awk

function addmonth(yyyymm, n){
    yyyy = substr(yyyymm,1,4)
    mm = substr(yyyymm,5,2) + n
    time = mktime(yyyy" "mm" 1 0 0 0")
    return strftime("%Y%m", time) 
}

{
   print addmonth(201301, 1) == 201302 ? "." : "NG";
   print addmonth(201312, 1) == 201401 ? "." : "NG";
   print addmonth(201312, 12) == 201412 ? "." : "NG";
   print addmonth(201212, 24) == 201412 ? "." : "NG";
  
   print addmonth(201301, -1) == 201212 ? "." : "NG";
   print addmonth(201312, -1) == 201311 ? "." : "NG";
   print addmonth(201312, -12) == 201212 ? "." : "NG";
   print addmonth(201312, -13) == 201211 ? "." : "NG";
}
