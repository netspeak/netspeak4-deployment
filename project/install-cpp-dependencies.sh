#!/bin/sh

set -e

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# go to the dir of this script
cd "$(dirname "$0")"



echo "
Install C++ dependencies
"


echo "
netspeak/netspeak4-application-cpp
"
bash netspeak/netspeak4-application-cpp/build/install-dependencies.sh
