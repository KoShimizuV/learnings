#!/bin/awk

BEGIN{
    ENC = "\""
    OFS = "|"
    FS = ","
    TYPE_STR = "string"
    TYPE_INT = "int"
    type = ""
    buf = ""
#    split("", line)
    log_init()
}
function split_line(chars, str, i){
    for (i=0; i < length(str); i++){
        chars[i]  = substr(str, i+1, 1)
    }
}

function push_line(){
    log_d("push_line. buf="buf)
    line[length(line)] = buf
    clear_status()
}

function flush_line(n){
    log_d("flush. line length="length(line))
    n=length(line)
    for(idx=0; idx < n; idx++){
        if(n == (idx+1)){
            printf("%s\n", line[idx]);
        } else {
            printf("%s"OFS, line[idx]);
        }
    }
    split("",line)
}

function push_buf(c){
    buf = buf c;
}

function remove_buf(){
    log_d("remove_buf")
    buf = substr(buf, 1, length(buf)-1);
}

function clear_status(){
    type = null
    buf = null
}

function log_init(){
    printf("%s","") > "tmp/csv2pipe.log"
}

function log_d(msg){
    print "[debug]"msg >> "tmp/csv2pipe.log"
}

# main logic
{
    split_line(chars, $0)
    for(idx=0; idx < length(chars); idx++){
        c = chars[idx]
        log_d("idx="idx",c="c",type="type",buf="buf)
        if (type == null || type == ""){
            if (c == FS){
                push_line()
            } else if (c == ENC){
                type = TYPE_STR
            } else {
                type = TYPE_INT
                push_buf(c)
            }
            continue
        }
        if(length(buf) == 1){
            push_buf(c)
        } else if (type == TYPE_INT && c == FS){
            push_line()
        } else if (type == TYPE_STR && cl == ENC && c == FS){
            remove_buf()
            push_line()
        } else {
            push_buf(c)
        }
        cl = c
    }
    if(c == ENC){
        remove_buf()
    }
    push_line()
    flush_line()
}
