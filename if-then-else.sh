#!/bin/bash

#在/etc/passwd中查找名为变量testuser的用户


read -p "请输入你要查询的用户：" testuser

if grep $testuser /etc/passwd ;then
   echo "此系统已存在用户：" $testuser
else
   echo "此系统不存在用户："$testuser
     if ls -d /home/$testuser ; then 
        echo "但是，" $testuser "有一个目录"
     fi
 fi


if grep $testuser /ets/passwd ;then 
                                                                                     #在passwd中搜索用户 搜索到了结果返回为0，搜索空白返回结果为1
  										     #结果返回为空没有报错不代表命令执行成功了，返回状态码1 一般性未知错误
 
   echo "此系统已存在用户：" $testuser #grep $testuser /etc/passwd 返回结果为1 执行这条

elif   #返回结果为0那么继续判断 home目录下有没有用户文件夹
  ls -d /home/$testuser ;then
  echo "有文件夹"
else 

echo "没有文件夹"

