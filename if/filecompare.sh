#!/bin/bash


function a(){
  read -p "检查系统是否存在这个文件并是一个目录:" filename 
    if [ -d $filename ];then
      echo "有 $filename 这个文件,并且 $filename 是一个目录" 
    else
      echo "没有 $filename 这个文件"
      mkdir $filename 
      echo "创建了名为 $filename 的一个目录"
      echo "再次检查一次有没有"
      if [ -d $filename ] ;then
        echo "目录创建成功"
      else
        echo "目录创建失败"
      fi
    fi
#rm -rf $filename
}
#a

function b(){
  read -p "检查home目录下是否存在文件" filename2
    if [ -e /home/$filename2 ] ;then
      echo "有 $filename2 这个文件"
    else 
      echo "没有 $filename2 这个文件"
    fi
}
#b

function c(){
  read -p "检查文件是否存在并且不为空" filename3
    if [ -s /home/$filename3 ] ;then
      echo "/home/$filename3 文件存在并且不为空"
    else 
      if [ -e /home/$filename3 ] ;then
        echo "/home/$filename3 文件存在但是空的"
      else
        echo "/home/$filename 文件不存在"
      fi
    fi
}
#c

function d(){

read -p "输入你要查询的文件名" filename4
echo $HOME/$filename4
if [ -d $HOME ] && [ -w $HOME/$filename4 ] ; then
echo "xixi.sh这个文件存在你可以进行写入"
else
echo "没有找到xixi.sh这个文件"
fi
}

d
