#!/bin/bash
cd ..
cd RR

# Time of build startup
res1=$(date +%s.%N)

. build/envsetup.sh

# Setup ccache
export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.rr

prebuilts/misc/linux-x86/ccache/ccache -M 30G

add_lunch_combo cm_g2m-userdebug

brunch g2m

# Get elapsed time
res2=$(date +%s.%N)
echo "Total time elapsed: $(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)"

cd ~/0_skrypty
./dzwiek.sh

