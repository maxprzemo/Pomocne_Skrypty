#!/bin/bash

echo `date +%Y_%m_%d_%H-%M-%S` > data1.txt
data1=$(cat data1.txt)
touch d620_log.txt
echo "_________________" >> d620_log.txt
echo "_________________" >> d620_log.txt
echo "Rozpoczynam budowanie D620R" >> d620_log.txt
echo -e "${bldgrn}Start time: $(date) ${txtrst}" >> d620_log.txt
res1=$(date +%s.%N)
cd ..
cd crxteam
export USE_CCACHE=1
export CCACHE_DIR=~/.crxteam

prebuilts/misc/linux-x86/ccache/ccache -M 20G

#cd out/target/product/g2m
#rm cpa_d*.zip
#rm *.img
#rm kernel
#cd system
#rm build.prop
#cd ..
#cd obj
#rm -rf KERNEL_OBJ
#rm -rf SHARED_LIBRARIES
#cd ../../../../..

./cpa-build.sh g2m -j4 2>>plik1.txt 1>>plik1.txt
cd ..
cd 0_skrypty
echo "Zakończono budowanie D620R" >> d620_log.txt
res2=$(date +%s.%N)
echo -e "${bldgrn}Czas budowania to: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}" >> d620_log.txt
mv d620_log.txt d620_log_$data1.txt
#data=$(cat ~/000_AAA_ROMY/data.txt)
#cp d620_log_$data1.txt ~/000_AAA_ROMY/CrystalPA2_$data
#rm d620_log_$data1.txt
./cp.sh

