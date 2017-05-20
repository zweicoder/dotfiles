#!/bin/bash

sudo apt-get remove docker docker-engine

# For Trusty 14.04
# sudo apt-get update

# sudo apt-get install \
#      linux-image-extra-$(uname -r) \
#      linux-image-extra-virtual

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# verifying fingerprint??

# case arch
# amd64
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# armhf
# sudo add-apt-repository \
#      "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"

sudo apt-get update && sudo apt-get install docker-ce
