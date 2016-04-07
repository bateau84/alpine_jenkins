#!/bin/bash
set -e
set -x

apk update -f --allow-untrusted --no-cache
apk --no-cache upgrade
