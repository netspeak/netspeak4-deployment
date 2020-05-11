#!/bin/sh

set -e

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# go to the dir of this script
cd "$(dirname "$0")"



echo "
Build Netspeak
"

echo "
netspeak/netspeak4-application-cpp
"
cd netspeak/netspeak4-application-cpp
bash build/generate-antlr4-files.sh
bash build/generate-protobuf-files.sh
qmake
make
cd ../..


echo "
Copy libraries
"
cp netspeak/netspeak4-application-cpp/build/release/lib* /usr/lib


echo "
Done.
"
#eof
