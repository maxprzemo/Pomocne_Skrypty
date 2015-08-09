#!/bin/bash

T=cos.txt
if [ -e "$T" ] ; then
   echo ">>>>>>>>> Plik istnieje <<<<<<<<<"
else
   echo "Plik nie istnieje"
fi

for (( i = 0 ; i <= 5; i++ )) 
do 
echo "podejście numer $i"
done 

#grep -C 1 "USE_CAMERA_STUB" BoardConfig.mk

#find -name '*.nk' -print | xargs grep 'USE_CAMERA_STUB' > find22.txt

find -print | xargs grep "^TARGET_CPU_ABI"

echo "\$HOME"

pwd

echo "$0"

./dzwiek.sh

gnome-terminal

gnome-terminal

