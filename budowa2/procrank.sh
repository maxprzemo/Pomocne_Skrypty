#!/bin/bash

adb='adb shell su -c'
D=10
for (( i = 0 ; i <= 100; i=`expr $i + 10` ))
do 
echo "podejście numer $i"

$adb cat /proc/sys/vm/vfs_cache_pressure > vfs.sh
sed -i 's/\r$//' vfs.sh
V=`cat vfs.sh`
echo $V
A=$V
echo $A
sum=$(($A + $D))
echo $sum
D=$((1 + $D))
done 

#$adb procrank

