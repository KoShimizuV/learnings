#!/bin/awk -f

{
    arr[$1] = $2 
}

END{
    for(key in arr){
        print("bfr asort  key="key, "val="arr[key]);
    }
    asort(arr, list)
    print("--")
    for(key in list){
        print("aft asort  key="key, "val="list[key]);
    }
    print("--")
    asorti(arr, listi)
    for(key in listi){
        print("aft asorti key="key, "val="listi[key]);
    }
}
