FROM ubuntu:xenial

MAINTAINER jasmeet.kohli@digitalonus.com

RUN apt-get update
RUN apt-get install -y openjdk-8-jre-headless
RUN apt-get install -y wget

RUN mkdir -p workspace

RUN wget --verbose -c http://ftp.ps.pl/pub/apache//jmeter/binaries/apache-jmeter-3.2.tgz -P workspace/
RUN tar -C workspace -xf workspace/apache-jmeter-3.2.tgz
COPY jmeter_script.jmx workspace/
CMD workspace/apache-jmeter-3.2/bin/./jmeter  -n -t workspace/jmeter_script.jmx
