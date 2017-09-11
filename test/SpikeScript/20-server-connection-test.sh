
#!/bin/bash

set -e
source spikescript.conf
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS
sshpass -p "$PASSWORD" ssh -tt  $USERNAME@$IPADDRESS echo "connection success"
exit
set e+
