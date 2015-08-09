#!/bin/bash
while  :; do
	cpu=`sensors | grep "CPU Temperature:" | awk {'print $3'}`
	cpu1=`sensors | grep "CPU FAN Speed:" | awk {'print $4, $5'}`
	hdd=`echo "10091983" | sudo -S hddtemp /dev/sda | awk {'print $4'}`
	echo $cpu
	echo $cpu1
	echo $hdd
sleep 2
done
