#!/bin/bash
res1=$(date +%s.%N)
rom=RR # <-- Tu wpisz katalog ze źródłami
cd ..

# Naprawa błędu kompilacji
sed -i -e 's|$(error stop)|# $(error stop)|g' $rom/build/core/main.mk

# Dodanie ścieżki custom toolchain
sed -i -e 's|arm/arm-linux-androideabi-$targetgccversion/bin|arm/arm-linux-androideabi-4.8/bin|g' $rom/build/envsetup.sh
sed -i -e 's|arm/arm-eabi-$targetgccversion/bin|arm/arm-eabi-4.9/bin|g' $rom/build/envsetup.sh


# Usuwanie starych plików
rm -rf $rom/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.8
rm -rf $rom/prebuilts/gcc/linux-x86/arm/arm-eabi-4.9

# Dodawanie plików SaberMod
#cp -r sabermod/arm-eabi-4.9 $rom/prebuilts/gcc/linux-x86/arm/
cp -r sabermod/arm-linux-androideabi-4.8 $rom/prebuilts/gcc/linux-x86/arm/

# Dodawanie Toolchain od JustArchi
cp -r toolchain/Toolchain $rom/prebuilts/gcc/linux-x86/arm/arm-eabi-4.9

res2=$(date +%s.%N)
echo -e "Czas kopiowania to: $(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds)"
