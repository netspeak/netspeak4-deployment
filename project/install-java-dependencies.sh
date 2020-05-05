#!/bin/sh

set -e

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# go to the dir of this script
cd "$(dirname "$0")"



echo "
Install Java dependencies
"


apt-get -y install openjdk-8-jdk wget unzip

echo "
Install Gradle 4.9
"

# make dir
mkdir -p /opt/gradle
cd /opt/gradle

# download gradle & unzip
wget https://services.gradle.org/distributions/gradle-4.9-bin.zip
unzip -d /opt/gradle gradle-4.9-bin.zip
