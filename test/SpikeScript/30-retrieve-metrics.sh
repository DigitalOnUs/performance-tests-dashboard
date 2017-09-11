#!/bin/bash

set -e
source SpikeScript.conf
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS

sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS echo "connection success"

MEMORY=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

CPU=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS top -bn1 | grep load | awk '{printf "%.2f", $(NF-2)}')

#For the following metrics, sysstat needs to be installed
DISKREADSEC=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS iostat -dx | tail -n 2 | awk '{ print $4; }')

DISKWRITESEC=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS iostat -dx | tail -n 2 | awk '{ print $5; }')
printf "Memory\tCPU\tDISKREAD\tDISKWRITE\n"
echo "$MEMORY	$CPU	$DISKREADSEC	$DISKWRITESEC"
exit
set e+
