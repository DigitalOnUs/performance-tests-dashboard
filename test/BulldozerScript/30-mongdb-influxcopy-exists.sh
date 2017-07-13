#!/bin/bash
set -e
string='influxcopy'
if [[ $string == *"influxcopy2"* ]]; then
  echo "It's there!"
fi
set e+
