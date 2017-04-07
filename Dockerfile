FROM ubuntu:14.04

MAINTAINER Mykyta Karpin <nkarpin1991@gmail.com>

COPY build-cirros /usr/bin/
RUN chmod +x /usr/bin/build-cirros

RUN mkdir /opt/build
COPY src-cirros /opt/build/

RUN apt-get update && apt-get install python grub-common -y

CMD build-cirros /opt/build