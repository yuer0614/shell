
#!/bin/bash
#one
var1=10
var2=20
var3=$(expr $var2 \* $var1)
echo "var3="$var3
 

#two
var4=$[1+3]
var5=$[var4*5]
echo "var5="$var5
 

var6=$(echo "scale=4 ; 3.44 / 5 " < bc)
 
echo $var6
 

#three
var7=$(echo "scale=10; 10 / 3 " | bc)
echo "var7="$var7
 
#four
a1=$[$var1 * $var2]
a2=$[$var3 * $var4]
echo $a1
var8=$(echo "scale=4 ; $a1 +  $a2 " |bc  )
echo "var8="$var8
 

