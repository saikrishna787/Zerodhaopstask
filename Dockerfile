#!/bin/bash

FROM ubuntu:14.04

RUN apt-get update 
RUN apt-get install redis-server -y
RUN apt-get install curl -y
RUN apt-get install net-tools 

RUN cd ~

RUN curl -O https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz

RUN tar -xvf go1.12.1.linux-amd64.tar.gz -C /usr/local

WORKDIR /go/src/app

CMD service redis-server start

CMD chown -R root:root /usr/local/go

ENV DEMO_APP_ADDR=/go/src/app

ENV DEMO_REDIS_ADDR=/etc/redis

COPY /home/saikrishna/Desktop/ops-interview-task-master/ /go/src/app/
