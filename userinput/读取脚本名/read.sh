#!/bin/bash

#name=$(basename $0)
#if [ $name = "addem" ] 
#then 
#  total=$[ $1 + $2 ]
#  echo "计算值为 $1 + $2 = $total"
#elif [ $name = "multen" ]
#then
#  total=$[ $1 * $2  ]
#  echo "计算值为 $1 * $2 = $total"
#fi


#加强版
#name=$(basename $0)
#if [ -z "$1" -o  -z $2 ]	#-z $1 检查$1的长度是否为0，如果为0执行then中的命令，如果不为0执行else中的命令， -z $2一样， -o 是或者，如果$1或者$2其中1个长度为0那么就执行then中的命令
#then
#  echo "没有按照要求输入两个变量，请重新执行脚本"
#  exit 1
#else
#  if [ $name = "addem" ]
#  then
#    total=$[ $1 + $2 ]
#    echo "计算值为 $1 + $2 = $total"
#  elif [ $name = "multen" ]
#  then
#    total=$[ $1 * $2  ]
#    echo "计算值为 $1 * $2 = $total"
#  fi
#fi


#提升加强版
#这里就提到了 $#的概念，$#可以统计在执行脚本的时候用户输入了具体的几个变量
#name=$(basename $0)

#if [ $# -ne 2 ]
#then 
#echo "没有按照要求输入两个变量，请重新执行脚本时 跟上两个变量"
#exit 1
#else
#  if [ $name == "addem" ]
#  then
#    total=$[ $1 + $2 ]
#    echo "执行的是 $name 这个脚本，这个脚本返回的值是 $1 + $2 =$total "
#  elif [ $name == "multen" ]
#  then
#    total=$[ $1 * $2 ]
#    echo "执行的是 $name 这个脚本，这个脚本返回的值是 $1 * $2 =$total "
#  fi
#fi

#有时候需要抓取命令行上提供的所有参数。这时候不需要先用$#变量来判断命令行上有多少 参数，然后再进行遍历，你可以使用一组其他的特殊变量来解决这个问题。$@和$*
#$*变量会将命令行上提供的所有参数当作一个单词保存。这个单词包含了命令行中出现的每 一个参数值。基本上$*变量会将这些参数视为一个整体，而不是多个个体。
#$@变量会将命令行上提供的所有参数当作同一字符串中的多个独立的单词。这样 你就能够遍历所有的参数值，得到每个参数。这通常通过for命令完成。


echo "这个是\$@"  $@   #\这个是转译的意思，因为如果直接写$@显示的是$@的值，并不会显示$@
echo "这个是\$*"  $*


echo 
count=1
for a in "$*"
do 
  echo "\$* 参数 #$count = $a"
  count=$[ $count +1]
done
echo 
count=1
for a in "$@"
do
  echo "\$@ 参数 #$count = $a"
  count=$[ $count +1]
done
#[root@172-21-10-109 读取脚本名]# sh read.sh a b c d e f g h i j k l m n o p q r s t u v w x yz
#这个是$@ a b c d e f g h i j k l m n o p q r s t u v w x yz
#这个是$* a b c d e f g h i j k l m n o p q r s t u v w x yz

#$* 参数 #1 = a b c d e f g h i j k l m n o p q r s t u v w x yz

#$@ 参数 #1 = a
#$@ 参数 #2 = b
#$@ 参数 #3 = c
#$@ 参数 #4 = d
#$@ 参数 #5 = e
#$@ 参数 #6 = f
#$@ 参数 #7 = g
#$@ 参数 #8 = h
#$@ 参数 #9 = i
#$@ 参数 #10 = j
#$@ 参数 #11 = k
#这个是上面那个脚本返回的结果，可以很清楚的看出区别，$*把所有变量变成了一个变量，而$@确实分开存储了
#现在清楚多了。通过使用for命令遍历这两个特殊变量，你能看到它们是如何不同地处理命 令行参数的。$*变量会将所有参数当成单个参数，而$@变量会单独处理每个参数。这是遍历命 令行参数的一个绝妙方法。


