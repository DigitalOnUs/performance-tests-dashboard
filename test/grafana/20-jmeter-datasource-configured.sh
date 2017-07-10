#!/bin/bash

set -e
out=$(curl --silent 'http://admin:admin@localhost:3000/api/datasources/1')
echo "$out" | grep '"name":"influxdb-jmeter"'
echo "$out" | grep '"type":"influxdb"'
echo "$out" | grep '"database":"jmeter"'
echo "$out" | grep '"isDefault":true'
set +e
