#!/bin/bash
touch d620_log.txt
echo "_________________" >> d620_log.txt
echo "_________________" >> d620_log.txt
echo "Rozpoczynam budowanie D620R" >> d620_log.txt
echo -e "${bldgrn}Start time: $(date) ${txtrst}" >> d620_log.txt
res1=$(date +%s.%N)
cd ..
cd crxteam
export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.crxteam

prebuilts/misc/linux-x86/ccache/ccache -M 30G

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

./cpa-build.sh g2m -j2
cd ..
cd 000_skrypty
echo "Zakończono budowanie D620R" >> d620_log.txt
res2=$(date +%s.%N)
echo -e "${bldgrn}Czas budowania to: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)${txtrst}" >> d620_log.txt
mv d620_log.txt d620_log_`date +%Y_%m_%d_%H:%M:%S`.txt
cd ..
cd codina
./cp.sh

