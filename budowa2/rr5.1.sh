#!/bin/bash
cd ..

rom=rr5.1 # <-- Tu wpisz katalog ze źródłami

# Naprawa błędu kompilacji
sed -i -e 's|$(error stop)|# $(error stop)|g' $rom/build/core/main.mk
sed -i -e 's|$(error $(LOCAL_PATH): $(module_id) already defined by $($(module_id)))|# $(error $(LOCAL_PATH): $(module_id) already defined by $($(module_id)))|g' $rom/build/core/base_rules.mk
cd $rom

. build/envsetup.sh

# Setup ccache
export USE_CCACHE=1
export CCACHE_DIR=~/androidcache/.rr5_1

prebuilts/misc/linux-x86/ccache/ccache -M 30G

add_lunch_combo cm_g2m-userdebug

brunch g2m

cd ~/0_skrypty
./dzwiek.sh

