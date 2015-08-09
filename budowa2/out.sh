#!/bin/bash
while  :; do

    find1=$(find ~/rr5.1/out/target/product/g2m/ -maxdepth 1 -name 'cm-Resurrection_Remix*.zip')
    find2=`find ~/rr5.1/out -type f -follow | wc -l`
    find3=`find ~/androidcache/.rr5_1 -type f -follow | wc -l`
    find4=`find ../../../tmp -type f -follow | wc -l`

    du1=$(du -sh ~/rr5.1/out | awk {'print $1'})
    du2=$(du -sh ~/androidcache/.rr5_1 | awk {'print $1'})
    du3=$(du -sh ../../../tmp | awk {'print $1'})
    data2=`date +%H-%M-%S`
    if [ -e "$find1" ] ; then
    echo -e "  Zakończono budowanie     >>>>>>>>>>>>>  $(echo "($du1 + $du2)"|bc)"
exit

   else
   echo "Pomiar $data2"
   echo "Wielkość    /out: $du1     || Ilość plików: $find2"
   echo "Wielkość /ccache: $du2     || Ilość plików: $find3"
   echo "Wielkość /tmp: $du3        || Ilość plików: $find4"
   echo "" >> Pomiar_wielkości.txt
   echo "Czas: $data2 || Wielkość    /out: $du1 | Ilość plików: $find2 || Wielkość /ccache: $du2 | Ilość plików: $find3 || Wielkość /tmp: $du3 | Ilość plików: $find4" >> Pomiar_wielkości.txt
   fi

sleep 60
done

