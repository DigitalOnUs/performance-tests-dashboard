
#!/bin/bash

set -e
source spike-script.conf
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS
sshpass -p "$PASSWORD" ssh -tt -o "StrictHostKeyChecking no" $USERNAME@$IPADDRESS echo "connection success"
exit
set e+
