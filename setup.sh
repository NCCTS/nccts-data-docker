#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export HOME=/root

# Setup nccts.org site data for unprivileged user 'sailor'
sudo -i -u sailor /docker-build/support/user_sailor.sh

# Cleanup
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
