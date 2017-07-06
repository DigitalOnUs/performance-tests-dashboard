FROM influxdb:1.2

MAINTAINER ruslan.ledesma@digitalonus.com

# Add Omar's configuration
RUN mkdir -p /workspace
COPY additional.conf /workspace
RUN cat /workspace/additional.conf >>/etc/influxdb/influxdb.conf

# Create JMeter database
COPY start-and-initialize.sh /workspace
CMD ["/workspace/start-and-initialize.sh"]
