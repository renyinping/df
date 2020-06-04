FROM ubuntu:18.04

RUN apt-get update &&\
    apt-get install -y sudo vim nano curl wget \
        git subversion gawk gettext zip unzip \
        build-essential ccache libncurses5-dev zlib1g-dev libssl-dev xsltproc \
        python python3 file flex &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt

WORKDIR /home/openwrt
