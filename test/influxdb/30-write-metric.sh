#!/bin/bash

set -e
curl --silent -X POST http://localhost:8086/write?db=test --data-binary 'mem_load_short,host=server01,region=us-west value=56.0 50'
curl --silent -X POST 'http://localhost:8086/query?chunked=true&db=jmeter&epoch=ns&q=show+measurements' | grep --invert-match error
set +e
