#!/bin/bash

# Install docker-compose
DOCKER_COMPOSE_VERSION=${1-"1.13.0"}
curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /tmp/docker-compose

sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
