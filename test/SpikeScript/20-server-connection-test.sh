
#!/bin/bash

#set -e
source SpikeScript.conf
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS
sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS free -m


#set e+

