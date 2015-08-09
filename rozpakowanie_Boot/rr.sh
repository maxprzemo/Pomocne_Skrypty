#!/bin/bash
cd ..
cd RR
export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.rr

prebuilts/misc/linux-x86/ccache/ccache -M 20G

. build/envsetup.sh

add_lunch_combo cm_g2m-userdebug

brunch g2m

