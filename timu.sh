#!/bin/bash 

read -p "判断root目录下是否存在文件:" user

if find /root/$user -type f ;then #判断有没有这个文件（有）
   if [ ! -s $user ];then  #文件是否为空
   cat /root/r$user #输出
   else
   echo "向文件追加内容" >> /root/$user #追加
   fi
 else
 touch /root/$user
 echo "向文件追加内容" >> /root/$user
 cat  /root/$user
fi




