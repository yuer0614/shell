#!/bin/bash


function a(){
for test in Alabama Alaska Arizona Arkansas California Colorado
do 
echo $test
done
}
#a

function b(){
for test in Alabama Alaska Arizona Arkansas California Colorado		#循环完成之后，变量值为循环的最后一个值，除非再次赋值，不然值不变
do
echo $test
done
echo $test
test=Connecticut
echo $test
}
#b

function c(){
for test in I don't know if this'll work
do
echo $test
done
}
#c

function d(){								#shell看到了列表值中的单引号并尝试使用它们来定义一个单独的数据值，解决这个问题的两个办法用反斜杠进行转译或者用双引号
echo "原本的句子    I don't know if this'll work"
for test in I don\'t know if this\'ll work
do
echo $test
done
#for test in I "don't" know if "this'll" work
#do
#echo $test
#done
}
#d

function e(){
for test in "I don't know if this'll work"				#用双引号就会认为这个是一个单独的变量
do
echo $test
done
}
#e

function f(){
for test in Nevada New Hampshire New Mexico New York North Carolina	#当变量中存在空格，shell会把空格当作分隔符，让一个变量变成两个变量
do
    echo "Now going to $test"
done
}
#f

function g(){								#解决办法就是用双引号扩起来
for test in Nevada "New Hampshire New" Mexico "New York" North Carolina
do
    echo "Now going to $test" 
done
}
#g

function h(){		#$list变量包含了用于迭代的标准文本值列表。注意，代码还是用了另一个赋值语句向$list 变量包含的已有列表中添加(或者说是拼接)了一个值。这是向变量中存储的已有文本字符串尾 部添加文本的一个常用方法。
list="Nevada New Hampshire New Mexico New York North Carolina"
list="$list china"
for test in $list
do 
echo $test
done
}
#h

function i(){		#从命令中读取值
for test in $(cat file)
do 
   echo "打印file文件中的内容 $test"
done
}
i

function i(){           #从命令中读取值,命令中读取的值因为有特殊符号，会被shell当作分隔符，所以在判断之前先要更改shell中分隔符的判断，shell默认分隔符有分号，换行符，制表符
a=$(cat file)
echo $a
IFS.OLD=$IFS		#先把IFS初始值记下，之后改变之后，可以恢复
IFS=$'\n'		#IFS=$'\n'分隔符只能是回车符    IFS=;分隔符只能是分号   IFS=:分隔符只能是冒号   IFS=$'\n';分隔符是回车符和分号
for test in $(cat file)
do
   echo "打印file文件中的内容 $test"
done
IFS=$IFS.OLD		#恢复IFS的初始值
}
i





















