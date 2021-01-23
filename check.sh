#!/bin/sh
echo CHECK.SH
cd builder
docker save pnscan:latest |tar -x
ls -la
