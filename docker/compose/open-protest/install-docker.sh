#!/bin/bash
# update system
apt update

# install a few prerequisite packages
apt install -y  apt-transport-https ca-certificates curl software-properties-common

# add the GPG key for the official Docker repository

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the Docker repository 

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# install docker
apt install -y  docker-ce

#add your username to the docker group
usermod -aG docker ${USER}

# download docker compose
curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# permission execute docker compose
chmod +x /usr/local/bin/docker-compose

# permission start stop 
chmod +x start-node.sh

chmod +x stop-node.sh

######service start node
## copy
cp starbesu.service /etc/systemd/system/starbesu.service

# permission execute starbesu
chmod +x  /etc/systemd/system/starbesu.service

# enable service starbesu
systemctl enable  starbesu.service

# reload systemctl 
systemctl daemon-reload