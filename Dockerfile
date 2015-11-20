# Dockerfile for a base dev environment

FROM debian:stretch
MAINTAINER sergio.@wikier.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y nodejs npm ruby-compass \
    && apt-get install -y git git-core \
    && apt-get install -y wget unzip \
    && apt-get install -y openjdk-8-jdk maven
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g grunt
RUN npm install -g grunt-cli
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc

