#!/bin/bash

cd ../..
docker-compose stop influxdb monitor spike
docker-compose rm --force influxdb monitor spike