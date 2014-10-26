#!/bin/sh


echo "abcdef" | awk '
function split_line(chars, line, i){
    for (i=0 ; i<length(line); i++){
        chars[i]  = substr(line, i+1, 1)
    }
}

{
    split_line(chars, $0)
    for(idx=0; idx<length(chars); idx++){
        print idx "=" chars[idx];
    }
}'
