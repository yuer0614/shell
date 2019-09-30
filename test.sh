#!/bin/bash

a=1
b=2
c=4
d=$[$a * $b]
if (( $a * $b == $c ))
then
echo "返回结果为真"
else
echo "返回结果为假"
fi

