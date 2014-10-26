#!/bin/sh

add_day () {
    local ymd=$1
    local addN=$2
    if [ ${addN} -lt 0 ] ; then
        opt="ago"
        addN=`expr ${addN} \* -1`
    fi
    date -d"${ymd} ${addN} day ${opt}" +"%Y%m%d"
}

add_week_day(){
     local ymd=$1
     local addN=$2
     _next_day_custom ${ymd} ${addN} "is_weekend"
     return $?
}

add_biz_day(){
     local ymd=$1
     local addN=$2
     _next_day_custom ${ymd} ${addN} "is_holiday"
     return $?
}

_next_day_custom(){
    local ymd=$1
    local addN=$2
    local chk_func=$3
     ymd=`add_day ${ymd} ${addN}`
     for i in `seq 1 10`
     do
        if [ `${chk_func} ${ymd}` -eq 0 ] ; then
            echo ${ymd}
            return 0
        fi
        if [ ${addN} -lt 0 ] ; then
            ymd=`add_day ${ymd} -1`
        else
            ymd=`add_day ${ymd} 1`
        fi
     done
     return 1    
}

is_weekend () {
    local ymd=$1
    dow=`date -d"${ymd}" +"%w" `
    if [ ${dow} -eq 6 ] || [ ${dow} -eq 0 ] ; then
        echo 1
    else
        echo 0
    fi
}

holiday_file=holiday.dat
is_holiday () {
    local ymd=$1
    if [ `is_weekend ${ymd}` -eq 1 ] ; then
        echo 1
        return 0
    fi
    if [ "`grep ${ymd} ${holiday_file}`" == "${ymd}" ] ; then
        echo 1
    else
        echo 0
    fi
}

first_day_of_month(){
    local ym=$1
    date -d"${ym}01" +"%Y%m01"
}

first_weekday_of_month(){
    local ym=$1
    local ymd=`first_day_of_month ${ym}`
    add_week_day ${ymd} 0
}

first_bizday_of_month(){
    local ym=$1
    local ymd=`first_day_of_month ${ym}`
    add_biz_day ${ymd} 0
}

last_day_of_month(){
    local ym=$1
    local ymd=`date -d"${ym}01 1 month" +"%Y%m01"`
    date -d"${ymd} -1 day" +"%Y%m%d"
}

last_weekday_of_month(){
    local ym=$1
    local ymd=`last_day_of_month ${ym}`
    if [ `is_weekend ${ymd}` -eq 0 ] ; then
        echo ${ymd}
    else
        add_week_day ${ymd} -1
    fi
}

last_bizday_of_month(){
    local ym=$1
    local ymd=`last_day_of_month ${ym}`
    if [ `is_holiday ${ymd}` -eq 0 ] ; then
        echo ${ymd}
    else
        add_biz_day ${ymd} -1
    fi
}

# TODO : how to return about Sunday
first_day_of_week() {
    local ymd=${1}
    for i in `seq 1 10`
    do
        local ymd_pre=`add_day ${ymd} -1`
        if [ `is_weekend ${ymd_pre}` -eq 1 ] && [ `is_weekend ${ymd}` -eq 0 ] ; then
           echo ${ymd} 
           return 0
        fi
        ymd=`add_day ${ymd} -1`
    done
}

# TODO : how to return about Saturday
last_day_of_week() {
    local ymd=${1}
    for i in `seq 1 10`
    do
        local ymd_pos=`add_day ${ymd} 1`
        if [ `is_weekend ${ymd_pos}` -eq 1 ] && [ `is_weekend ${ymd}` -eq 0 ] ; then
           echo ${ymd} 
           return 0
        fi
        ymd=`add_day ${ymd} 1`
    done
}
