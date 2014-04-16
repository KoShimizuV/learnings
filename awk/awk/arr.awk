#!/bin/awk

BEGIN{
    FS=","
}

{
    split($0, list)
}

END {
    print "N=" length(list)
    for(key in list){
        print list[key]
    }
}
