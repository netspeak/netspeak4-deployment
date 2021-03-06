#!/bin/bash

set -e

# go to the dir of this script
cd "$(dirname "$0")"


mkdir -p project
cd project

if ! [ -x "$(command -v git)" ]; then
	echo "Installing git..."
	apt-get install git -y
fi

# clone projects
# NOTE: This project structure is essential for the build process to work

echo "
Checkout C++ git repositories
"

mkdir -p netspeak
cd netspeak
git clone https://github.com/netspeak/netspeak4-application-cpp.git
cd ..


echo "
Checkout Java git repositories
"

mkdir -p netspeak
cd netspeak
git clone https://github.com/netspeak/netspeak4-server.git
cd ..


echo "
Done.
"
