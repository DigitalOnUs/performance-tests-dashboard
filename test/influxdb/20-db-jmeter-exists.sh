#!/bin/bash

set -e
curl --silent -X POST 'http://localhost:8086/query?chunked=true&db=&epoch=ns&q=show+databases' | grep jmeter
set +e