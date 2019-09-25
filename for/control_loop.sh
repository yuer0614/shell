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
#d
#注意，当shell执行了break命令后，外部循环就停止了。

#前四种方法是break控制循环，还有一个continue命令控制循环
#continue命令可以提前中止某次循环中的命令，但并不会完全终止整个循环。可以在循环 内部设置shell不执行命令的条件

function e(){
for (( a = 1 ; a < 15 ; a++))      #这个循环正常来说应该循环14次
 do
  if [ $a -eq 5 ] || [ $a -eq 10 ] #当if-then语句的条件被满足时（值等于5或者值等于10)，shell会执行continue命令，跳过此 次循环中剩余的命令，但整个循环还会继续。当if-then的条件不再被满足时，一切又回到正轨。
  then 
    continue
  fi
  echo  "迭代数 $a"
done
}
#e
#也可以在while和until循环中使用continue命令，但要特别小心。记住，当shell执行 continue命令时，它会跳过剩余的命令。如果你在其中某个条件里对测试条件变量进行增值， 问题就会出现。

function f(){
var=1
while echo "while 迭代数 $var "				#条件是当变量var值小于15时执行循环
  	[ $var -lt 15 ]
do
  if [ $var -gt 5 ] && [ $var -lt 10 ]	
  then
    continue
  fi
  echo "内部迭代"
var=$[ $var+1 ]
done
}
#f

#当变量var值大于5小于10时执行continue命令，那么这次的循环到此结束，判断之后的命令不再执行，所以后面的echo 和var增值命令全没有执行，那么var没有增值，就一直会终止循环。成为一个死循环。 
#在if-then的条件成立 之前，所有一切看起来都很正常，然后shell执行了continue命令。当shell执行continue命令时， 它跳过了while循环中余下的命令。不幸的是，被跳过的部分正是$var1计数变量增值的地方， 而这个变量又被用于while测试命令中。这意味着这个变量的值不会再变化了
#当然continue命令和break命令一样，continue命令也允许通过后面增加参数指定要执行哪一级循环

function g(){
for (( a = 1 ; a < 10 ; a++))		#外循环应该循环9次 
do
  echo "外循环迭代数 $a"
  for ((b = 1 ; b < 7 ; b++ ))		#内循环应该是6次
  do 
    if [ $a -gt 2 ]  && [ $a -lt 4 ]	#这个判断有点奇葩，判断的是外循环的变量，也就是当外循环当值等于3的时候会跳过一次循环，也就是外循环只有8次
    then 
    continue 
    fi
    var3=$[ $a * $b ]
    echo "   The result of $a * $b is $var3"
  done
done
}
#g

function h(){
for (( a = 1 ; a < 10 ; a++))           #外循环应该循环9次 
do
  echo "外循环迭代数 $a"
  for ((b = 1 ; b < 7 ; b++ ))          #内循环应该是6次
  do
    if [ $a -gt 2 ]  && [ $a -lt 4 ]    #这个判断有点奇葩，判断的是外循环的变量，也就是当外循环当值等于3的时候会跳过一次循环，也就是外循环只有8次
    then
    continue 2
    fi
    var3=$[ $a * $b ]
    echo "   The result of $a * $b is $var3"
  done
done
}
#h
#虽然 函数g 与函数 h返回的结果都是一样都，但是在执行的时候sh -x 把执行结果输出出来时会有不同。 continue 2跳过外循环一次，一共的执行结果也就是 6(内循环次数) *8(外循环次数，因为跳过了一次所以是一共的9次减去1次) =48次。 continue 跳过内循环一次，但是跳过之前还是会执行的，执行次数没变，只是后面返回值的时候被跳过了，所以一共执行结果也就是 6(内循环次数) * 9(外循环次数) = 54次
#此处用continue命令来停止处理循环内的命令，但会继续处理外部循环。注意，值为3的那 次迭代并没有处理任何内部循环语句，因为尽管continue命令停止了处理过程，但外部循环依 然会继续。


function i(){  			
i=0
j=0
while [ "$i" -lt 5 ]			#定义一个嵌套循环，外循环 当i 小于5 时 循环
do
  while [ "$j" -lt 5 ]			#内循环 当j 小于5 时 循环
  do
   j=$(($j+1))				#j在循环的时候每次都先+1
   if [ $j -gt 2 ] && [  $j -lt 4 ]	#然后判断 j的值是否是大于2小于4
   then					#如果是
   continue				#那么执行跳过命令
   fi
    echo $i, $j				#并且输出变量 i 与 j 的值
  done
  j=0					#结束一次内循环的时候要把内循环变量清零不然执行了一次循环，不然外循环执行了一次，内循环变量就变成了4，变成了4内循环就无法循环了。
  i=$(($i+1))
done
}
#i

#处理循环的输出

#循环返回结果有很多，在脚本中可以对输出结果进行重定向。在done后添加一个处理命令

function j(){
for file in /home/yuer/*		#定义变量file的值为/home/yuer/*下所有的文件
do 
  if [  -d "$file"  ]			#对文件进行判断	
  then 
    echo "$file 是一个目录"
  else 
    echo "$file 是一个文件"
  fi
done > output.txt			#本来应该输出在屏幕的结果，现在被重定向到了output.txt文件中，这个文件在脚本所在的文件中
}
#j

function k(){
for (( a = 1 ; a < 10 ; a++ ))
do 
  echo "这次数字是 $a"
done > test.txt
echo "命令完成"
}
#k
#shell创建了文件test.txt并将for命令的输出重定向到这个文件。shell在for命令之后正常显示了echo语句。

#这种方法同样适用于将循环结果管接给另一个命令


function l(){ 					#定义变量的五个值，每次循环输出一个值，
for test in "North Dakota" Connecticut Illinois Alabama Tennessee
do
  echo "$test 是我下次想去的地方"
done |sort					#把输出结果进行排序。
echo "命令完成" 				#最终输出的结果是排序之后的结果
}
l
#state值并没有在for命令列表中以特定次序列出。for命令的输出传给了sort命令，该命令会改变for命令输出结果的顺序。运行这个脚本实际上说明了结果已经在脚本内部排好序了。










