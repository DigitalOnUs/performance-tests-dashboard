FROM grafana/grafana:4.4.1

# Install dashboard
COPY grafana.ini /etc/grafana/
RUN mkdir /var/lib/grafana/dashboards
COPY performance-tests-dashboard.json /var/lib/grafana/dashboards/

# Configure datasources
COPY start-and-initialize.sh /
ENTRYPOINT ["/start-and-initialize.sh"]