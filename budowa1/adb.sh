#!/bin/bash

adb='adb shell'

#$adb cp -r sys/bus/platform/drivers/ > ~/find/

#$adb grep -lr 'OF_FULLNAME' sys/bus/platform/drivers > ~/grep.txt

$adb find -L sys/bus/platform/drivers -name 'uevent' -maxdepth 5 > ~/find.txt

#adb pull sys/bus/platform/drivers/DS/uevent ~/Kopie
#$adb cat sys/bus/platform/devices/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/driver/DIAG_CMD.0/subsystem/devices/fc342000.cti/subsystem/drivers/qcom,rpm-regulator-smd-resource/uevent

#clear

