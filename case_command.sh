#!/bin/bash

#再尝试计算一个变量的值，在一组可能的值中寻找特定值。会怎么写

if [ $USER == "root" ]
then
  echo "hello,$USER"
  echo "Please enjoy your visit"
elif [ $USER == "yuer" ]
then
  echo "hello,$USER"
  echo "Please enjoy your visit"
elif [ $USER == "baiqi" ]
then
  echo "Special testing account"
else
  echo "Sorry, you are not allowed here"
fi
#上面那个脚本我们需要判断到底是哪个用户在执行这个脚本需要写很多elif，但是有了case命令就不需要写这么多elif了，case命令会采用列表格式来检查但个变量的多个值
#	case variable in
#	pattern1 | pattern2) commands1;; pattern3) commands2;;
#	*) default commands;;
#	esac
#case命令会将指定的变量与不同模式进行比较。如果变量和模式是匹配的，那么shell会执行 为该模式指定的命令。可以通过竖线操作符在一行中分隔出多个模式模式。星号会捕获所有与已 知模式不匹配的值。这里有个将if-then-else程序转换成用case命令的例子。


case $USER in 
root | yuer)
  echo "hello,$USER"
  echo "Please enjoy your visit";;
baiqi )
  echo "Special testing account";;
* )
  echo "Sorry, you are not allowed here"
esac

#case命令提供了一个更清晰的方法来为变量每个可能的值指定不同的选项。
