
#!/bin/bash

set -e
source SpikeScript.conf
echo $USERNAME
echo $PASSWORD
echo $IPADDRESS
sshpass -p "vagrant" ssh -tt  vagrant@192.168.88.193 echo "connection success"
exit
set e+
