#!/bin/awk

{  
    split(pkN, arr, ",") ;
    n = 0
    pk=""
    for (key in arr){
       pk = pk == "" ? $arr[key] : pk FS $arr[key]
       n = key
    }
    val = ""
     for(i = n+1 ; i <= NF; i++){
        val = val == "" ? $i : val FS $i
    }
    if (pk == last_pk) {
        split(last_val, arr, FS)
        print pk FS val FS arr[append_col - n]
    }
    last_pk = pk
    last_val = val
}

