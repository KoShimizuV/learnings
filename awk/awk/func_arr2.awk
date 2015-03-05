#!/bin/awk

BEGIN{
}

function arr_push(v){
    line[length(line)] = v
}

{
    arr_push($0)
}

END{
    for(key in line){
        print line[key]
    }
}