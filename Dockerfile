FROM ubuntu:14.04

MAINTAINER Mykyta Karpin <nkarpin1991@gmail.com>

COPY build-cirros /usr/bin/
RUN chmod +x /usr/bin/build-cirros

CMD ( cd /opt/build/ && build-cirros )