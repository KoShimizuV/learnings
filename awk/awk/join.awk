#!/bin/awk

BEGIN{
    FS=","
    OFS=","
    i=0
}
FILENAME ==  ARGV[1] {
    id=$1
    label[id]=$2
    ids[i]=id
    i++
}

FILENAME == ARGV[2] {
    id=$1
    price[id]=$2
}

END{
    for(key in ids){
        id=ids[key] 
        print id, label[id], price[id]
    }
}
