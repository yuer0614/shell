#控制循环，循环一旦开启不一定需要等到循环结束才停止。有两个命令可以控制循环内部
#break continue
#break命令是退出循环的一个简单方法。可以用break命令来退出任意类型的循环，包括while和until循环。
#break 命令有几种跳出循环的方法
#!/bin/bash

function a(){ 		#break 第一种跳出循环方式：跳出单个循环
for test in 1 2 3 4 5 6 7 8 9 10
do 
  if [ $test -eq 5 ]	#当变量test等于5时，那么执行break命令，终止循环 
  then
  break
  else 
  echo "循环未终止"
  fi
  echo "迭代数 $test"
done
echo "循环终止"
}
#a
#for循环通常都会遍历列表中指定的所有值。但当满足if-then的条件时，shell会执行break 命令，停止for循环。这种方法同样适用于while和until循环。
function b(){
var=1
while [ $var -lt 10 ]	#如果变量var 小于10那么循环
do 
  if [ $var -eq 5 ]	#如果变量var 等于5那么终止循环
  then
  break
  fi
  echo "迭代数 $var "
  var=$[ $var + 1 ]
done
echo "循环终止"
}
#b
#for 与 while 循环中加入判断，都是if-then条件满足时，shell会终止循环

#break 跳出嵌套循环，只会跳出内循环，外循环继续执行。在处理多个循环时，break命令会自动终止你所在的最内层的循环。

function c(){		#break跳出内循环
for (( a = 1 ; a < 4 ; a++ ))	#外循环三次
do 
  echo "外层循环 $a"
  for (( b = 2 ; b < 10 ; b++)) #内循环如果不加break应该循环9次，但是判断变量b值等于5时，那么停止循环
  do
    if [ $b -eq 5 ]
    then
      break
    fi
    echo "  内循环$b"
  done
done
}
#c

#break 不仅可以跳出内循环，也可以跳出外循环。有时你在内部循环，但需要停止外部循环。break命令接受单个命令行参数值:break n
#其中n指定了要跳出的循环层级。默认情况下，n为1，表明跳出的是当前的循环。如果你将n设为2，break命令就会停止下一级的外部循环。
function d(){		##break跳出外循环
for (( a = 1 ; a<5 ; a++ ))  	#正常情况外循环应该循环四次
do 
  echo "外循环  $a"
  for (( b = 1 ; b < 100 ; b++))#正常情况内循环应该循环99次
  do 
    if [ $b -eq 4 ] #但是在第一次外循环的时候，内循环中判断了内循环第四次循环，然后终止了外循环，所以外循环只有1次，外循环被终止了内循环也就结束了
    then 
      break 2
    fi
    echo "内循环 $b"
  done
done
}
d
#注意，当shell执行了break命令后，外部循环就停止了。













