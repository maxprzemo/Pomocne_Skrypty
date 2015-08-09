#!/bin/bash

find ../crxteam/out/target/product/g2m -name 'cpa_g2m-CrystalPA2*.zip' > find.txt

Plik=$(cat find.txt)
echo "$Plik"
if [ -e "$Plik" ] ; then
   echo ">>>>>>>>> Plik istnieje <<<<<<<<<"
   echo "xxxxxxxx" | sudo -S ./cp2.sh # <<<<<<<< zamiast 'xxxxx' wpisuje hasło 

else
   echo ">>>>>>>>> Plik nie istnieje <<<<<<<<<"
fi
cd ../000_AAA_ROMY
data=$(cat data.txt)
if [ -e "$Plik" ] ; then
   cp -r AIK-Linux CrystalPA2_$data/Rom/
   cd CrystalPA2_$data/Rom
   cp boot.img AIK-Linux/
   cd AIK-Linux
   ./unpackimg.sh boot.img
else
   echo ">>>>>>>>> Plik nie istnieje <<<<<<<<<"
fi

cd ~/0_skrypty
./dzwiek.sh

