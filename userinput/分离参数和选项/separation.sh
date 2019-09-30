#!/bin/bash

#你会经常遇到想在shell脚本中同时使用选项和参数的情况。Linux中处理这个问题的标准方 式是用特殊字符来将二者分开，该字符会告诉脚本何时选项结束以及普通参数何时开始。

#对Linux来说，这个特殊字符是双破折线(--)。shell会用双破折线来表明选项列表结束。在 双破折线之后，脚本就可以放心地将剩下的命令行参数当作参数，而不是选项来处理了。


echo

while  [ -n "$1" ]				#一个循环，如果$1不为空就一直循环 
do
 case "$1" in 					#判断$1的值，如果$1的值是-a那么就执行一句话，如果
 -a) echo "Found the -a option" ;;
 -b) echo "Found the -b option" ;;
 -c) echo "Found the -c option" ;;
 --) shift
    break ;;
 * ) echo "$1 不是一个选项";;
esac
shift
done


count=1
    for param in $@
    do
       echo "Parameter #$count: $param"
       count=$[ $count + 1 ]
    done
