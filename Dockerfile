# Dockerfile for a base dev environment

FROM debian:stretch
MAINTAINER sergio.@wikier.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
    && apt-get install -y locales -qq \
    && locale-gen en_US.UTF-8 en_us \
    && dpkg-reconfigure locales \
    && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update -qq \ 
    && apt-get install -y \
        nodejs npm nodejs-legacy \
        ruby-compass \
        git git-core \
        wget \
        zip unzip \
        maven \
        openjdk-8-jdk

RUN npm install -g \
    grunt \
    grunt-cli \
    bower \
RUN echo '{ "allow_root": true }' > ~/.bowerrc

RUN apt-get clean -y  \
    && apt-get autoclean -y  \
    && apt-get autoremove -y  \
    && rm -rf /var/lib/apt/lists/*

