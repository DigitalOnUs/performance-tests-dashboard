#!/bin/bash

influxd &

until influx -execute 'CREATE DATABASE jmeter'; do
  sleep 0.125;
done

influx -execute 'CREATE DATABASE snapshot'

wait