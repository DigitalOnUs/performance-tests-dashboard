# performance-tests-dashboard

Grafana dashboard for performance test measurements collected by JMeter.

# Usage

You can start performance-tests-dashboard in regular or detached mode.

1. Regular mode
  1. To start, execute `./start.sh`.
  2. To stop, press Ctrl-C.
  3. To clean stopped containers, execute `./stop.sh`.
2. Detached mode
  1. To start, execute `./start.sh -d`.
  2. To stop and clean containers, execute `./stop.sh`.

# Test

Run `make`.

# Defaults

The default username and password of Grafana is `admin`.