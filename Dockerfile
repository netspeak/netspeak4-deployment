FROM tomcat:7.0-jre8


# ################################# #
# BUILD THE WHOLE THING FROM SOURCE #
# ################################# #


ENV DEBIAN_FRONTEND noninteractive

# install some dependencies here for caching to speed up the development process
# The build process will also work without this line but when developing, this uses docker's caching to get these dependencies only once
RUN apt-get update && apt-get install make cmake cmake-data pkg-config qt4-default protobuf-compiler default-jdk -y

RUN mkdir -p /var/project/
WORKDIR /var/project/

# Antlr4: Install Antlr4 before everything else so we cache the huge installation.
COPY project/netspeak/netspeak4-application-cpp/build/install-dependencies.sh netspeak/netspeak4-application-cpp/build/
RUN bash netspeak/netspeak4-application-cpp/build/install-dependencies.sh

# copy scripts
COPY project/*.sh ./

# C++
COPY project/netspeak/netspeak4-application-cpp netspeak/netspeak4-application-cpp

RUN bash install-cpp-dependencies.sh
RUN bash build-netspeak4-application-cpp.sh

# Java
COPY project/netspeak/netspeak4-server netspeak/netspeak4-server

RUN bash install-java-dependencies.sh
# we have to export Gradle like this
ENV PATH="/opt/gradle/gradle-4.9/bin:${PATH}"

RUN bash build-netspeak4-server.sh



# ###### #
# DEPLOY #
# ###### #


# some dependencies + set Java lib path
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/usr/lib/x86_64-linux-gnu/:/usr/lib

# copy Netspeak WAR
RUN cp /var/project/netspeak/netspeak4-server/build/libs/netspeak4-server.war /usr/local/tomcat/webapps/

# unzip WAR and insert correct config
WORKDIR /usr/local/tomcat/webapps/
RUN unzip -qq netspeak4-server.war -d netspeak4-server/
COPY ./corpora/* netspeak4-server/WEB-INF/classes/


# add server config
RUN rm -f /usr/local/tomcat/conf/server.xml
COPY ./config/* /usr/local/tomcat/conf/
