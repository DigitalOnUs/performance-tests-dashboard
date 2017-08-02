#!/bin/bash


end=$((SECONDS+2400000))
#
#need to add check if sysstat is installed.
#

source SpikeScript.conf
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS
while [ $SECONDS -lt $end ]; do
##################
#get data from external server 
##################

NOW=$(date +"%s")

MEMORY=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

CPU=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS top -bn1 | grep load | awk '{printf "%.2f", $(NF-2)}')

#For the following metrics, sysstat needs to be installed
DISKREADSEC=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS iostat -dx | tail -n 2 | awk '{ print $4; }')

DISKWRITESEC=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS iostat -dx | tail -n 2 | awk '{ print $5; }')

##################
#POST to InfluxDB
##################

#meaningful db name - spikescript

#POST CPU utilization to Influxdb 
curl -i -XPOST 'http://localhost:8086/write?db=jmeter' --data-binary 'cpu_load_short,host=server01,region=us-west value='$CPU' '$NOW''

#POST Memory utilization to Influxdb 
curl -i -XPOST 'http://localhost:8086/write?db=jmeter' --data-binary 'mem_load_short,host=server01,region=us-west value='$MEMORY' '$NOW''

#POST Disk read to Influxdb
curl -i -XPOST 'http://localhost:8086/write?db=jmeter' --data-binary 'disk_read_short,host=server01,region=us-west value='$DISKREADSEC' '$NOW''

#POST Disk write to Influxdb
curl -i -XPOST 'http://localhost:8086/write?db=jmeter' --data-binary 'disk_write_short,host=server01,region=us-west value='$DISKWRITESEC' '$NOW''

#printf "Memory\t\tDisk\t\tCPU\n"
#echo "$CPU $MEMORY $DISKWRITESEC"

sleep 10
done

