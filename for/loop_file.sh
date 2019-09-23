
#循环处理文件

#通过修改IFS环境变量，就能强制for命令将文件中的每行都当成单独的一个条目来处理， 即便数据中有空格也是如此。一旦从文件中提取出了单独的行，可能需要再次利用循环来提取行中的数据。

#典型的例子是处理/etc/passwd文件中的数据。这要求你逐行遍历/etc/passwd文件，并将IFS 变量的值改成冒号，这样就能分隔开每行中的各个数据段了。
#!/bin/bash
function a(){
IFS.OLD=$IFS
IFS=$'\n'
for test in $(cat /etc/passwd) 	#做了一个双循环，第一个循环把每行列出
do
  echo "值为 $test"
  IFS=:
  for value in $test
  do
     echo "$value"
  done
done
}
a
