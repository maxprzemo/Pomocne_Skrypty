#!/bin/bash

I=1				# inicjujemy zmienną mówiącą o numerze elementu

for WERS in $(cat sed1.txt)
do
	grep -lr '$WERS' >> ls.txt
done

