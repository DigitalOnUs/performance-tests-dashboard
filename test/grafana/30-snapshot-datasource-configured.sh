#!/bin/bash

set -e
out=$(curl --silent 'http://admin:admin@localhost:3000/api/datasources/2')
echo "$out" | grep '"name":"influxdb-snapshot"'
echo "$out" | grep '"type":"influxdb"'
echo "$out" | grep '"database":"snapshot"'
echo "$out" | grep '"isDefault":false'
set +e
