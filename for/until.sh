#until循环与while循环刚好相反，while循环是执行到与条件不匹配时停止，而until循环是条件满足是循环停止
#until命令要求你指定一个通常返回非零退 出状态码的测试命令。只有测试命令的退出状态码不为0，bash shell才会执行循环中列出的命令。 一旦测试命令返回了退出状态码0，循环就结束。
#until 循环格式
#	until test commands
#	do
#	  other commands
#	done


#!/bin/bash
function a(){
var=20
until [ $var -le 10 ]
do
   echo "当前变量var的值"$var
   var=$[ $var - 1 ]
done
}
a

function b(){
var=100

until  echo "当前变量var的值为："$var
	[ $var -eq 0 ]
do
  echo $var
  var=$[ $var - 25 ]
done
}
b
#在每次迭代中所有的测试命令都会被执行，包括测试命令失败的最后一次迭代。要留心这种用法。另一处要留意的是该如何指定多个测试命令。注意，每个测试命令都出现在单独的一行上。
