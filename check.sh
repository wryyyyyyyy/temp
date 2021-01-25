#!/bin/sh
echo READY
cd builder/B
wget https://luajit.org/download/LuaJIT-2.1.0-beta3.tar.gz
tar zxvf LuaJIT-2.1.0-beta3.tar.gz
cd LuaJIT-2.1.0-beta3 && cp ../conf/makefile -f .
make -j3
