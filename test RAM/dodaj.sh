#!/system/bin/sh

# Gdzie ja jestem !!!
# Określa położenie skryptu i umieszcza ją w zmiennej H.
H=`pwd`

echo "3\n5\n8\n9\n10\n25\n30\n5\n" > sdcard/test/testRAM.txt

W1=$(cat sdcard/test/testRAM.txt | awk '{ sum += $1 } END { print sum }')

