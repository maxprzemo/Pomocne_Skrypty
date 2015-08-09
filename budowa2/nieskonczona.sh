#!/bin/bash
x=1
#red=$(tput setaf 1)             #  red
while  :; do
    #find ~/RR -maxdepth 1 -name 'frameworks' > find22.txt
    #find ~/Pulpit -name 'LGD410_Android_Lollipop_D410_V20a.zip' > find22.txt
    find ~/rr2 -maxdepth 1 -name 'frameworks' > find22.txt
    find1=$(cat find22.txt)
    #du -h ~/Pulpit/LGD410_Android_Lollipop_D410_V20a.zip.crdownload > du.txt

    du -sh ~/rr2/.repo > du.txt

    du1=$(cat du.txt | awk {'print $1'})
    echo `date +%Y_%m_%d_%H-%M-%S` > data1.txt
    data1=$(cat data1.txt)
    if [ -e "$find1" ] ; then
    clear
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo "                             $data1"
    echo ""
    echo "                             >>>>>>>>> Wyłącz komputer !!!! <<<<<<<<<"
    echo "                             >>>>>>>>> Wyłącz komputer !!!! <<<<<<<<<"
    gnome-terminal -e './dzwiek.sh'
    exit

   else
clear
   echo ""
   echo ""
   echo ""
   echo ""
   echo ""
   echo "                             $data1"
   echo ""
   echo "      Pobieranie     >>>>>>>>>>>>>  $du1"
   echo ""
   echo ""
   echo "                              >>>>>>>>> Nie wyłanczać komputera !!!! <<<<<<<<<"
   echo "                              >>>>>>>>> Nie wyłanczać komputera !!!! <<<<<<<<<"
   fi

sleep 10
done
