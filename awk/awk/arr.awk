#!/bin/awk

BEGIN{
    FS=","
}

{
    split($0, list)
}

END {
    for(key in list){
        print list[key]
    }
}
