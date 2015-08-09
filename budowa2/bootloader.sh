

dd if=/dev/block/platform/msm_sdcc.1/by-name/laf of=/sdcard/laf.img

dd if=/sdcard/laf.img of=/dev/block/platform/msm_sdcc.1/by-name/laf

dd if=/dev/zero of=/dev/block/platform/msm_sdcc.1/by-name/laf

fastboot devices

fastboot oem device-info

fastboot oem unlock

dd if=/sdcard/laf.img of=/dev/block/platform/msm_sdcc.1/by-name/laf

