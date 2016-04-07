#!/bin/bash
set -e
set -x

## Install docker init script
cp /build/services/docker/docker.init /etc/my_init.d/11-dockerdownload.sh
