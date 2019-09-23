#!/bin/bash

a=$(grep yuer /etc/passwd)
echo $?
b=`grep yunnuo /etc/passwd`
echo $?

echo $a
echo $b

