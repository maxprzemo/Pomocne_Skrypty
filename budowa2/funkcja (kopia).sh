#!/system/bin/sh

D=10

pobierz() {
	cat /proc/sys/vm/vfs_cache_pressure > sdcard/test/vfs.sh
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

for (( i = 0 ; i <= 10; i++ ))
	do
	echo "podejście numer $i"
	pobierz
	echo "vfs_cache_pressure wynosi $V"
	dodaj
	echo $sum
	echo $D
	sleep 1
	echo 80 > /proc/sys/vm/swappiness
	ps | grep com.facebook.katana | awk '{print $2}' | xargs kill
done
