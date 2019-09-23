#!/bin/bash



coproc XXX { read pid; echo child will sleep 5s; sleep 5; echo child is waked up; kill $pid; } >&2
echo $$ >&${XXX[1]}
echo parent pid is $$ child pid is $XXX_PID
 
for ((i = 0; ;i++))
do
        echo $i
        sleep 1;
done

