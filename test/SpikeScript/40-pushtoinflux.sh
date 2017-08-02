#!/bin/bash

set -e
source spike-script.conf
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS

check_response()
{
	#check 2.. (always followed by 2-numerals only)
	if ! (echo "$response" | grep '2[0-9][0-9]')
	then
		exit 1
	fi
}

NOW=$(date +"%s")

#create test database 
response=$(curl -i --write-out %{http_code} --silent --output /dev/null -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE test")
check_response

##################
#get data from external server 
##################

MEMORY=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')

CPU=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS top -bn1 | grep load | awk '{printf "%.2f", $(NF-2)}')

#For the following metrics, sysstat needs to be installed
DISKREADSEC=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS iostat -dx | tail -n 2 | awk '{ print $4; }')

DISKWRITESEC=$(sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS iostat -dx | tail -n 2 | awk '{ print $5; }')

echo -e "MEMORY=$MEMORY \nCPU=$CPU \nDISKREADSEC=$DISKREADSEC \nDISKWRITESEC=$DISKWRITESEC" > vars
##################
#POST to InfluxDB
##################

#POST CPU utilization to Influxdb 
response=$(curl -i  --write-out %{http_code} --silent --output /dev/null -XPOST 'http://localhost:8086/write?db=test' --data-binary 'cpu_load_short,host=server01,region=us-west value='$CPU' '$NOW'')
check_response

#POST Memory utilization to Influxdb 
response=$(curl -i  --write-out %{http_code} --silent --output /dev/null -XPOST 'http://localhost:8086/write?db=test' --data-binary 'mem_load_short,host=server01,region=us-west value='$MEMORY' '$NOW'')
check_response

#POST Disk read to Influxdb
response=$(curl -i  --write-out %{http_code} --silent --output /dev/null -XPOST 'http://localhost:8086/write?db=test' --data-binary 'disk_read_short,host=server01,region=us-west value='$DISKREADSEC' '$NOW'')
check_response

#POST Disk write to Influxdb
response=$(curl -i  --write-out %{http_code} --silent --output /dev/null -XPOST 'http://localhost:8086/write?db=test' --data-binary 'disk_write_short,host=server01,region=us-west value='$DISKWRITESEC' '$NOW'')
check_response

#printf "Memory\t\tDisk\t\tCPU\n"
#echo "$CPU $MEMORY $DISKWRITESEC"
exit

set e+