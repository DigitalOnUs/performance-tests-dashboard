FROM ubuntu:xenial

MAINTAINER jasmeet.kohli@digitalonus.com

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN apt-get install -y sysstat
RUN apt-get install -y python

EXPOSE 22

RUN mkdir -p workspace

COPY fluctuator.sh workspace/
COPY assist.py workspace/

CMD /usr/sbin/sshd ; workspace/./fluctuator.sh 
