#!/bin/bash

influxd &

while ! influx -execute 'CREATE DATABASE jmeter'; do
  sleep 0.125;
done

wait