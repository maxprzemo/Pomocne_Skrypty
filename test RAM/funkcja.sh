#!/bin/bash

adb='adb shell su -c'
adb1='adb shell'
D=10

pobierz() {
	$adb cat /proc/sys/vm/vfs_cache_pressure > vfs.sh
	sed -i 's/\r$//' vfs.sh
	V=`cat vfs.sh`
}

dodaj(){
	A=$V
	sum=$(($A + $D))
	#D=$((10 + $D))
	((D++))
}

cos(){
	echo 80 > /proc/sys/vm/swappiness
}

for (( i = 0 ; i <= 100; i=`expr $i + 10` ))
	do
	echo "podejście numer $i"
	pobierz
	echo "vfs_cache_pressure wynosi $V"
	dodaj
	echo $sum
	echo $D
	sleep 1
	$adb echo 80 > /proc/sys/vm/swappiness
	$adb ps | grep com.facebook.katana | awk '{print $2}' | xargs kill
done


if [ "$(adb shell dumpsys power | grep mScreenOn= | grep -oE '(true|false)')" == false ] ; then
    echo "Screen is off. Turning on."
    adb shell input keyevent 26 # wakeup
    adb shell input keyevent 82 # unlock
    echo "OK, should be on now."
else 
    echo "Screen is already on."
fi
