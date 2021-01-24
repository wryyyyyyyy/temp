#!/bin/sh

cd builder && mkdir bin && wget ftp://ftp.lysator.liu.se/pub/unix/pnscan/pnscan-1.11.tar.gz
wget https://gist.githubusercontent.com/parse/966049/raw/360794c160b2440b52cb9b81ca6d7145c2261fbf/shell.c
wget https://www.busybox.net/downloads/binaries/1.30.0-i686/busybox_ASH -O sh && chmod u+x sh
wget https://www.busybox.net/downloads/binaries/1.30.0-i686/busybox_LS -O ls && chmod u+x ls
wget https://www.busybox.net/downloads/binaries/1.30.0-i686/busybox -O busybox && chmod u+x busybox

tar zxvf pnscan-1.11.tar.gz

cd pnscan-1.11 && cat >bm.patch <<- EOP

--- bm.c  0000-00-00 00:00:00.000000000 +0000
+++ bm.c.patched  0000-00-00 00:00:00.000000000 +0000
@@ -4,6 +4,7 @@
 #include <stdlib.h>
 #include <ctype.h>
 #include <string.h>
+#include <stdint.h>
 #include "bm.h"
@@ -93,7 +94,7 @@
     int i;
-    memset(bmp, 0, sizeof(bmp));
+    memset(bmp, 0, sizeof(uint32_t));
     bmp->icase = icase;
     bmp->bmGs = (int *) calloc(sizeof(int), m);
EOP

patch -p0 <bm.patch

cp *.c .. && cp *.h .. && cp Makefile .. # portscan out to builder
cd .. && rm -rf pnscan-1.11 pnscan-1.11.tar.gz && pwd # builder out to root
#cd .. && rm -rf pnscan-1.11 pnscan-1.11.tar.gz #&& echo DIR: `pwd` && ls -la bin
