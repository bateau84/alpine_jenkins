#!/bin/bash
set -e
set -x

## Copy environment variables
cp /build/cenv/* /etc/container_environment/
