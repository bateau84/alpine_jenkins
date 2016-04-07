#!/bin/bash
set -e
set -x

## Add openjdk 8 repo
apk --no-cache add curl git openssh-client jq fontconfig font-xfree86-type1 

## Prepare for Jenkins
# Add jenkins user
mkdir -p $JENKINS_HOME/plugins
chown abc:abc $JENKINS_HOME -R

# Create appfolder
mkdir -p /usr/share/jenkins/ref/init.groovy.d
cp /build/services/jenkins/init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy

# runit
mkdir -p /etc/service/jenkins
cp /build/services/jenkins/jenkins.runit /etc/service/jenkins/run
cp /build/services/jenkins/jenkins.init /etc/my_init.d/30-jenkins.sh
