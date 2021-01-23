#!/bin/sh
### patch bm.c ###
cat > bm.patch <<- EOP
--- builder/bm.c  0000-00-00 00:00:00.000000000 +0000
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

patch < bm.patch && rm -f bm.patch
