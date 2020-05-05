# same as the Dockerfile for the server
FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install make cmake cmake-data pkg-config qt4-default default-jdk protobuf-compiler -y

# cd to mounted dir
RUN mkdir -p /netspeak4
WORKDIR /netspeak4
