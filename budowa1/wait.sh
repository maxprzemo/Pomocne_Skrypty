#!/bin/bash


#echo $(date)

#echo 'exit'
#nowa=$(cat data.txt)
#cd 000_AAA_ROMY/Candy
mkdir Candy
echo `date +%Y_%m_%d_%H:%M:%S` > data.txt
data=$(cat data.txt)
mv Candy Candy_$data
#cp cos.txt Budowa_$nowa
#cd Budowa_$nowa

touch nowy.txt
echo "Nowy" > nowy.txt
#cd ..

ls -d Candy* > ls.txt

for (( i = 0 ; i <= 5; i++ )) 
do 
echo "podejście numer $[i+1] $nowa"
done 
find -name 'Budowa*'
ilosc=$(cat ls.txt)
echo "$ilosc"
#rm -rf $ilosc

exit

