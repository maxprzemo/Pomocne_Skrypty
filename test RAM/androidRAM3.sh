#!/system/bin/sh

#######################################################################
C1=50 # <<<<<<<<<<<<<<< Tu wpisz wartość początkową vfs_cache_pressure
#######################################################################

echo "$C1" > /proc/sys/vm/vfs_cache_pressure

# Lokalizacja pliku
H=`pwd`

while (($C1<=150)); do

# Pomiar czasu uruchamiania aplikacji i zapisanie do pliku com.quoord.tapatalkpro
(time am start -n com.quoord.tapatalkpro.activity/com.quoord.tapatalkpro.activity.directory.ics.AccountEntryActivity) &> $H/tapatalkpro.txt
sleep 5

# Pomiar czasu uruchamiania aplikacji i zapisanie do pliku com.facebook.katana
(time am start -n com.facebook.katana/com.facebook.katana.activity.FbMainTabActivity) &> $H/facebook.txt
sleep 5

# Pomiar czasu uruchamiania aplikacji i zapisanie do pliku com.android.chrome
(time am start -n com.android.chrome/com.google.android.apps.chrome.Main) &> $H/chrome.txt
sleep 5

# Pobieranie linijki z pomiarem czasu
D1=$(cat /sdcard/test/facebook.txt | grep real | awk '{print $1}')
D2=$(cat /sdcard/test/chrome.txt | grep real | awk '{print $1}')
D3=$(cat /sdcard/test/tapatalkpro.txt | grep real | awk '{print $1}')

# Zapisanie linijki "real" czas uruchamiania
echo "Czas facebook $D1" >> $H/czas.txt
echo "Czas chrome $D2" >> $H/czas.txt
echo "Czas tapatalkpro $D3" >> $H/test/czas.txt

# Pomiar pamięci RAM 
procrank | grep com.facebook.katana | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }' &>> $H/facebookRAM.txt
procrank | grep com.android.chrome | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }' &>> $H/chromeRAM.txt
procrank | grep com.quoord.tapatalkpro.activity | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }' &>> $H/tapatalkRAM.txt

# Pomiar SWAP
free | grep Swap: | awk '{print $3}'

# Dodawanie wartości C1
C1=$((10 + $C1))

# Ustawianie /proc/sys/vm/vfs_cache_pressure do wartości C1
echo "$C1" > /proc/sys/vm/vfs_cache_pressure
cat /proc/sys/vm/vfs_cache_pressure

# Zabicie aplikacji
ps | grep com.facebook.katana | awk '{print $2}' | xargs kill
ps | grep com.android.chrome | awk '{print $2}' | xargs kill
ps | grep com.quoord.tapatalkpro.activity | awk '{print $2}' | xargs kill
killall com.facebook.katana
sleep 1
done

