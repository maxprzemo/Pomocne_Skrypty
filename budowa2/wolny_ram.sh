#!/bin/bash

free | grep "buffers/cache:"| awk {'print $3'}

find System_new -type f -follow | sed -e 's|System_new|/system|g' >> find.txt

