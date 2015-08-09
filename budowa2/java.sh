#!/bin/bash
res1=$(date +%s.%N)
rom=rr5.1 # <-- Tu wpisz katalog ze źródłami
cd ..

# Naprawa błędu kompilacji
sed -i -e 's|$(error stop)|# $(error stop)|g' $rom/build/core/main.mk
