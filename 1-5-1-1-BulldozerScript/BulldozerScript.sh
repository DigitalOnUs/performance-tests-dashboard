#!/bin/bash


end=$((SECONDS+2400000))
while [ $SECONDS -lt $end ]; do
#
#need to add check if sysstat is installed.
#
##################
#query last value from measurements
##################

CPUinsert=$(curl -G 'http://localhost:8086/query' --data-urlencode 'db=test' --data-urlencode 'q=select * from cpu_load_short order by desc limit 1')

Memoryinsert=$(curl -G 'http://localhost:8086/query' --data-urlencode 'db=test' --data-urlencode 'q=select * from mem_load_short order by desc limit 1')

DiskReadinsert=$(curl -G 'http://localhost:8086/query' --data-urlencode 'db=test' --data-urlencode 'q=select * from disk_read_short order by desc limit 1')

DiskWriteinsert=$(curl -G 'http://localhost:8086/query' --data-urlencode 'db=test' --data-urlencode 'q=select * from disk_write_short order by desc limit 1')

##################
#insert to mongo
##################
mongo mongodb://localhost:27017/influxcopy <<EOF
db.CPU.insert($CPUinsert)
EOF

#insert to mongo
mongo mongodb://localhost:27017/influxcopy <<EOF
db.Memory.insert($Memoryinsert)
EOF

#insert to mongo
mongo mongodb://localhost:27017/influxcopy <<EOF
db.DiskRead.insert($DiskReadinsert)
EOF

#insert to mongo
mongo mongodb://localhost:27017/influxcopy <<EOF
db.DiskWrite.insert($DiskWriteinsert)
EOF

sleep 60
done

