# performance-tests-dashboard

Grafana dashboard for performance test measurements collected by JMeter.

# Usage

Change USERNAME, PASSWORD, IPADDRESS in `1-5-2-1-SpikeScript/SpikeScript.conf` and
`test/SpikeScript/spikescript.conf`

You can start performance-tests-dashboard in regular or detached mode.

### Regular mode
  1. To start, execute `./start.sh`.
  2. To stop, press Ctrl-C.
  3. To clean stopped containers, execute `./stop.sh`.
### Detached mode
  1. To start, execute `./start.sh -d`.
  2. To stop and clean containers, execute `./stop.sh`.

# Test

Run `make`.

