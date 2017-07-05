#!/bin/bash

cd ../..
docker-compose stop influxdb
docker-compose rm --force influxdb