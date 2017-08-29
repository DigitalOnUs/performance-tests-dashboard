#!/bin/bash

set -e
source spike-script.conf
source vars
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS
echo $CPU

check_response()
{
	val=$(echo $val | awk -F"," -v OFS="," ' { for(i=0;NF- i++;){sub("[.]*0+ *$","",$i)};$1=$1 }1 ')
	if echo "$response" | grep $val
	then
		echo "Match Found"
	else
		exit 1
	fi
}

response=$(curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=test" --data-urlencode "q=SELECT value FROM cpu_load_short")
val=$CPU
check_response

response=$(curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=test" --data-urlencode "q=SELECT value FROM mem_load_short")
val=$MEMORY
check_response 

response=$(curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=test" --data-urlencode "q=SELECT value FROM disk_read_short")
val=$DISKREADSEC
check_response 

response=$(curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=test" --data-urlencode "q=SELECT value FROM disk_write_short")
val=$DISKWRITESEC
check_response 


# #delete test database 
response=$(curl -i -XPOST http://localhost:8086/query --data-urlencode "q=DROP DATABASE test")
if echo "$response" | grep 4..
then
	exit 1
fi

exit

set e+
