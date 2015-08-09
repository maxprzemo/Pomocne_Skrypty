#!/bin/bash
cd ..
cd candy
export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.candy

prebuilts/misc/linux-x86/ccache/ccache -M 50G

. build/envsetup.sh

add_lunch_combo candy5_g2m-userdebug

#breakfast g2m

brunch g2m

