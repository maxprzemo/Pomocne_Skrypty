#!/bin/bash

cat build.prop | grep ro.lge.proximity.delay= | sed -e 's|=| |g' | awk {'print $2'}

