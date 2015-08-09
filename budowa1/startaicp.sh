#!/bin/bash

cd ..
cd aicp
. build/envsetup.sh
brunch d620 -j6
cd ..
cd codina
./dzwiek.sh
