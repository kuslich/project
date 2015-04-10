#!/bin/bash
while  [ true ]; do
filename=$(date  +"%Y_%m-%d-%H:%M").jpg
echo $filename
nc -v -l -p 6000 > /box/"B$filename" 
killall nc
echo temp.txt
nc -v -l -p 6001 > /box/temp.txt 
killall nc
nc -v -l -p 6002 > /box/"F$filename"
done;
