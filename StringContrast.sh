#!/bin/bash

function xiangtong_if(){
read -p "输入你想输入的用户：" testuser
if  [ $USER = $testuser ] ;then #判断两个字符串是否相同，相同为真，不同为假
echo "welcome" $testuser
else
echo $?
fi
}

function butong_if(){
if [ $USER != $testuser ] ;then #判断两个字符串是否不同，不同则为真，相同为假
echo "输入的用户与当前用户不同"
else
echo "输入的用户与当前用户相同"
fi
}

function bida_if(){
a=bestball
b=hockeyif 
if [ $a > $b ] ;then
echo "$a 比 $b 大" 
else
echo "$a 比 $b 小"
fi
}

#bida_if

function stringdaxiao_if(){

a=""
if [ -n $a ] ;then #检查 变量a是否是空值，空为真，非空为假
echo "变量a是非空值"
else
echo "变量a是空值"
fi
}

stringdaxiao_if
