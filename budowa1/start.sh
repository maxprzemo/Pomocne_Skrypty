#!/bin/bash
cd ..
cd Pulpit
touch CPAcodina_log.txt
echo "_________________" >> CPAcodina_log.txt
echo "_________________" >> CPAcodina_log.txt
echo "Rozpoczynam repo sync" >> CPAcodina_log.txt
echo -e "${bldgrn}Start time: $(date) ${txtrst}" >> CPAcodina_log.txt
res1=$(date +%s.%N)
cd ..
cd crx1
cd ..
cd Pulpit
echo "Zakończono repo sync" >> CPAcodina_log.txt
res2=$(date +%s.%N)
echo -e "${bldgrn}Czas repo sync to: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}" >> crystal_log.txt
echo "_________________" >> CPAcodina_log.txt
echo "_________________" >> CPAcodina_log.txt
echo 'Rozpoczynam budować codina' >> CPAcodina_log.txt
echo -e "${bldgrn}Start time: $(date) ${txtrst}" >> CPAcodina_log.txt
res1=$(date +%s.%N)
cd ..
cd crxcodina
./cpa-build.sh codina -j6 
cd ..
cd Pulpit
echo 'Koniec budowy codina' >> CPAcodina_log.txt
res2=$(date +%s.%N)
echo -e "${bldgrn}Czas budowania to: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}" >> crystal_log.txt
echo "_________________" >> crystal_log.txt
echo "_________________" >> crystal_log.txt
mv CPAcodina.txt CPAcodina_log_`date +%Y_%m_%d_%H:%M:%S`.txt
cd ..
cd codina
./dzwiek.sh

