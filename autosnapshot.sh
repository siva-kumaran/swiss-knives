#!/bin/bash
#This script takes a snapshot and saves it automatically to the provided path 
#with the 6 digit Date Time Group as the file name

#Couple it with cron and we have a wonderful system of automated snapshot at
#convenient frequencies ;-)
#The cron entry for this should be as follows (The first line is for every 30 minutes,
#the second line is for every minute. Get the hint?

#30 * * * * export DISPLAY=:0 && /home/user/autosnapshot.sh
#* * * * * export DISPLAY=:0 && /home/user/autosnapshot.sh

#BEGIN
ksnapshot&
sleep 1 
processid=`pidof ksnapshot`
timestamp=`date +%d%H%M%b%y`; 
dcop ksnapshot-${processid} interface slotGrab
dcop ksnapshot-${processid} interface save /home/user/Desktop/snapshots/${timestamp}
kill ${processid}
#END


#ddhhmmMonYY, #eg: 221055Feb11 indicates snapshot of 1055h on 22 Feb 2011
#dcop ksnapshot-${processid} interface setTime 1 
#dcop ksnapshot-${processid} interface slotSave
#echo "dcop ksnapshot-${processid} interface save /home/user/Desktop/snapshots/${timestamp}"
