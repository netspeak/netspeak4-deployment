#!/bin/sh

sudo docker build .

last=$(sudo docker images --format "{{.ID}}" | head -1)

echo "
Starting: $last
"

sudo docker rm netspeak
sudo bash start.sh "$last"