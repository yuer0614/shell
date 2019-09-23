#循环语句可以在循环内使用任意类型的命令，包括其他循环命令。这种循环叫作嵌套循环 (nested loop)。注意，在使用嵌套循环时，你是在迭代中使用迭代，与命令运行的次数是乘积关系。不注意这点的话，有可能会在脚本中造成问题。

#!/bin/bash

#先试试for中增加for循环

function a(){
for (( a = 1 ; a<=3 ; a++ ))
do
  echo "开始循环 $a"
  for(( b = 1 ; b <=3 ; b++))
  do
    echo "内循环 $b"
  done
done
}
#a

#这个被嵌套的循环(也称为内部循环，inner loop)会在外部循环的每次迭代中遍历一次它所 有的值。注意，两个循环的do和done命令没有任何差别。bash shell知道当第一个done命令执行 时是指内部循环而非外部循环。
function b(){		#混合循环也是同一个道理，在while中增加for循环
var=20
while  [ $var -gt 15 ] #当变量var大于15时循环进行循环 
do
  echo "当前var的值" $var
  echo $var"不满足条件进行内循环"
  var=$[ $var -1 ]
  for (( a = 1 ; a<=3 ; a++))
  do
   echo "变量中$a的当前值"$a
  done
done
}
#b

function c(){		#烧脑型混合循环，until与while循环结合
a=10
until [ $a -lt 5 ] 	#当变量a小于5时停止循环
do 
  echo "外循环中的$a的值"
  b=10
  a=$[ $a - 1 ] 	
  while [ $b -lt 15 ]  #当大于等于15时停止循环
  do
    echo "内循环中$b的值"
    b=$[ $b + 1 ]
  done
done
}
c

#外部的until循环以值10开始，循环一次10-1，并进行一次内循环。内循环的值也是以10开始，循环一次10+1，直到大于或等于15停止循环。外部循环当值小于5时停止循环。每个循环都必须改变在测试条件中用到的值，否则循环就会无止尽进行下去。










