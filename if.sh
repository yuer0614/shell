#!/bin/bash


#if pwd
#then 
#echo  "pwd命令执行成功"
#fi


#testing nultiple commands in the then section 
#测试then里面多个命令
read -p  "输入需要查询的用户"  testuser


if grep $testuser /etc/passwd ; then
echo "This is my first command"
echo "This is my second command"
ls -a /home/$testuser/.b* ; exit 1
fi

