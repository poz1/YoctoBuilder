ARG TAG
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential \
    chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils \
    debianutils iputils-ping libsdl1.2-dev xterm

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd -ms /bin/bash yoctobuilder
USER yoctobuilder
WORKDIR /home/yoctobuilder
