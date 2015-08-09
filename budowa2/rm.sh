#!/bin/bash

ls > ls.txt

sed -i -e 's|rm.sh||g' ls.txt
sed -i -e 's|.repo||g' ls.txt
sed -i -e 's|ls.txt||g' ls.txt

pliki=$(cat ls.txt)

rm -rf $pliki

