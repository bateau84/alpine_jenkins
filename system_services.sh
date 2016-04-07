#!/bin/bash
set -e
set -x

/build/services/jenkins/jenkins.sh
/build/services/docker/docker.sh
