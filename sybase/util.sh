#!/bin/sh

. ~/sybase/sybase_env.sh
. ~/util/util.sh
isql=~/sybase/isql.sh
bcp=~/sybase/bcp.sh

query () {
    if [ $# -eq 1 ] ; then
        echo "$1" | ${isql}
        return $?
    else
        ${isql} "$@"
        return $?
    fi
}

load () {
    local table=$1
    local import_path=$2
    query "use master; sp_dboption \"${SB_DB}\", \"select into/bulkcopy\", true "
    ${bcp} ${SB_DB}..${table} in ${import_path} -t, -c
}

# @usage:  import ${table} ${import_path} ${sp} ${columns}
# @usage:  import t2 tmp/import.csv , id,type,name
import_merge () {
    local table=$1
    local import_path=$2
    local sp=$3
    local columns=$4
    local table_w=${table}_w 
    create_work_table ${table} ${columns}
    load ${table_w} ${import_path}
    _merge ${table} ${columns}
}

_merge() {
    log "$0 $* Init"
    table=$1
    columns=$2
    table_w="${table}_w"
    log "table=${table}, table_w=${table_w}, columns=${columns}"
    pk_cols=`_gain_pk_cols ${table}` 
    search_cond=""
    for col in `echo ${pk_cols} | sed "s/,/\n/g"`
    do
        search_cond="${search_cond} t.${col} = w.${col} and"
    done
    search_cond=`echo ${search_cond} | sed "s/and$//"`

    update_phrase=""
    for col in `echo ${columns} | sed "s/,/\n/g"`
    do
        if [ -n "`echo ${pk_cols} | grep -w ${col}`" ] ; then
            continue
        fi
        update_phrase="${update_phrase} ${col} = w.${col},"
    done
    update_phrase=`echo ${update_phrase} | sed "s/,$//"`
    insert_values=`echo ${columns} | sed "s/^/w./" | sed "s/,/,w./g"`

    query="merge
	into ${table} t
	using ${table_w} w
	on ${search_cond}
	  when matched 
		then update set ${update_phrase} 
	  when not matched 
		then insert (${columns}) values (${insert_values})"
    query "${query}"
    log "$0 $* Done"
}

_gain_pk_cols(){
    table=$1
    query "sp_helpconstraint ${table}" | grep 'PRIMARY KEY INDEX' |  sed "s/.*PRIMARY KEY INDEX (\(.*\)).*/\1/" | sed "s/ //g"
}

create_work_table (){
    local table=$1
    if [ $# -eq 2 ] ; then
        local columns=$2
    fi
    local table_w="${table}_w"
    tmp_cols_csv=${SB_TMP}/cols_info.$$.csv
    create_w_ddl=${SB_TMP}/create_table_w.$$.ddl
    log "table=${table}, tmp_cols_csv=${tmp_cols_csv}, create_w_ddl=${create_w_ddl} columns=${columns}"

    drop_table_exe=`query_csv "select 1 from sysobjects where name = '${table_w}'"`
    if [ "${drop_table_exe}" == "1" ]  ; then
        query "drop table ${table_w}"
    fi 

    _gain_cols_info ${table} ${tmp_cols_csv} ${columns} 
    awk -F, -vtable=${table_w} 'BEGIN {
        ddl = "create table " table " ("
    }{
        name=$2
        type=$3
        len=$4
        if ( type == "int" ) {
            ddl = ddl sprintf("%s %s,", name, type)
        } else {
            ddl = ddl sprintf("%s %s(%s),", name, type, len)
        }
    } END {
        sub(",$", "", ddl);
        ddl = ddl ");"
        print ddl
    } ' ${tmp_cols_csv} > ${create_w_ddl}

    query -i ${create_w_ddl}
}

# output : id,type,name,length
_gain_cols_info(){
    table=$1
    output=$2
    if [ $# -ge 3 ] ; then
        specified_cols=$3
    fi
    tmp_cols1=${SB_TMP}/cols_info.1.$$.csv
    tmp_cols2=${SB_TMP}/cols_info.2.$$.csv
    log "table=${table}, output=${output}, specified_cols=${specified_cols}"
    log "tmp_cols1=${tmp_cols1}, tmp_cols2=${tmp_cols2}"
    query1="select c.colid, c.name, t.name, c.length
       from sysobjects o, syscolumns c, systypes t 
       where 
               o.id = c.id 
           and c.usertype = t.usertype
           and o.name = '${table}'"
    query_csv "${query1}" > ${tmp_cols1}
    chmod +rxw ${tmp_cols1} 
    if [ -z "${specified_cols}" ] ; then
        cp -p ${tmp_cols1} ${output}
        return 0
    fi
  
    if [ -s ${tmp_cols2} ] ; then 
         rm -v ${tmp_cols2}
    fi
    for col in `echo ${specified_cols} | sed "s/,/\n/g"`
    do
        grep ",${col}," ${tmp_cols1}  >> ${tmp_cols2}
    done

    if [ -s ${tmp_cols2} ] ; then
        chmod +rxw ${tmp_cols2} 
        cp -p ${tmp_cols2} ${output}
        return 0
    else
        log "[Error]${tmp_cols2} is empty"
        touch ${output}
        return 1
    fi
}

query_csv () {
    query="$1"
    query "set nocount on ; ${query}" | tail -n +3 | sed "s/^ \+//g" | sed "s/ \+$//g" | sed "s/ \+/,/g"
}
