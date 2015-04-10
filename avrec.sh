#!/bin/bash
# 
# Command line parameters: <channel> <record time in seconds> <delay time in sec
onds>
# Example: ./avcrec.sh CBSHD 600 10 (Records CBS for 10 minutes after 10 sec del
ay)
# Channels: channels.conf file in the .azap directory
#
# Kill any processes accessing the TV adpater
fuser -k /dev/dvb/adapter0/frontend0
#
# Set the output file name
tsfile=$1'1.ts'
# If the output file exists modify the file name so files aren't over written
filenum=1
while [ -e $tsfile ]
do
let filenum+=1
tsfile=$1$filenum'.ts'
if [ "$filenum" -eq "6" ]; then break; fi  #Limit is 6 recordings from the same channel
done
#
# Delay to sync with start of program
sleep $3
#
# Set channel & get azap PID
azap -r -c "jkchan2.conf" $1 &
AZAP_PID=$!
#
#Record channel & get cat PID
avconv -i /dev/dvb/adapter0/dvr0 -c:v copy -c:a copy -f mpegts $tsfile &
AVCONV_PID=$!
#
# Recording sleep time
sleep $2
#
# Kill azap & cat
kill $AZAP_PID
kill $AVCONV_PID
echo "Done!"
