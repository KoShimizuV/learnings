#!/bin/sh


while : 
do 

   read key
   echo "you pressed ${key}"
   if [ "${key}" == "end" ] ; then
       break
   fi
done


select option in CODE DIE
do
    echo "you selected ${option}"
    break;
done
