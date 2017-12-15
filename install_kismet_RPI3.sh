#!/bin/bash
# A script to install kismet bleeding edge

sudo apt-get update \
  && sudo apt-get upgrade -y \
  && sudo apt-get install -y \
    gpsd \
    gpsd-clients \
    build-essential \
    libmicrohttpd-dev \
    git \
    libnl-3-dev \
    libnl-genl-3-dev \
    libcap-dev \
    libpcap-dev \
    libncurses5-dev \
    libnm-dev \
    libdw-dev \
    libsqlite3-dev \
    && sudo apt-get remove -y wpasupplicant \
    && sudo wget -O manuf 'https://code.wireshark.org/review/gitweb?p=wireshark.git;a=blob_plain;f=manuf' \
    && sudo cp manuf /etc/. \
    && sudo rm manuf \
    && git clone https://www.kismetwireless.net/git/kismet.git \
    && cd kismet \
    && sudo ./configure \
    && sudo make -j2 \
    && sudo make suidinstall \
    && sudo usermod -a -G kismet $USER \
    && cd .. \
    && sudo reboot
