FROM ubuntu:xenial

MAINTAINER jasmeet.kohli@digitalonus.com

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y curl
RUN apt-get install -y iproute2
RUN apt-get install -y sshpass
COPY SpikeScript.sh /
COPY SpikeScript.conf /
COPY start-and-initialize.sh /
CMD ["/start-and-initialize.sh"]