#!/bin/bash
cd ..
cd android


. build/envsetup.sh

export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.aosp

prebuilts/misc/linux-x86/ccache/ccache -M 30G
#lunch full_g2m-userdebug
#add_lunch_combo aosp_g2m-userdebug
lunch aosp_g2m-userdebug

#cd ~/0_skrypty
#./dzwiek.sh

