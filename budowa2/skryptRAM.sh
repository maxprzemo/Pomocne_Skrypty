echo "100" > /proc/sys/vm/vfs_cache_pressure
cat /proc/sys/vm/vfs_cache_pressure
echo "80" > /proc/sys/vm/swappines
cat /proc/sys/vm/swappines

cat /sys/module/lowmemorykiller/parameters/minfree

 adb shell procrank | grep com.facebook.katana &> /sdcard/test/facebook.txt

adb shell ps | grep com.facebook.katana | awk '{print $2}' | xargs kill

ps | grep com.facebook.katana | awk '{print $2}' | xargs kill

am start -n com.facebook.katana/com.facebook.katana.activity.FbMainTabActivity

time am start -n com.facebook.katana/com.facebook.katana.activity.FbMainTabActivity



adb shell su -c procrank &> proc.txt


adb shell su -c procrank | grep 'com.facebook.katana' &> proc.txt

procrank | grep com.facebook.katana

procrank | grep com.facebook.katana | awk '{print $4}' &> /sdcard/test/facebook.txt
