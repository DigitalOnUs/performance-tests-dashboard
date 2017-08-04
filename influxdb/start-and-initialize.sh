#!/bin/bash

influxd &

until influx -execute 'CREATE DATABASE jmeter' && influx -execute 'CREATE DATABASE snapshot'; do
  sleep 0.125;
done

wait