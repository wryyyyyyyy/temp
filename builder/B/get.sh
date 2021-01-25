#!/bin/bash
#wget -c "https://www.lua.org/ftp/lua-5.4.2.tar.gz"
#wget -c "https://www.cpan.org/src/5.0/perl-5.32.1.tar.gz"
#wget -c "ftp://ftp.lysator.liu.se/pub/unix/pnscan/pnscan-1.11.tar.gz"
#wget -c "https://gist.githubusercontent.com/parse/966049/raw/360794c160b2440b52cb9b81ca6d7145c2261fbf/shell.c"

wget -c "https://luajit.org/download/LuaJIT-2.1.0-beta3.tar.gz"
tar zxvf LuaJIT-2.1.0-beta3.tar.gz
cd LuaJIT-2.1.0-beta3
cp -f ../conf/Makefile . 
make -j3