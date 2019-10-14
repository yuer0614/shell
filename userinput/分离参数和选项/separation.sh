#!/bin/bash

#你会经常遇到想在shell脚本中同时使用选项和参数的情况。Linux中处理这个问题的标准方 式是用特殊字符来将二者分开，该字符会告诉脚本何时选项结束以及普通参数何时开始。

#对Linux来说，这个特殊字符是双破折线(--)。shell会用双破折线来表明选项列表结束。在 双破折线之后，脚本就可以放心地将剩下的命令行参数当作参数，而不是选项来处理了。


echo

while  [ -n "$1" ]				#一个循环，如果$1不为空就一直循环 
do
 case "$1" in 					#判断$1的值，如果$1的值是-a那么就执行一句话，并且把$1的值向左移，并把后一个值放入变量$1中
 -a) echo "Found the -a option" ;;
 -b) echo "Found the -b option" ;;
 -c) echo "Found the -c option" ;;
 --) shift					#判断$1 如果是--那么值先移除，并且退出循环,但是在外面输出出来的结果是，循环结束的值还是--之前的那个值，之后的shift把值移掉了
    break ;;
 * ) echo "$1 不是一个选项";;
esac
echo "循环刚结束的\$1变量的值 $1"
shift
echo "经历了二次shift的\$1变量的值 $1"
done


count=1						#循环结束后，经历第二次循环，是把--之后剩下的变量值进行后面的循环
    for param in $@
    do
       echo "Parameter #$count: $param"
       count=$[ $count + 1 ]
    done
