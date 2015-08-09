#!/bin/bash

I=1				# inicjujemy zmienną mówiącą o numerze elementu

adb=adb pull
for WERS in $(cat find.txt)
do
	adb pull $WERS ~/Kopie
	mv ~/Kopie/uevent ~/Kopie/uevent_$I
	echo $WERS >> wers.txt
	I=`expr $I + 1`
done

