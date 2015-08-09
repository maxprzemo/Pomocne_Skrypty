#!/bin/bash

Plik=$(cat find.txt)

cp $Plik ~/000_AAA_ROMY
cd ../000_AAA_ROMY
ls -d cpa_g2m-CrystalPA2*.zip > ls.txt

echo `date +%Y_%m_%d_%H-%M-%S` > data.txt
data=$(cat data.txt)
Zip=$(cat ls.txt)
mkdir CrystalPA2
mv CrystalPA2 CrystalPA2_$data
cp $Zip CrystalPA2_$data

unzip CrystalPA2_$data/$Zip -d CrystalPA2_$data/Rom

cp sdat2img CrystalPA2_$data/Rom

echo "sda2img  wypakowanie system.new.dat"

cd CrystalPA2_$data/Rom
./sdat2img system.transfer.list system.new.dat system.img

mkdir output
mkdir System_new
touch Instrukcja.txt
mount -t ext4 -o loop system.img output/

cp -r output/* System_new/

umount output
rm -rf output

echo "# Montowanie system.img" >> Instrukcja.txt
echo "sudo mount -t ext4 -o loop system.img output/" >> Instrukcja.txt
echo "" >> Instrukcja.txt
echo "# Kopiowanie plików" >> Instrukcja.txt
echo "sudo cp -r output/* System_new/" >> Instrukcja.txt
echo "" >> Instrukcja.txt
echo "# Odmontowanie" >> Instrukcja.txt
echo "sudo umount output" >> Instrukcja.txt

echo "$PWD"
cd ../..

#cp -r AIK-Linux CrystalPA2_$data/Rom/
#cd CrystalPA2_$data/Rom
#cp boot.img AIK-Linux/
#cd AIK-Linux
#./unpackimg.sh boot.img
#cd ../../..

chown -R maxprzemo:maxprzemo CrystalPA2_$data

rm $Zip


