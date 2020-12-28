ARG TAG
FROM ubuntu:20.04

ENV TZ Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN apt-get -y update && apt-get -y install \
    gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential \
    chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils \
    debianutils iputils-ping libsdl1.2-dev xterm locales sudo 

RUN dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    update-locale
    
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN git clone git://git.yoctoproject.org/poky && cd ./poky && \
    git checkout -b rocko origin/dunfel && source oe-init-build-env

USER root

