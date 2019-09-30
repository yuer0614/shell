#!/bin/bash



echo 
while [ -n "$1" ]
do
  case "$1" in
  -a ) echo "Found then -a option";;
  -b ) echo "Found then -a option";;
  -c ) echo "Found then -a option";;
   * ) echo "$1 is not an option";;
  esac
  shift
done

#case语句会检查每个参数是不是有效选项。如果是的话，就运行对应case语句中的命令。 不管选项按什么顺序出现在命令行上，这种方法都适用。
#case语句在命令行参数中找到一个选项，就处理一个选项。如果命令行上还提供了其他参 数，你可以在case语句的通用情况处理部分中处理。
