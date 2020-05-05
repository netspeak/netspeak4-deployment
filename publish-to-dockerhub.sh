#!/bin/bash -e

docker login
docker build -t webis/netspeak:4.0.0 .
docker push webis/netspeak:4.0.0

