#!/bin/bash
set -e
set -x

## Add some tools
apk --no-cache add curl git openssh-client jq fontconfig font-xfree86-type1 nss nss-dev 

# runit
mkdir -p /etc/service/jenkins
cp /build/services/jenkins/jenkins.runit /etc/service/jenkins/run
cp /build/services/jenkins/jenkins.init /etc/my_init.d/30-jenkins.sh
