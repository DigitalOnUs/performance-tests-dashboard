#!/bin/bash

TIMEOUT=24

cd ../..
docker-compose up -d influxdb

t=$TIMEOUT
while ! curl -X POST 'http://localhost:8086/query?chunked=true&db=&epoch=ns&q=show+databases' &>/dev/null; do
  sleep 0.125
  if (( t-- < 1 )); then exit 1; fi
done
