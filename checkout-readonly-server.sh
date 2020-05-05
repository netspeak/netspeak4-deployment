#!/bin/bash

set -e

# go to the dir of this script
cd "$(dirname "$0")"


mkdir -p project
cd project

if ! [ -x "$(command -v git)" ]; then
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

mkdir -p aitools
cd aitools
git clone https://gitlab+deploy-token-8:52JyyPqQEkGg13es2qtb@git.webis.de/aitools/aitools3-aq-bighashmap-cpp.git
git clone https://gitlab+deploy-token-9:hxvTpSBa-WHExN5RZzey@git.webis.de/aitools/aitools3-aq-invertedindex3-cpp.git
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
