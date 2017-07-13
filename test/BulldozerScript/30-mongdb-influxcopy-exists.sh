#!/bin/bash
set -e
 
string=$(mongo influxcopy --eval "db.getName()" --quiet)
if [[ $string == *"influxcopy"* ]]; then
  echo "It's there!"
else  exit 
fi
set e+
