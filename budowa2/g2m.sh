#!/bin/bash
cd ..
cd crxteam
export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.crxteam

prebuilts/misc/linux-x86/ccache/ccache -M 10G

./cpa-build.sh g2m -j6

