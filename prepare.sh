#!/bin/sh
### get source ###
cd builder && mkdir bin && wget ftp://ftp.lysator.liu.se/pub/unix/pnscan/pnscan-1.11.tar.gz
### and unpack ###
tar zxvf pnscan-1.11.tar.gz
### prepare patch for bm.c ###
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
### and apply ###
patch -p0 <bm.patch
### copy files to build dir ###
cp *.c .. && cp *.h .. && cp Makefile ..
### and check it###
#cd .. && rm -rf pnscan-1.11 pnscan-1.11.tar.gz && echo DIR: `pwd`
cd .. && rm -rf pnscan-1.11 pnscan-1.11.tar.gz && echo DIR: `pwd` && ls -la
