#!/bin/bash
# A script to install kismap to kismet bleeding edge

git clone https://github.com/soliforte/kismap \
&& cd kismap/plugin-kismap \
&& sudo make install
