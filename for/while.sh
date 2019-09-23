#!/bin/bash
#学习while 循环
#while命令的格式是:
#       while test command 
#       do
#         other commands
#       done
#		while命令中定义的test command和if-then语句(参见第12章)中的格式一模一样。可以使用任何普通的bash shell命令，或者用test命令进行条件测试，比如测试变量值。 
#		while命令的关键在于所指定的test command的退出状态码必须随着循环中运行的命令而改变。如果退出状态码不发生变化， while循环就将一直不停地进行下去。

#!/bin/bash

#		最常见的test command的用法是用方括号来检查循环命令中用到的shell变量的值。

function a(){
var1=10
while  [ $var1 -gt 0 ] #while命令定义了每次迭代时检查的测试条件 var1大于0，如果大于0 循环，小于等于0 停止循环
do
  echo $var1
  var1=$[ $var1 - 1 ] #在这些命令中，测试条件中用到的变量必须修改，否则就会陷入无限循环。在本例中，我们用shell算术来将变量值减一
done
}
#a

function b(){		#while命令允许你在while语句行定义多个测试命令。
var1=10
while echo $var1
	[ $var1 -ge 0 ]
do
    echo "这是循环里面"
    var1=$[ $var1 - 1 ] 
done
}
b
#while循环会在var1变量等于0时执行echo语句，然后将var1变量的值减一。接下来再次执 行测试命令，用于下一次迭代。echo测试命令被执行并显示了var变量的值(现在小于0了)。直 到shell执行test测试命令，whle循环才会停止。
#这说明在含有多个命令的while语句中，在每次迭代中所有的测试命令都会被执行，包括测 试命令失败的最后一次迭代。要留心这种用法。另一处要留意的是该如何指定多个测试命令。注 意，每个测试命令都出现在单独的一行上。

