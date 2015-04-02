#!/bin/bash
while  [ true ]; do
filename=$(date -u +"%Y_%m%d_%H_%M_%S").jpg
ddate=$(date -u +"%H")
wget -q  192.168.1.177:88
sleep  2
date >>temp.txt
grep Temp index.html
grep Temp index.html >>temp.txt
rm index.html

if [ $ddate -ge 13 ]; then
if [ $ddate -le 23 ]; then
echo $filename

raspistill -o $filename -h 960 -w 1280 -awb auto
fi;
fi;
if [ $ddate -ge 0 ]; then
if [ $ddate -le 1 ]; then
echo $filename

raspistill -o $filename -h 960 -w 1280 -awb auto
fi;
fi; 
sleep 60
done;
