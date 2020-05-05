#!/bin/sh

set -e

# go to the dir of this script
cd "$(dirname "$0")"

sudo docker build .

# get the image id of the image just built
last=$(sudo docker images --format "{{.ID}}" | head -1)

# start the container
sudo docker kill dev-console
sudo docker rm dev-console
sudo docker run --rm -it --entrypoint /bin/bash --name=dev-console -v ../:/netspeak $last
