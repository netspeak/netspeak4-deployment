#!/bin/sh

HTTP_port=3000

NetspeakDataDir=~/Dokumente/data-in-production/netspeak
NetspeakLogDir=~/Schreibtisch

Name=netspeak
Image=$1 # use the first CLI arguement


sudo docker run -i --name=$Name -v $NetspeakDataDir:/netspeak-data -v $NetspeakLogDir:/var/log/netspeak -p $HTTP_port:8080 $Image

#eof
