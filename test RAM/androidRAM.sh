#!/system/bin/sh

C1=50

for i in `seq 1 10`; do
# Pomiar czasu uruchamiania aplikacji i zapisanie do pliku
(time am start -n com.facebook.katana/com.facebook.katana.activity.FbMainTabActivity) &> /sdcard/test/facebook.txt
sleep 5

# Pobieranie linijki z pomiarem czasu
D1=$(cat /sdcard/test/facebook.txt | grep real | awk '{print $1}')

# Zapisanie linijki "real" czas uruchamiania
echo "Czas : $D1" >> /sdcard/test/czas.txt

# Pomiar pamięci RAM 
procrank | grep com.facebook.katana | awk '{print $4}' &>> /sdcard/test/facebookRAM.txt

# Ustawianie /proc/sys/vm/vfs_cache_pressure do wartości C1
echo "$C1" > /proc/sys/vm/vfs_cache_pressure
cat /proc/sys/vm/vfs_cache_pressure

# Dodawanie wartości C1
C1=$((10 + $C1))

# Zabicie aplikacji
ps | grep com.facebook.katana | awk '{print $2}' | xargs kill
# killall com.facebook.katana
sleep 1
done

