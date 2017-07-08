#!/bin/bash

TIMEOUT=10
(( STEPS = $TIMEOUT * 8 ))

function grafana_is_up {
  set -o pipefail
  curl 'http://admin:admin@localhost:3000/api/datasources/1' | \
      grep -v 'Data source not found'
}

../../start.sh -d

t=$STEPS
until grafana_is_up; do
  sleep 0.125
  if (( t-- < 1 )); then exit 1; fi
done
