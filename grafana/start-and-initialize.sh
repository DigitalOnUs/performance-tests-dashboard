#!/bin/bash

echo 'Starting Grafana...'
/run.sh "$@" &
AddDataSources() {
  curl 'http://admin:admin@localhost:3000/api/datasources' \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"influxdb-jmeter","type":"influxdb","url":"http://influxdb:8086/","access":"proxy","isDefault":true,"database":"jmeter"}' \
  && \
  curl 'http://admin:admin@localhost:3000/api/datasources' \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"influxdb-snapshot","type":"influxdb","url":"http://influxdb:8086/","access":"proxy","database":"snapshot"}'
}
until AddDataSources; do
  echo 'Configuring Grafana...'
  sleep 1
done
echo 'Done!'
wait