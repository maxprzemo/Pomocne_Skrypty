#!/bin/bash

cd ..
cd crxteam
export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.crx

prebuilts/misc/linux-x86/ccache/ccache -M 50G

./cpa-build.sh g2m
cd ..
cd 0_skrypty

./cp.sh

