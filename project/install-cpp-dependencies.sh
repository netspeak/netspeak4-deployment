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


apt-get install make cmake cmake-data pkg-config qt4-default -y

echo "
aitools/aitools3-aq-bighashmap-cpp
"
bash aitools/aitools3-aq-bighashmap-cpp/build/install-dependencies.sh
echo "
aitools/aitools3-aq-bighashmap-cpp
"
bash aitools/aitools3-aq-invertedindex3-cpp/build/install-dependencies.sh
echo "
netspeak/netspeak4-application-cpp
"
bash netspeak/netspeak4-application-cpp/build/install-dependencies.sh
