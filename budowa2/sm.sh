#!/bin/bash



sed -i -e 's|arm/arm-linux-androideabi-$targetgccversion/bin|arm/arm-linux-androideabi-4.8/bin|g' envsetup.sh
sed -i -e 's|arm/arm-eabi-$targetgccversion/bin|arm/arm-eabi-4.9/bin|g' envsetup.sh

