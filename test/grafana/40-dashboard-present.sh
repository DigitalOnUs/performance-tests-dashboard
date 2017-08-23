#!/bin/bash

set -e
out=$(curl --silent 'http://admin:admin@localhost:3000/api/dashboards/file/performance-tests-dashboard.json')
echo "$out" | grep '"title":"Real Time Results"'
set +e
