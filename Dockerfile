FROM centos:latest

MAINTAINER rzpqyo

RUN yum -y update
RUN yum -y install yum-plugin-security wget tar gzip libaio-devel gcc make vim-enhanced
RUN yum clean all

RUN cd /usr/local/src && wget http://freecode.com/urls/3aa21b8c106cab742bf1f20d60629e3f -O fio-2.1.10.tar.gz
RUN cd /usr/local/src && tar -zxvf fio-2.1.10.tar.gz
RUN cd /usr/local/src/fio-2.1.10 && ./configure && make && make install

RUN echo '[random-read]' >> /tmp/random-read.fio
RUN echo 'rw=randread' >> /tmp/random-read.fio
RUN echo 'size=100m' >> /tmp/random-read.fio
RUN echo 'directory=/tmp' >> /tmp/random-read.fio
