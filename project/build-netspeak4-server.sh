#!/bin/sh

set -e

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# go to the dir of this script
cd "$(dirname "$0")"



echo "
Build server
"

echo "
netspeak4-server
"
cd netspeak/netspeak4-server
gradle war
cd ../..



echo "
Done.
"
#eof
