#!/bin/bash


echo 
while [ -n $1]
do
  case "$1" in
    -a) echo "-a 是参数";;
    -b) param=$2
        echo "-b 是参数 ，参数值为 $param"
        shift;;
    -c) echo "Found the -c option";;
    --) shift
        break;;
    *)  echo "$1 is not an option";;
  esac
done
#
count=1
for param in $@
do
  echo "Parameter #$coutn: $param"
  
