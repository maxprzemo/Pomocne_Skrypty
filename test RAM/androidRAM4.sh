#!/system/bin/sh

#-------------------------------------------------------------------------------------------------------------------------------------------
VFS=50      # <<<<<<<<<<<<<<< Tu wpisz wartość początkową vfs_cache_pressure
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
VFSEnd=150  # <<<<<<<<<<<<<<< Tu wpisz wartość końcową vfs_cache_pressure
#-------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------
VFSstep=10  # <<<<<<<<<<<<<<< Tu wpisz wartość o jaką będzie zmieniane vfs_cache_pressure
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Ustawienie vfs_cache_pressure na wartość początkową VFS .
echo "$VFS" > /proc/sys/vm/vfs_cache_pressure
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Gdzie ja jestem !!!
# Określa położenie skryptu i umieszcza ją w zmiennej H.
H=`pwd`
# Wszystkie pliki z wynikami zostaną zapisane w tej samej lokalizacji co plik skryptu .
#-------------------------------------------------------------------------------------------------------------------------------------------

while (($VFS<=$VFSEnd)); do

#-------------------------------------------------------------------------------------------------------------------------------------------
# Uruchomienie oraz pomiar czasu uruchamiania aplikacji. Zapisanie wyniku do pliku tapatalkpro.txt
(time am start -n com.quoord.tapatalkpro.activity/com.quoord.tapatalkpro.activity.directory.ics.AccountEntryActivity) &> $H/tapatalkpro.txt
# Pobieranie linijki z pomiarem czasu i zapisanie jej do zmiennej T1 .
T1=$(cat $H/tapatalkpro.txt | grep real | awk '{print $1}')
sleep 5
# Pomiar zajmowanej przez aplikacje pamięci RAM i zapisanie jej w zmiennej T2.
T2=$(procrank | grep com.quoord.tapatalkpro.activity | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Uruchomienie oraz pomiar czasu uruchamiania aplikacji. Zapisanie wyniku do pliku messenger.txt
(time am start -n com.facebook.orca/.auth.StartScreenActivity) &> $H/messenger.txt
# Pobieranie linijki z pomiarem czasu i zapisanie jej do zmiennej M1 .
M1=$(cat $H/messenger.txt | grep real | awk '{print $1}')
sleep 5
# Pomiar zajmowanej przez aplikacje pamięci RAM i zapisanie jej w zmiennej M2.
M2=$(procrank | grep com.facebook.orca | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Uruchomienie oraz pomiar czasu uruchamiania aplikacji. Zapisanie wyniku do pliku facebook.txt
(time am start -n com.facebook.katana/com.facebook.katana.activity.FbMainTabActivity) &> $H/facebook.txt
# Pobieranie linijki z pomiarem czasu i zapisanie jej do zmiennej F1 .
F1=$(cat $H/facebook.txt | grep real | awk '{print $1}')
sleep 5
# Pomiar zajmowanej przez aplikacje pamięci RAM i zapisanie jej w zmiennej F2.
F2=$(procrank | grep com.facebook.katana | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Uruchomienie oraz pomiar czasu uruchamiania aplikacji. Zapisanie wyniku do pliku chrome.txt
(time am start -n com.android.chrome/com.google.android.apps.chrome.Main) &> $H/chrome.txt
# Pobieranie linijki z pomiarem czasu i zapisanie jej do zmiennej C1 .
C1=$(cat $H/chrome.txt | grep real | awk '{print $1}')
sleep 5
# Pomiar zajmowanej przez aplikacje pamięci RAM i zapisanie jej w zmiennej C2.
C2=$(procrank | grep com.android.chrome | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')
#-------------------------------------------------------------------------------------------------------------------------------------------

# Zapisanie linijki "real" czas uruchamiania
echo "$T1 $M1 $F1 $C1" >> $H/czas.txt

# Zapisanie pomiaru pamięci ram
echo "$T2 $M2 $F2 $C2" >> $H/ram.txt

#-------------------------------------------------------------------------------------------------------------------------------------------
# Sprawdzanie czy wszystkie aplikacje nadal pracyją 
procrank > $H/procrand.txt

T3=$(cat $H/procrand.txt | grep com.quoord.tapatalkpro.activity | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')
M3=$(cat $H/procrand.txt | grep com.facebook.orca | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')
F3=$(cat $H/procrand.txt | grep com.facebook.katana | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')
C3=$(cat $H/procrand.txt | grep com.android.chrome | awk '{print $4}' | sed -e 's|K||g' | awk '{ sum += $1 } END { print sum }')

echo "$T3 $M3 $F3 $C3" > $H/testRAM.txt

P=$(wc -w $H/testRAM.txt | awk '{print $1}')

	if [ $P == 4 ]; then
		echo "TAK"
	else
		echo "NIE"
	fi
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Pomiar SWAP
D9=$(free | grep Swap: | awk '{print $3}')
#-------------------------------------------------------------------------------------------------------------------------------------------

echo "$VFS"

#-------------------------------------------------------------------------------------------------------------------------------------------
# Dodawanie wartości VFS
VFS=$(($VFSstep + $VFS))
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Ustawianie /proc/sys/vm/vfs_cache_pressure do wartości VFS
echo "$VFS" > /proc/sys/vm/vfs_cache_pressure
#-------------------------------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------------------------
# Zabicie aplikacji
ps | grep com.facebook.katana | awk '{print $2}' | xargs kill
ps | grep com.facebook.orca | awk '{print $2}' | xargs kill
ps | grep com.android.chrome | awk '{print $2}' | xargs kill
ps | grep com.quoord.tapatalkpro.activity | awk '{print $2}' | xargs kill
#-------------------------------------------------------------------------------------------------------------------------------------------

done

