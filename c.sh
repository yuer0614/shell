#!/bin/bash


ip=`ifconfig eth0  |grep inet |awk 'NR==1' |awk '{print $2}'`

echo $ip 


file=(`find ./ -name "2019090*"`)
echo ${file[0]}
echo ${file[1]}
echo ${file[2]}
echo ${file[3]}
echo ${file[4]}
echo ${file[5]}

