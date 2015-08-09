sudo gdisk -l /dev/ttyACM0
sudo gdisk -l /dev/serial/by-id/usb-LG_Electronics_Inc._LGE_Android_Phone_LGD62098a8b8ce-if00
sudo gdisk -l /dev/serial/by-path/pci-0000:00:13.2-usb-0:5:1.0
sudo gdisk -l /dev/hidraw3
sudo gdisk -l /dev/hidraw4
sudo ls -R /dev >> /home/maxprzemo/AAAlsdev1.txt

# Tryb download
sudo gdisk -l /dev/input/event13
sudo gdisk -l /dev/char/166:0
sudo gdisk -l /dev/char/189:153
sudo gdisk -l /dev/bus/usb/002/027
