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
aitools/aitools3-aq-bighashmap-cpp
"
cd aitools/aitools3-aq-bighashmap-cpp
qmake aitools3-aq-bighashmap-cpp.pro
make
cd ../..

echo "
aitools/aitools3-aq-invertedindex3-cpp
"
cd aitools/aitools3-aq-invertedindex3-cpp
qmake aitools3-aq-invertedindex3-cpp.pro
make
cd ../..

echo "
netspeak/netspeak4-application-cpp
"
cd netspeak/netspeak4-application-cpp
bash build/generate-antlr4-files.sh
bash build/generate-protobuf-files.sh
qmake netspeak4-application-cpp.pro
make
cd ../..


echo "
Copy libraries
"
cp aitools/aitools3-aq-bighashmap-cpp/build/release/lib* /usr/lib
cp aitools/aitools3-aq-invertedindex3-cpp/build/release/lib* /usr/lib
cp netspeak/netspeak4-application-cpp/build/release/lib* /usr/lib


echo "
Done.
"
#eof
