#!/bin/bash

#移动变量

#bash shell工具箱中另一件工具是shift命令。bash shell的shift命令能够用来操作命令行参 数。跟字面上的意思一样，shift命令会根据它们的相对位置来移动命令行参数。
#在使用shift命令时，默认情况下它会将每个参数变量向左移动一个位置。所以，变量$3 的值会移到$2中，变量$2的值会移到$1中，而变量$1的值则会被删除(注意，变量$0的值,也就是程序名，不会改变)。
#这是遍历命令行参数的另一个好方法，尤其是在你不知道到底有多少参数时。你可以只操作 第一个参数，移动参数，然后继续操作第一个参数。


echo 
count=1
echo "未移动参数\$2的值是  $2"
while [ -n "$1" ]
do
  echo "参数 #$count = $1"
  count=$[ $count +1 ]
  shift
done

echo "移动参数之后\$2的值是 $2"
#[root@172-21-10-109 userinput]# sh mobile_variable.sh  a b c d e f       

#未移动参数$2的值是  b
#参数 #1 = a
#参数 #2 = b
#参数 #3 = c
#参数 #4 = d
#参数 #5 = e
#参数 #6 = f
#移动参数之后$2的值是 
#这个是最后输出的结果，可以看到移动过后，$2已经没有数据了，说明这个循环是吧$1输出一次，并且，把$1的值往前移动，因为$0是脚本名称无法更该，所以原来$1的值已经被删除了。

