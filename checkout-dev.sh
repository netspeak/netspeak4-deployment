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

function cloneIfNotExists {
	if [ ! -d "$1" ] ; then
		git clone https://github.com/netspeak/$1.git
	else
		echo "$1 is already present"
	fi
}

echo "
Checkout C++ git repositories
"

mkdir -p netspeak
cd netspeak
cloneIfNotExists netspeak4-application-cpp
cd ..


echo "
Checkout Java git repositories
"

mkdir -p netspeak
cd netspeak
cloneIfNotExists netspeak4-application-java
cloneIfNotExists netspeak4-client-java
cloneIfNotExists netspeak4-server
cloneIfNotExists netspeak4-indexing
cd ..


echo "
Done.
"
